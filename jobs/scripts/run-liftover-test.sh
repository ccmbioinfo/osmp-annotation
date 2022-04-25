#!/usr/bin/env bash

bedstring=$(jq -r --arg assembly $2 '.[] | select( .originalCoordinate != $assembly) | "chr\(.referenceName)\t\(.start)\t\(.end)"' $1)

INPUT=$(mktemp /tmp/input.XXXX)

OUTPUT_LIFTED=$5
OUTPUT_UNLIFTED=$6
echo "$bedstring" >$INPUT
if [ $2 = "GRCh37"]; then
  liftOver $INPUT $4 $OUTPUT_LIFTED $OUTPUT_UNLIFTED 2>/dev/null
else
  liftOver $INPUT $3 $OUTPUT_LIFTED $OUTPUT_UNLIFTED 2>/dev/null
fi

