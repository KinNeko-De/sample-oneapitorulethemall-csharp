#! /bin/sh
# The version of the protoc compiler to download
currentversion="29.2"

if [ -z "$1" ]; then
  echo "Error: Missing required operation system."
  echo "Usage: $0 <ossystem>"
  printf "Example: $0 win64"
  read _
  exit 1
fi
ossystem=$1
fileextension="zip"

rm -rf ${ossystem}
mkdir ${ossystem}

downloaduri=https://github.com/protocolbuffers/protobuf/releases/download/v${currentversion}/protoc-${currentversion}-${ossystem}.${fileextension}
echo "downloading from: $downloaduri"
curl --location ${downloaduri} --remote-name
unzip "protoc-$currentversion-${ossystem}.zip" -d ${ossystem}
rm "protoc-$currentversion-${ossystem}.zip"
