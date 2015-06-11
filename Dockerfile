FROM debian:stable

#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
#RUN echo "deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen" >>/etc/apt/sources.list
RUN apt-get update
RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get install -y openjdk-7-jre;
RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get install -y mongodb-server jsvc;

#ADD http://dl.ubnt.com/unifi/4.6.3/unifi_sysvinit_all.deb /root/unifi_sysvinit_all.deb
#RUN export DEBIAN_FRONTEND=noninteractive; \
#    dpkg -i /root/unifi_sysvinit_all.deb

RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get install -y unzip
ADD http://dl.ubnt.com/unifi/4.6.3/UniFi.unix.zip /root/UniFi.unix.zip
RUN cd /opt; unzip /root/UniFi.unix.zip

RUN mkdir /opt/UniFi/data
RUN mkdir /opt/UniFi/logs

VOLUME /opt/UniFi/data
VOLUME /opt/UniFi/logs
CMD java -Xmx1024M -jar /opt/UniFi/lib/ace.jar start

