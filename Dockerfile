FROM nofish/zeronet

MAINTAINER binerf <zeronet@mygaia.org>

RUN echo "deb     http://deb.torproject.org/torproject.org trusty main" > /etc/apt/sources.list.d/tor.list
RUN echo "deb-src	http://deb.torproject.org/torproject.org trusty main" >> /etc/apt/sources.list.d/tor.list
RUN gpg --keyserver keys.gnupg.net --recv 886DDD89
RUN gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -

RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get -y install tor deb.torproject.org-keyring

RUN sed -i '57 s/#//' /etc/tor/torrc
RUN sed -i '61 s/#//' /etc/tor/torrc

ADD run.sh /run.sh
RUN chmod 0755 /run.sh

#Slimming down Docker containers
RUN apt-get clean -y
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mv /root/plugins/disabled-UiPassword /root/plugins/UiPassword
RUN mv /root/plugins/Stats /root/plugins/disabled-Stats

#Set upstart command
CMD ["/run.sh"]
#CMD cd /root && python zeronet.py --ui_ip 0.0.0.0 --config_file /root/data/zeronet.conf

#Expose ports
EXPOSE 43110
EXPOSE 15441
