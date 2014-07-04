# DOCKER-VERSION 1.0.0

FROM rampantmonkey/base-ubuntu:14.04
MAINTAINER Casey Robinson <casey@rampantmonkey.com>

RUN apt-get update
RUN apt-get -y install build-essential g++ gnutls-bin libgnutls-dev curl cmake uuid-dev

RUN curl -O http://taskwarrior.org/download/taskd-1.0.0.tar.gz
RUN tar zxf taskd-1.0.0.tar.gz

WORKDIR taskd-1.0.0
ENV TASKDDIR /taskd-1.0.0
RUN cmake .
RUN make install

RUN mkdir -p /task_data
ENV TASKDATA /task_data
RUN mkdir -p /task_keys
ENV KEYS /task_keys

ADD ./init.sh /init.sh
RUN chmod +x /init.sh

CMD ["taskd", "server", "--data", "/task_data"]

VOLUME ["/task_data", "/task_keys"]

EXPOSE 53589
