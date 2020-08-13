#!/bin/bash

# /config/scripts/wlb-transition.sh

GROUP=$1
INTF=$2
STATUS=$3

MYLOG="/var/log/wlb"
TS=$(date +"%Y%m%d-%T")

/usr/sbin/conntrack -F

case "$STATUS" in
    active)
        msg="$TS: Internet connection $GROUP:$INTF is active."
    ;;
    inactive)
     msg="$TS: Internet connection $GROUP:$INTF is inactive."
    ;;
    failover)
        msg="$TS: Internet connection $GROUP:$INTF is failover."
    ;;
    *)
     msg="$TS: Oh crap, $GROUP:$INTF going [$STATUS]"
    ;;
esac

echo $msg >> $MYLOG
logger $msg
exit
