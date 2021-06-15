FROM openjdk:18-buster
LABEL org.opencontainers.image.authors="WesleyCharlesBlake"

WORKDIR /usr/src/minecraft

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*
  
RUN wget https://launcher.mojang.com/v1/objects/0a269b5f2c5b93b1712d0f5dc43b6182b9ab254e/server.jar

COPY server.properties /usr/src/minecraft/server.properties

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
