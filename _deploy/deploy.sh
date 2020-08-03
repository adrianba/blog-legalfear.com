#!/usr/bin/env bash
set -e # halt script on error

if [[ -z "${GH_TOKEN}" ]]; then
  echo "Missing GH_TOKEN"
  exit 1
fi

# Update publish branch
STATUS=`git log -1 --pretty=oneline`
cd _site
git config user.name "GitHub Action"
git config user.email "GitHub Action"
git add .
git commit -m "Built by GitHub Action: $STATUS"
git status
GH_REPO="@github.com/adrianba/blog-legalfear.com.git"
FULL_REPO="https://$GH_TOKEN$GH_REPO"
git push --verbose $FULL_REPO publish:publish