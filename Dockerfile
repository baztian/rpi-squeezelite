FROM resin/rpi-raspbian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    usbutils \
    libflac-dev \
    libfaad2  \
    libmad0 \
    libasound2-dev \
    libasound2 \
    libasound2-data \
    apt-get clean

RUN curl -L https://sourceforge.net/projects/lmsclients/files/squeezelite/linux/squeezelite-1.9.6.1198-armv6hf.tar.gz | tar xzf squeezelite

RUN chmod a+x squeezelite

CMD /squeezelite -o $SOUNDDEVICE -s $SERVER -n $CLIENTNAME -m $CLIENTMAC
