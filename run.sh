#!/bin/bash -ex

/usr/bin/tor -f /usr/share/tor/tor-service-defaults-torrc 2>&1 &

cd /home/zeronet/ZeroNet && sudo -u zeronet python zeronet.py --size_limit 50 --ui_ip '*' --config_file /home/zeronet/ZeroNet/data/zeronet.conf
