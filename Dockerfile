FROM reactnativecommunity/react-native-android

ENV DEBIAN_FRONTEND noninteractive
ENV USER root
RUN apt-get update
RUN apt-get install --no-install-recommends -y keyboard-configuration
RUN apt-get -y install xfce4 xfce4-goodies
RUN apt-get install -y tightvncserver

RUN npm install -g react-native-cli

RUN apt-get -y install openssh-server
COPY sshd_config /etc/ssh/sshd_config

RUN mkdir /root/.vnc

COPY xstartup /root/.vnc/xstartup
COPY passwd /root/.vnc/passwd
RUN chmod 600 /root/.vnc/passwd

COPY shadow /etc/shadow

CMD service ssh restart & vncserver && tail -f /root/.vnc/*:1.log