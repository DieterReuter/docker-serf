FROM scratch
MAINTAINER Dieter Reuter <dieter.reuter@me.com>

ADD rootfs.tar.gz /

EXPOSE 7373 7946

ENTRYPOINT ["/serf"]
CMD ["agent"]
