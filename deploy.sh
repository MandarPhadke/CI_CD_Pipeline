#!/bin/bash

# Variables
SOURCE_DIR="/home/mandar/DevOps/Assignments/CI_CD_Pipeline/"  # Source directory where the code is located
DEST_DIR="/usr/share/nginx/CI_CD_Pipeline/"      # Destination directory where the code should be copied


# Step 2: Navigate to the destination directory
echo "Navigating to the destination directory: $DEST_DIR"
cd $DEST_DIR || { echo "Failed to navigate to destination directory"; exit 1; }

# Step 3: Remove existing files in the destination directory
echo "Removing existing files in the destination directory..."
rm -rf $DEST_DIR/* || { echo "Failed to remove files from destination directory"; exit 1; }

# Step 4: Copy the latest code from the source directory to the destination directory
echo "Copying the latest code from $SOURCE_DIR to $DEST_DIR..."
cp -R $SOURCE_DIR/* $DEST_DIR/ || { echo "Failed to copy code from source to destination"; exit 1; }

# Step 7: Restart Nginx to apply changes
echo "Restarting Nginx..."
sudo systemctl restart nginx || { echo "Failed to restart Nginx"; exit 1; }

echo "Deployment completed successfully!"
