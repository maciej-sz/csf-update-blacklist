#!/bin/bash

# Define URL and destination file
URL="https://myip.ms/files/blacklist/csf/latest_blacklist.txt"
DEST_FILE="/etc/csf/csf.deny"

# Download the file and check if the download is successful
curl -s -f -o "$DEST_FILE" "$URL"

# Check the status of the curl command
if [ $? -eq 0 ]; then
    csf -r
    echo "Download successful. The blacklist has been updated."
else
    echo "Download failed. The blacklist was not updated."
fi
