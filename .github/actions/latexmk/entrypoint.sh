#!/bin/bash
set -eux

FILE_NAME="${1:-paper}"

# lint tex
lint_message=`textlint "**.tex"`

# build pdf
latexmk "$FILE_NAME.tex"

DATE=`date +"%Y.%m.%d.%I.%M.%S"`

# create release
res=`curl -H "Authorization: token $GITHUB_TOKEN" -X POST https://api.github.com/repos/$GITHUB_REPOSITORY/releases \
-d "
{
  \"tag_name\": \"v$DATE\",
  \"target_commitish\": \"$GITHUB_SHA\",
  \"name\": \"v$DATE\",
  \"body\": \"$lint_message\",
  \"draft\": false,
  \"prerelease\": false
}"`

# extract release id
rel_id=`echo ${res} | python3 -c 'import json,sys;print(json.load(sys.stdin)["id"])'`

# upload built pdf
curl -H "Authorization: token $GITHUB_TOKEN" -X POST https://uploads.github.com/repos/$GITHUB_REPOSITORY/releases/${rel_id}/assets?name=$FILE_NAME.pdf\
  --header "Content-Type: application/pdf"\
  --upload-file out/$FILE_NAME.pdf