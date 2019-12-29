#!/bin/bash
set -ux

FILE_NAME="${1:-paper}"

# lint tex
message=`textlint "**.tex"`

# build pdf
latexmk "$FILE_NAME.tex"

DATE=`TZ=UTC-9 date +"%Y.%m.%d.%H.%M.%S"`

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
curl -H "Authorization: token $GITHUB_TOKEN" -X POST https://uploads.github.com/repos/$GITHUB_REPOSITORY/releases/${rel_id}/assets?name=$FILE_NAME.pdf\
  --header "Content-Type: application/pdf"\
  --upload-file out/$FILE_NAME.pdf