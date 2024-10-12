#!/bin/bash

# Gets full version string from pubspec.yaml file like version: 1.0.0+1
# $1 - path to pubspec.yaml
get_full_version() {
  file_path=$1
  if [ "$file_path" ]; then
    full_version=$(grep 'version:' "$file_path" | awk '{print $2}')
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
# $1 - path to pubspec.yaml
get_code() {
  file_path=$1
  full_version=$(get_full_version "$file_path")
  trimmed_version="${full_version##* }"
  code="${trimmed_version##*+}"
  echo "$code"
}

# Set version in pubspec.yaml file
# $1 - path to pubspec.yaml
# $2 - version name (e.g., 1.0.0)
# $3 - version code (e.g., 1)
set_version() {
  file_path=$1
  version_name=$2
  version_code=$3
  if [ -z "$file_path" ] || [ -z "$version_name" ] || [ -z "$version_code" ]; then
    echo "ERROR_MISSING_ARGUMENTS" && exit 1
  fi
  sed -i '' "s/^version:.*/version: $version_name+$version_code/" "$file_path"
  # shellcheck disable=SC2181
  if [ $? -eq 0 ]; then
    echo "Version set to $version_name+$version_code in $file_path"
  else
    echo "ERROR_SETTING_VERSION" && exit 1
  fi
}

# Bump up version in pubspec.yaml file
# $1 - path to pubspec.yaml
bump_version() {
  file_path=$1
  full_version=$(get_full_version "$file_path")

  # Exit if the get_full_version function fails
  if [ $? -ne 0 ]; then
    exit 1
  fi

  # Extract version name and version code from the current version
  trimmed_version="${full_version##* }"
  version_name="${trimmed_version%+*}"
  version_code="${trimmed_version##*+}"

  # Split the version name into major, minor, and patch parts
  IFS='.' read -r -a version_parts <<< "$version_name"
  major=${version_parts[0]}
  minor=${version_parts[1]}
  patch=${version_parts[2]}

  # Increment the major version and version code
  new_major=$((major + 1))
  new_version_code=$((version_code + 2))

  # Construct the new version string
  new_version_name="$new_major.$minor.$patch"

  # Update the version in the file
  set_version "$file_path" "$new_version_name" "$new_version_code"
}

"$@"