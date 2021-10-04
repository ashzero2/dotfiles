#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function get_volume {
    pamixer --get-volume
}

function is_mute {
    pamixer --get-mute > /dev/null
}

function send_notification {
    DIR=`dirname "$0"`
    volume=`get_volume`
if [ "$volume" = "0" ]; then
        icon_name="/usr/share/icons/Faba/48x48/notifications/notification-audio-volume-muted.svg"
$DIR/notify-send.sh "$volume""      " -i "$icon_name" -t 2000 -h int:value:"$volume" --replace=555
    else
	if [  "$volume" -lt "10" ]; then
	     icon_name="/usr/share/icons/Faba/48x48/notifications/notification-audio-volume-low.svg"
$DIR/notify-send.sh "$volume""     " -i "$icon_name" --replace=555 -t 2000
    else
        if [ "$volume" -lt "30" ]; then
            icon_name="/usr/share/icons/Faba/48x48/notifications/notification-audio-volume-low.svg"
        else
            if [ "$volume" -lt "70" ]; then
                icon_name="/usr/share/icons/Faba/48x48/notifications/notification-audio-volume-medium.svg"
            else
                icon_name="/usr/share/icons/Faba/48x48/notifications/notification-audio-volume-high.svg"
            fi
        fi
    fi
fi
# Send the notification
$DIR/notify-send.sh "Volume : $volume" -i "$icon_name" -t 2000 --replace=555
}

case $1 in
    up)
	pamixer -i 10 > /dev/null
	send_notification
	;;
    down)
	pamixer -d 10 > /dev/null
	send_notification
	;;
    mute)
    	# Toggle mute
	pactl set-sink-mute 0 toggle > /dev/null
	if is_mute ; then
    DIR=`dirname "$0"`
    $DIR/notify-send.sh -i "/usr/share/icons/Faba/48x48/notifications/notification-audio-volume-muted.svg" --replace=555 -u normal "Mute" -t 2000
	else
	    send_notification
	fi
	;;
esac
