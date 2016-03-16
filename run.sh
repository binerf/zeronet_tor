#! /bin/bash -ex

/usr/bin/tor -f /usr/share/tor/tor-service-defaults-torrc 2>&1 &

cd /home/zeronet/ZeroNet && sudo -u zeronet python zeronet.py --ui_ip 0.0.0.0 --config_file /home/zeronet/ZeroNet/data/zeronet.conf
