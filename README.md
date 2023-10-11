# Battery status script
This script produces notifications and sounds when battery level is bellow 20 % (unplugged) or over 85 % (plugged).
# crontab setting
\"* * * * * /usr/bin/bash -c "XDG_RUNTIME_DIR=/run/user/$(id -u) /[PATH]/batt-stat.sh"
