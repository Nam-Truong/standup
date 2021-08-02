PROCNAME=standupReminder.sh

ts=`date +"%T"`
# ts=`date +%H:%M:%S`


helpFunction()
{
   echo ""
   echo "Usage: $0 <OPTION>"
   echo -e "\tOPTIONs: "
   echo -e "\t- start: kill all running processes of $PROCNAME. Then, start new one."
   echo -e "\t- stop: kill all running processes of $PROCNAME."
   exit 1 # Exit script after printing help
}


is_proc_running() {
  proc_list=`pgrep -f $1 | sort | wc -l`
  if [ $proc_list -gt 0 ];
  then
    echo 1
  else
    echo 0;
  fi
}

terminate_all_running_proc() {
  echo "$ts: checking if $PROCNAME process is running."
  result=$( is_proc_running "$PROCNAME")
  echo "$ts: CheckResult is $result."

  if [ $result -eq 1 ]; then
    echo "$ts: previous $PROCNAME process is running. So, stop it now."
    pkill -f $PROCNAME
  else
    echo "$ts: No $PROCNAME process is running."
  fi
}

start() {
  echo "$ts: Starting new $PROCNAME process."
  bash -c "exec -a StandupReminder ./standupReminder.sh >> standupReminder.log &"
  echo "$ts: New $PROCNAME process is running."
}


echo "'$1' is input argument."

if [ "$1" == "help" ];
then
   helpFunction
elif [ "$1" == "start" ];
then
  terminate_all_running_proc
  start
elif [ "$1" == "stop" ];
then
  terminate_all_running_proc
else 
  helpFunction
fi
