#!/usr/bin/env bash
re='^[0-9XY]+$'
hg19_positions=`jq -r '.[] | .Position' $1`
echo "[" > $2
for position in ${hg19_positions}
do
    referenceName=`echo "$position" | cut -d ":" -f 1 | tr -d '"'`
    pos=`echo "$position" | cut -d ":" -f 2 | tr -d '"'`
    if [[ $referenceName =~ $re ]]; then
        # convert to bedstring 
        # echo -e "chr${referenceName}\t${pos}\t${pos}\n" >> $3
        jq -n --arg referenceName $referenceName '.referenceName=$referenceName' | jq --arg start $pos '.start=$start' |  jq --arg pos $pos '.end=$pos' | jq '.originalCoordinate="GRCh37"' >> $2
        echo "," >> $2
    fi
done
echo "]" >> $2
# remove the last comma in the file 

