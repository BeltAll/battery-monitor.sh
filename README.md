# Setup

Config

Make sure to change the battery_percent and is_supply_active is linked to your battery and power adapter under `/sys/class/power_supply` on fedora server.

To change the checking interval, change the OnUnitActiveSec under the .timer to the amount of seconds desired.


CLI

The .service and .timer files belong under "/etc/systemd/system/".

To start the service timer at boot, insert the following in the terminal:

`sudo systemctl daemon-reload`

`sudo systemctl enable battery-check.timer`

To activate the script right now:

`sudo systemctl start battery-check.timer`

The script should now start running every 30 seconds, to check if the service is active, run:

`journalctl -u battery-check.service`
