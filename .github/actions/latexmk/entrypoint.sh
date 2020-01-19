#!/bin/bash
set -ux

ROOT_FILE="${1:-paper}"
DATE=`TZ=UTC-9 date +"%Y.%m.%d.%H.%M"`

# lint tex
message=`textlint -f pretty-error "**.tex"`

# build pdf
latexmk "$ROOT_FILE.tex"

# create release
res=$(curl -H "Authorization: token $GITHUB_TOKEN" -X POST https://api.github.com/repos/$GITHUB_REPOSITORY/releases \
-d "
{
  \"tag_name\": \"v$DATE\",
  \"target_commitish\": \"$GITHUB_SHA\",
  \"name\": \"v$DATE\",
  \"body\": \"$(perl -pe 's/\"/\\\"/g; s/\n/\\n/g;' <<< $message)\",
  \"draft\": false,
  \"prerelease\": false
}")

# extract release id
rel_id=`echo $res | jq -r '.id'`

# upload built pdf
curl -X POST https://uploads.github.com/repos/$GITHUB_REPOSITORY/releases/${rel_id}/assets?name=$ROOT_FILE.pdf \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Content-Type: application/pdf" \
  --upload-file out/$ROOT_FILE.pdf