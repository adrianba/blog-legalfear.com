#!/usr/bin/env bash
set -e # halt script on error

# Copy metadata if cached
[ -f .cache/.jekyll-metadata ] && cp .cache/.jekyll-metadata .

JEKYLL_ENV=production bundle exec jekyll build --incremental
bundle exec htmlproofer ./_site --disable-external --allow-hash-href --empty-alt-ignore --internal-domains legalfear.com

ls -al ./_site