#!/bin/sh
# Pushes the current branch to the remote repository along with a message
# Usage: push.sh [remote] [branch] [message]
# Example: push-github.sh origin main "Fixed a bug"
# Get the remote
# Display message
echo "Welcome to the GitHub Repo Pusher!"
if [ -z "$1" ]; then
    remote="origin"
else
    remote="$1"
fi
# Get the branch
if [ -z "$2" ]; then
    branch="main"
else
    branch="$2"
fi
# Get the message
if [ -z "$3" ]; then
    message="made changes"
else
    message="$3"
fi
echo "Adding files..."
git add .
# Sleep for 1 second to allow the files to be added
sleep 1
echo "Committing files: $message"
git commit -m "$message"
# Sleep for 1 second to allow the files to be committed
sleep 1
echo "Pushing to GitHub Repo: $remote $branch"
git push -u $remote $branch
# Sleep for 1 second to allow the files to be pushed
sleep 1
# Check if the script fails
if [ $? -eq 0 ]; then
    echo "Done! Successfully pushed to GitHub Repo"
else
    echo "Error! Failed to push to GitHub Repo"
fi
