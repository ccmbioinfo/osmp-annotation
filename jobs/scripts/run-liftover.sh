#!/usr/bin/env bash

bedstring=$(echo $1 | jq -r --arg assembly $2 '.[] | select( .originalCoordinate != $assembly) | "chr\(.referenceName)\t\(.start)\t\(.end)"')

INPUT=$(mktemp /tmp/input.XXXX)
OUTPUT_LIFTED=$(mktemp /tmp/output.XXXX)
OUTPUT_UNLIFTED=$(mktemp /tmp/output_unlifted.XXXX)
echo "$bedstring" >$INPUT
if [ $2 = "GRCh37"]; then
  liftOver $INPUT $4 $OUTPUT_LIFTED $OUTPUT_UNLIFTED 2>/dev/null
else
  liftOver $INPUT $3 $OUTPUT_LIFTED $OUTPUT_UNLIFTED 2>/dev/null
fi

# assign index i to be 1 for lifted file
i=1
#assign index u to be 1 for unlifted file    since every data row is preceded by a row "#Deleted in new"
u=2

RESULT=$(mktemp /tmp/result.XXXX)

for row in $(echo $1 | jq -c '.[]'); do
  unlifted=$(sed -n ${u}p $OUTPUT_UNLIFTED)
  lifted=$(sed -n ${i}p $OUTPUT_LIFTED)
  if [ $(echo $row | jq -r .originalCoordinate) = $2 ]; then
    echo $row | jq '.currentCoordinate=.originalCoordinate' >>$RESULT
  elif [ "$unlifted" ] && [ $(echo "$unlifted" | awk '{print substr($1,4,1)}') = $(echo $row | jq -r .referenceName) ] && [ $(echo "$unlifted" | awk '{print $2}') = $(echo $row | jq -r .start) ] && [ $(echo "$unlifted" | awk '{print $3}') = $(echo $row | jq -r .end) ]; then
    echo $row | jq '.currentCoordinate=.originalCoordinate' >>$RESULT
    u=$(expr $u + 2)
  else
    echo $row | jq --arg assembly $2 '.currentCoordinate=$assembly' | jq --arg start $(echo "$lifted" | awk '{print $2}') '.start=$start' | jq --arg endPosition $(echo "$lifted" | awk '{print $3}') '.end=$endPosition' >>"$RESULT"
    u=$(expr $i + 2)
  fi
done
cat $RESULT

rm ${INPUT} ${OUTPUT_LIFTED} ${OUTPUT_UNLIFTED} ${RESULT}
