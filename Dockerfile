FROM ubuntu:18.04
RUN apt update && \
 	apt install -y gdb curl lib32gcc1 && \
	useradd -m steam && \ 
	mkdir /home/steam/Steam

COPY steamcmd_linux.tar.gz /home/steam/Steam
RUN cd /home/steam/Steam && tar zxvf *.tar.gz && ./steamcmd.sh +login anonymous +force_install_dir /home/steam/pavlovserver +app_update 622970 +exit

RUN chmod +x /home/steam/pavlovserver/PavlovServer.sh && \
	mkdir -p /home/steam/pavlovserver/Pavlov/Saved/Config/LinuxServer

COPY Game.ini /home/steam/pavlovserver/Pavlov/Saved/Config/LinuxServer
COPY pavlovserver.service /etc/systemd/system


RUN chown -R steam:steam /home/steam

ENTRYPOINT /home/steam/pavlovserver/PavlovServer.sh
