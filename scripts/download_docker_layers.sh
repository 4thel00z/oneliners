#! /bin/bash

# 1.
image="$1"
version="$2"
folder_filter="$3"
work_dir="$4"
target_dir="$work_dir/output"

if [ $# -lt 4 ]; then
    	echo "$0 <image> <version> <folder_filter> <work_dir>"
	exit 1
fi


mkdir -p $work_dir
cd $work_dir
mkdir -p "$target_dir"

# 3. get an API token
echo "Getting an API token"
token=$(curl --silent --header 'GET' "https://auth.docker.io/token?service=registry.docker.io&scope=repository:$image:pull" | jq -r '.token')

# 4. download manifest to get layers
echo "Retrieving $image:$version layers list"
layers=$(curl --silent --request 'GET' --header "Authorization: Bearer $token" "https://registry-1.docker.io/v2/$image/manifests/$version" | jq -r '.fsLayers[].blobSum')

# 5. download and extract each layer
mkdir -p "layers/gz"
mkdir -p "layers/tar"
for i in $layers; do
  name="${i/*:/}"
  out="layers/gz/$name.gz"
  echo "Downloading layer $name"
  curl --silent --location --request 'GET' --header "Authorization: Bearer $token" "https://registry-1.docker.io/v2/$image/blobs/$i" > "$out"
  gunzip -c "$out" > "layers/tar/$name"
  rm "$out"
done

# 6. for each layer extract the actual files in the target directory
for i in layers/tar/*; do
  if tar -tf "$i" "$folder_filter" >/dev/null 2>&1; then
    echo "Extracting $i"
    tar -xf "$i" -C "$target_dir" "$folder_filter"
  else
    echo "No $folder_filter in $i, skipping"
  fi
done
rm -rf "layers"
echo "Created $target_dir"
