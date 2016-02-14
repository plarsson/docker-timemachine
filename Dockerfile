FROM odarriba/timemachine
MAINTAINER axot

RUN apt-get update && \
    apt-get upgrade --yes --force-yes && \
    apt-get install -y --no-install-recommends avahi-daemon avahi-utils && \
    apt-get clean

ADD files/start_services.sh /start_services.sh
ADD avahi/nsswitch.conf /etc/nsswitch.conf
ADD avahi/afpd.service /etc/avahi/services/afpd.service
