#!/bin/bash
# shebang is being used to announce the program is running on bash interpreter

# Set terminal settings to configure terminal at serial port /dev/serial0
stty -F /dev/serial0 raw 9600 cs8 clocal -cstopb #ready the serial port for reading from Adafruit Ultimate GPS HAT

# This command starts the GPS daemon gpsd with the serial port /dev/serial0 as its input source
sudo gpsd /dev/serial0 -F /var/run/gpsd.sock

cd /home/pi/CarConnectTrial2

#start the apps
/home/pi/.nvm/versions/node/v21.6.2/bin/node index.js & #need to manually specify installation dir if node was installed by nvm

# python3 tempMonitor.py &
python3 obdDash.py &
# python3 imuSensor.py &
# python3 gpsModule.py &
# python3 airSensor.py &
# python3 obdMisc.py & #use python instead of python3 so it wont be terminated on restartApps.sh

# cd /home/pi/piDashcam

#sudo python3 dashcam.py &

# Launching chromium-browser 
chromium-browser --window-position=0,0    --kiosk --user-data-dir="/home/pi/Documents/Profiles/0" http://localhost:3000 &
# chromium-browser --window-position=600,0    --kiosk --user-data-dir="/home/pi/Documents/Profiles/1" http://localhost:3000/misc &

# Used in Unix-like operating systems to hide the mouse cursor when it's not in use
unclutter -idle 1 &
