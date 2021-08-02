# standup Reminder

## 1. Overview

[![N|Solid](https://developer.apple.com/licensing-trademarks/images/mac-logo.svg)](https://developer.apple.com/)

Nowadays, as sitting all day to work at a desk, people will have high risk of getting the following physcial diseases due to the static posture:
- Sciatica
- Herniated disc
- Muscle strain
- Degenerative disc disease
- Spinal stenosis
- Posture
- Not being in shape
- Other medical conditions

_Reference_: [Lower Back Pain When Sitting]

To mitigate the risk, this tool will notify if you have been working on computer for longer than **one hour**.

This tool can run on:
- MacOS _version 11+

## 2. How to use
Make sure that all Shell scripts have _"executable"_ permission:
`chmod -R +x *.sh`

### 2.1. To start the standup reminder as backgroud process:
`./run.sh start`

```console
foo@bar:~$ ./run.sh start
'start' is input argument.
07:41:51: checking if standupReminder.sh process is running.
07:41:51: CheckResult is 0.
07:41:51: No standupReminder.sh process is running.
07:41:51: Starting new standupReminder.sh process.
07:41:51: New standupReminder.sh process is running.
```
_Note: "standupReminder.log" will be created in the root folder._

### 2.2. To stop background process of standup reminder:
`./run.sh stop`

```console
foo@bar:~$ ./run.sh stop
'stop' is input argument.
07:52:48: checking if standupReminder.sh process is running.
07:52:48: CheckResult is 1.
07:52:48: previous standupReminder.sh process is running. So, stop it now.
```

## 3. License
MIT

**Free Software & Tool**

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

   [lower back pain when sitting]: <https://www.healthline.com/health/lower-back-pain-when-sitting#causes>
