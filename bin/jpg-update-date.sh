#!/bin/bash

shopt -s nocaseglob

ADJUST_YEAR_BY=${1:-0}
ADJUST_MONTH_BY=${2:-0}
ADJUST_DAY_BY=${3:-0}
ADJUST_HOUR_BY=${4:-0}

echo "Adjusting date by ${ADJUST_YEAR_BY} years, ${ADJUST_MONTH_BY} months ${ADJUST_DAY_BY} days"

for jpgimg in $(ls -L *.jpg); do
    dto=$(exiv2 -K Exif.Photo.DateTimeOriginal $jpgimg | awk '{print $4" "$5}')
    key="Exif.Photo.DateTimeDigitized"
    exiv2 -M"set $key $dto" $jpgimg
    key="Exif.Image.DateTime"
    exiv2 -M"set $key $dto" $jpgimg
    exiv2 adjust -Y ${ADJUST_YEAR_BY} -O ${ADJUST_MONTH_BY} -D ${ADJUST_DAY_BY} -a ${ADJUST_HOUR_BY} $jpgimg
    echo $jpgimg
    exiv2 -pa -g Date $jpgimg
done

# exiv2 -M"set Exif.Photo.DateTimeDigitized 2014:01:01 01:30:48" YDXJ0001.JPG