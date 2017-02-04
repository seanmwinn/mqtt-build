FROM ubuntu:latest
LABEL maintainer "sean.winn@renovomotors.com"

RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:george-edison55/cmake-3.x && \
    apt-get -y update && \
    apt-get install -y git build-essential gcc make cmake cmake-gui cmake-curses-gui debhelper dh-make ninja-build libssl-dev doxygen graphviz && \
    apt-get clean

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
