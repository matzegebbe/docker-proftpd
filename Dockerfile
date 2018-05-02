FROM debian:stable-slim

RUN apt-get update -y
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y proftpd

ADD proftpd.conf /etc/proftpd/proftpd.conf
RUN chown root:root /etc/proftpd/proftpd.conf

RUN mkdir /ftp/

EXPOSE 21
EXPOSE 20

CMD ["proftpd", "--nodaemon", "-c", "/etc/proftpd/proftpd.conf"]
