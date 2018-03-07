#!/bin/bash
#
# Courtesy: https://savaslabs.com/2016/10/25/deploy-jekyll-with-travis.html

# Enable error reporting to the console.
set -e

# Install bundles if needed.
bundle check || bundle install

# Build the site.
gulp

# Checkout `master` and remove everything.
git clone https://${GH_TOKEN}@github.com/dstw/dstw.github.io.git ../dstw.github.io.master
cd ../dstw.github.io.master
git checkout master
rm -rf *

# Copy generated HTML site from source branch in original repository.
# Now the `master` branch will contain only the contents of the _site directory.
cp -R ../dstw.github.io/_site/* .

# Make sure we have the updated .travis.yml file so tests won't run on master.
cp ../dstw.github.io/.travis.yml .
git config user.email ${GH_EMAIL}
git config user.name "dstw-bot"

# Commit and push generated content to `master` branch.
git status
git add -A .
git status
git commit -a -m "Travis #$TRAVIS_BUILD_NUMBER"
git push --quiet origin `master` > /dev/null 2>&1
