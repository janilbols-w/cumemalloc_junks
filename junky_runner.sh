#!/bin/bash
NUM_JUNKS=${1:-'1'}
JUNK_RECYCLE_TIME=${2:-'600'}
TOTAL_GMEM=15109 -6000
ORION_RATIO=$((100 / NUM_JUNKS)) 
ORION_GMEM=10 #$((TOTAL_GMEM / NUM_JUNKS)) 
echo ORION_RATIO=${ORION_RATIO}
echo ORION_GMEM=${ORION_GMEM}
echo "creating ${NUM_JUNKS} junky oriond"
for i in `seq ${NUM_JUNKS}`
do
	ORION_RATIO=$ORION_RATIO  ORION_GMEM=$ORION_GMEM ORION_RES_GROUP=NULL ./orion_junks &
done

sleep ${JUNK_RECYCLE_TIME} 

ps aux | grep orion_junks | awk '{print $2}' | xargs -I {} kill -9 {}
