### VALUES in seconds

IDLETIME_MIN=300 # 5 minutes: If you are idle longer than IDLETIME_MIN, startWorkTimeStamp is reset.
WORK_MAX=3600 # 1 hour: If you have been working longer than WORK_MAX without being idle longer than IDLETIME_MIN, reminder message will appear. 
SLEEP_TIME=180 # 3 minutes 

FORMAT="%Y-%m-%d %H:%M:%S"
# echo $FORMAT

NOW() {
  date "+$FORMAT"
}

tsInSeconds() {
  date -j -f "$FORMAT" "$1" "+%s"
}

timeDiff(){
  expr $1 - $2
} 



startWorkTimeStamp=$( NOW )
startAt=$( tsInSeconds "$startWorkTimeStamp" )

while true
do

  echo "-- -- -- -- -- -- -- -- --"  

  idleTimeInSeconds=`ioreg -c IOHIDSystem | awk '/HIDIdleTime/ {print $NF/1000000000; exit}'`
  idleTimeInSeconds=${idleTimeInSeconds%.*}
 
  if [ $idleTimeInSeconds -gt $IDLETIME_MIN ]
  then
    startWorkTimeStamp=$( NOW )
    echo "Resetting StartTime because of staying Idle for $IDLETIME_MIN seconds"
    startAt=$( tsInSeconds "$startWorkTimeStamp" )
  fi

  echo "idleTime is $idleTimeInSeconds seconds."
  echo "start work at $startWorkTimeStamp."
  
  endWorkTimeStamp=$(NOW)
  echo "spot time at $endWorkTimeStamp."
  endAt=$( tsInSeconds "$endWorkTimeStamp" )

  diff=$( timeDiff $endAt $startAt )
  diff=${diff%.*}
  echo "timeDiff is $diff seconds."

  if [ $diff -gt $WORK_MAX ]
  then
    echo "You have been working for more than $diff seconds."
    echo "you should be standing up and walking around."
    MESSAGE="Please stand up and walk around for 5 minutes. You have been sitting for $diff seconds."
    echo $MESSAGE
    osascript -e 'display notification "'"$MESSAGE"'" with title "Reminder"'
  fi 

  sleep $SLEEP_TIME
done
