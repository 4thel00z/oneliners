#
# Licensed under the GPL-3 License
#
# Author: Mohamed Mustapha Tahrioui aka. ransomware aka. 4thel00z (4thel00z@gmail.com)
#
# The intention of this software is to render PDFs to a format of choice in one line
#
#! /bin/bash


filename=$(basename -- "$1")
cp $1 $filename
docker run -v="$PWD:/data/"  --rm -t ransomwarezz/reportgen:latest $filename $2
rm $filename
