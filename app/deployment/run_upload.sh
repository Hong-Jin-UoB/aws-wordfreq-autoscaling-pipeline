#!/usr/bin/env bash

# Upload a text file to an existing S3 bucket.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Modify the variable values below (between quotes) as required
export AWS_REGION="${AWS_REGION:-us-east-1}"

# Check an S3 bucket name is supplied
if [ -z "$1" ]
  then
    echo "No S3 bucket name supplied!"
    echo "Usage: run_upload.sh BUCKET_NAME FILE_TO_UPLOAD"
    exit 1
fi

# Check if an upload file is supplied
if [ -z "$2" ]
  then
    echo "No upload file parameter supplied!"
    echo "Usage: run_upload.sh my_bucket_name upload_file.txt"
    exit 1
fi

# Check the file exists
if [ ! -f "$2" ]
  then
    echo "File to upload not found - check filename/path!"
    exit 1
fi

# Run uploader in the shell with supplied parameters
cd "${APP_DIR}"
go run ./cmd/uploads3/main.go "$1" "$2"
