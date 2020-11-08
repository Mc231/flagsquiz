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

# Set version in pubspec.yaml, requires 3 paramers
# S1 - path fo pubspec.yaml 
# $2 - version (1.0.0)
# $3 - version code (1)
set_version() {
  file_path=$1
  if [ -z "$file_path" ]; then
   echo "ERROR_VERSION_FILE_NOT_SPECIFIED" && exit 1
  fi
  
  old_version_string=$(get_full_version "$file_path")

  version=$2
  if [ -z "$version" ]; then
    echo "ERROR_VERSION_NOT_SPECIFIED" && exit 1
  fi
 
  code=$3
  if [ -z "$code" ]; then
    echo "ERROR_CODE_NOT_SPECIFIED" && exit 1
  fi 

  new_version_string="version: ${version}+${code}"
  sed -i '' "s/$old_version_string/$new_version_string/" "$file_path"
  echo "Replaced: ${old_version_string} with: ${new_version_string}"
}

#get_code $1

#get_full_version $1

set_version "$1" "$2" "$3"


#result=$(get_code $1)
#echo result
