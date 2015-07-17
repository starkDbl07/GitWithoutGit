#!/bin/bash

file="$1"; 
(echo -n "blob "`wc -c $file  | awk '{print $1}'`; echo -en "\00"; cat $file) > testblob
hash_file_name=$(openssl sha1 testblob | awk -F'= ' '{print $2}')
dir_name=$(echo "$hash_file_name" | cut -c 1-2)
file_name=$(echo "$hash_file_name" | cut -c 3-)
git_object=".git/objects/$dir_name/$file_name"

echo "$git_object"
mkdir .git/objects/$dir_name
python -c 'import zlib; import sys; content=open("testblob").read(); sys.stdout.write(zlib.compress(content,1))' > .git/objects/$dir_name/$file_name
