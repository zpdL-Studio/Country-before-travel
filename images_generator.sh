#!/bin/bash
CURDIR=$(cd $(dirname "$0"); pwd)

PUB_SPEC="${CURDIR}/pubspec.yaml"
PUB_SPEC_ASSET_PREFIX="assets/images"
PUB_SPEC_OUT="lib/res/images.dart"

PUB_SPEC_FIND_ASSET=false
PUB_SPEC_IMAGES_ARRAY=()

while read -r line; do
line_no_whitespace="$(echo -e "${line}" | tr -d '[:space:]')"
if [ $PUB_SPEC_FIND_ASSET == false ]; then
  if [ "$line_no_whitespace" == "assets:" ]
  then
    PUB_SPEC_FIND_ASSET=true
  fi
elif [[ $line_no_whitespace == "-$PUB_SPEC_ASSET_PREFIX"* ]]; then
  prefix="-$PUB_SPEC_ASSET_PREFIX"
  PUB_SPEC_IMAGES_ARRAY+=("${line_no_whitespace:${#prefix}}")
fi

done < "$PUB_SPEC"

echo "--------- ${CURDIR}/${PUB_SPEC_OUT} ---------"
echo -n "" > "${PUB_SPEC_OUT}"

write_image_file () {
  local FILE=$1
  local FILE_PATH="${FILE##*/}"
#  EXTENSION="${FILE_PATH##*.}"
#  FILE_NAME="${FILE_PATH%.*}"

  local FILE_SPLITS
  FILE_SPLITS=$(echo "${FILE:${#PUB_SPEC_ASSET_PREFIX}}" | tr "/" "\n")
  local IMAGE_ID=""

  for split in $FILE_SPLITS
  do
    if [ "$split" == "$FILE_PATH" ]
    then
      IMAGE_ID+="${FILE_PATH%.*}"
    else
      IMAGE_ID+="${split}_"
    fi
  done

  echo "$IMAGE_ID"
}


IMAGES_ID_ARRAY=()
IMAGES_PATH_ARRAY=()

for item in ${PUB_SPEC_IMAGES_ARRAY[*]}; do
#  image=$(find ${PUB_SPEC_ASSET_PREFIX}"${file_full_path}")
  FILE="${PUB_SPEC_ASSET_PREFIX}${item}"
  if [ -f "$FILE" ]; then
    echo "--------------- FILE : $FILE"
    IMAGES_PATH_ARRAY+=("$FILE")
    IMAGES_ID_ARRAY+=("$( write_image_file "$FILE" )")
  elif [ -d "$FILE" ]; then
#    file_length=${#FILE}
#    DIR=$( find "${FILE:0:file_length-1}" )
#    for file in ${DIR[*]}
    for file in "${FILE:0:${#FILE}-1}"/*
    do
      if [ -f "$file" ]; then
        echo "--------------- FILE : $file"
        IMAGES_PATH_ARRAY+=("$file")
        IMAGES_ID_ARRAY+=("$( write_image_file "$file" )")
      fi
    done
  else
    echo "$FILE does not exist."
  fi
done

{
  echo "enum images {"
  for id in ${IMAGES_ID_ARRAY[*]}
  do
  echo "  $id," >> "${PUB_SPEC_OUT}"
  done
  echo "}"
  echo ""
  echo "extension ImagesName on images {"
  echo "  String get name {"
  echo "    switch(this) {"
  for i in ${!IMAGES_ID_ARRAY[*]}
  do
  echo "      case images.${IMAGES_ID_ARRAY[i]}:"
  echo "        return '${IMAGES_PATH_ARRAY[i]}';"
  done
  echo "    }"
  echo "  }"
  echo "}"
} >> "${PUB_SPEC_OUT}"




