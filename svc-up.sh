
#!/bin/bash

servicetocheck="puppet"
startstate=`chkconfig --list $servicetocheck | awk {'print $5'}`

if ! [ $(pgrep $servicetocheck) ] ; then
        logger "$servicetocheck wasn't running"
        if [ $startstate == "3:off" ]  ; then
                logger "service $servicetocheck disabled in chkconfig, not starting"
        else
                logger "service $servicetocheck enabled in chkconfig, starting"
                service $servicetocheck start       
        fi
        exit $?
fi
