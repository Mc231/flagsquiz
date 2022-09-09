#!/bin/bash

# Gets full version string from pubspec.yaml file like version: 1.0.0+1
# $1 - path to pubspec.yaml
get_full_version() {
  file_path=$1
  if [ "$file_path" ]; then
    full_version=$(grep 'version:' "$file_path")
    if [ -n "$full_version" ]; then
      echo "$full_version"
    else
      echo "ERROR_NO_VERSION_IN_FILE:$file_path" && exit 1
    fi
   else
    echo "ERROR_VERSION_FILE_NOT_SPECIFIED" && exit 1
  fi 
 }

# Get version code from pubspec.yaml file (1.0.0+1 code is(1) it is specified after + sign)
# S1 - path fo pubspec.yaml   
get_code() {
  file_path=$1
  full_version=$(get_full_version "$file_path")
  trimmed_version="${full_version##* }"
  code="${trimmed_version##*+}"
  echo "$code"
}

"$@"