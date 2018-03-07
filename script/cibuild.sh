#!/usr/bin/env bash
#
# Courtesy: https://jekyllrb.com/docs/continuous-integration/travis-ci/

# halt script on error
set -e

bundle exec jekyll build
bundle exec htmlproofer ./_site --disable-external
