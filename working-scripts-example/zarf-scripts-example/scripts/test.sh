#!/bin/bash

files=( test1.txt test2.txt test3.txt )
for file in "${files[@]}"; do
  test -f $file && echo "$file exists with contents: $(cat $file)" || echo "$file doesn't exist"
done
