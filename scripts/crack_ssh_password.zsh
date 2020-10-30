#! /usr/bin/zsh
#
# System requirements:
# - docker
#
# How to invoke :
# crack_ssh_password.zsh <path-to-private-key> <path-to-wordlist>
# Make sure to use absolute paths!!

echo arguments: $1 $2

docker run --rm --entrypoint=ssh2john -v "$1:/key" -t adamoss/john-the-ripper /key > hash.txt && docker run --rm -t -v "$PWD/hash.txt:/crackme.txt" -v "$2:/wordlist.txt" adamoss/john-the-ripper /crackme.txt --wordlist=/wordlist.txt

