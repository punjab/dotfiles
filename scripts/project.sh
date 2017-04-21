#!/bin/bash

echo "Creating project structure for a new project"
echo
cp /Users/askang/.dotfiles/scripts/README.md $PWD/
echo "Adding to git.."
git init
git add .
git commit -am "Initial Commit"
echo "Added to git."
echo "Ready! Take your first step by downloading your plan to README.md"
