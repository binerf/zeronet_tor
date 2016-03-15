#! /bin/bash -ex

sed -i '/^SocksPort.*$/d' /etc/tor/torrc
ip=`hostname -i`
echo "SocksPort $ip:9050" >> /etc/tor/torrc

sed -i '/^StrictNodes.*$/d' /etc/tor/torrc
sed -i '/^ExitNodes.*$/d' /etc/tor/torrc

if [ -n "$TOR_EXITNODES" ]; then
  echo "StrictNodes 1" >> /etc/tor/torrc
  echo "ExitNodes $TOR_EXITNODES" >> /etc/tor/torrc
fi

/usr/bin/tor -f /etc/tor/torrc 2>&1 &

cd /home/zeronet/ZeroNet && sudo -u zeronet python zeronet.py --ui_ip 0.0.0.0 --config_file /home/zeronet/ZeroNet/data/zeronet.conf
