#!/bin/bash
# Useful when hosting very large files in your google drive

# You need to manually generate a shareable link for the target file
fileid="randomdigits"
# Target name
filename="file.tar"
# Target dir
targ_dir="data"

# Download
mkdir -p $targ_dir && cd $targ_dir
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
cd ..
