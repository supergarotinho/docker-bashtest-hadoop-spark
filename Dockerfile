##
FROM sequenceiq/spark:1.6.0
MAINTAINER Anderson Santos anderson@gruponeuro.com.br

RUN yum clean all; \
    rpm --rebuilddb; \
    yum install -y yum-plugin-ovl && \
    yum update -y && \
    yum install -y \
      cmake \
      git \
      python && yum clean all

RUN cd /root && \
    git clone https://github.com/SimonKagstrom/kcov && \
    cd kcov && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr . && \
    make && \
    make install \
    && cd / \
    && rm -rf /root/kcov

RUN cd /root && \
    git clone https://github.com/kward/shunit2

VOLUME /source
WORKDIR /source
