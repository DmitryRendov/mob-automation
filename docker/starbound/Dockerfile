FROM centos:latest
LABEL maintainer=”support@minecraft.of.by”

RUN dnf install -y libpng gcc

RUN adduser minecraft
RUN mkdir /starbound
RUN chown minecraft /starbound

USER minecraft

VOLUME /starbound

EXPOSE 21025
EXPOSE 21026

WORKDIR /starbound/game/linux
ENTRYPOINT ["./starbound_server"]
