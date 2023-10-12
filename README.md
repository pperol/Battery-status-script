# Battery status script
This script produces notifications and sounds when battery level is bellow 20 % (AC power OFF) or over 85 % (AC power ON).
## crontab setting (no sudo)
\"* * * * * /usr/bin/bash -c "XDG_RUNTIME_DIR=/run/user/$(id -u) /path/to/batt-stat.sh"
