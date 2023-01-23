#!/bin/bash

echo "commiting the changes in the main hugo project"
DATE=$(date)
git add .
git commit -m '"'"$DATE"'"'
git push origin master

echo "generating html and moving it to the deployment directory"
hugo

echo "preparing for deployment"
cd ~/code/codingwithcarl/
rm -r *

echo "moving the contents of the public directory into the deployment directory"
mv -v /home/z/code/hugo-coder/public/* /home/z/code/codingwithcarl
cp /home/z/code/hugo-coder/repodata/* /home/z/code/codingwithcarl

echo "deployment in progress"
cd ~/code/codingwithcarl/

git status
git add .
git status
git commit -m '"'"$DATE"'"'
git push origin master

echo "deleting public folder"
cd ~/code/hugo-coder/
rm -rf public/

echo "done"