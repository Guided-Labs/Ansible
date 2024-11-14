#!/bin/bash

# Ansible module for creating a file with specified content

# Read input parameters
content="$1"
file_path="$2"

# Create the file with the provided content
echo "$content" > "$file_path"

# Return success
echo "{\"changed\": true, \"msg\": \"File created successfully at $file_path\"}"
exit 0