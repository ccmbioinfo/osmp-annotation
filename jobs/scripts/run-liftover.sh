#!/bin/bash

bedstring=`echo $1 | jq -r --arg assembly $2  '.[] | select( .originalCoordinate != $assembly) | "chr\(.referenceName)\t\(.start)\t\(.end)"'`

INPUT=`mktemp /tmp/input.XXXX`
OUTPUT_LIFTED=`mktemp /tmp/output.XXXX`
OUTPUT_UNLIFTED=`mktemp /tmp/output_unlifted.XXXX`
echo "$bedstring"> $INPUT
if [ $2 = "GRCh37"]
then 
  liftOver $INPUT $4 $OUTPUT_LIFTED $OUTPUT_UNLIFTED 2>/dev/null
else 
  liftOver $INPUT $3 $OUTPUT_LIFTED $OUTPUT_UNLIFTED 2>/dev/null  
fi

lifted=`cat $OUTPUT_LIFTED | awk '{print $2}'`

# # there will be a `#Deleted in...` line for every unlifted pos
unlifted=`cat $OUTPUT_UNLIFTED | awk '/#.\+/d {print $2}'`

# echo "${lifted}|${unlifted}"
# merge Results with original input JSON, if a variant has originalCoordinate != $assembly, if its position is in lifted, replace it. 
# if its position is in unlifted, pass




