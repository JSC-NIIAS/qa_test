ARG base_img

FROM ${base_img}
MAINTAINER Nikolay Dema <ndema2301@gmail.com>


WORKDIR /opt


RUN apt update && \
    apt install -y --no-install-suggests --no-install-recommends \
        git gcc-10 g++-10 make ca-certificates gnupg curl \
        python-dev python3-dev cython3 pkg-config pip mc vim libelf-dev && \
    # link
    ln -sf /usr/bin/gcc-10 /usr/bin/gcc && \
    ln -sf /usr/bin/g++-10 /usr/bin/g++ && \
    ln -sf /usr/bin/cython3 /usr/bin/cython && \
    # clean workspace
    apt autopurge -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*


### ZCM ########################################################################

RUN apt update && \
    # no purge
    apt install -y --no-install-suggests --no-install-recommends \
        libzmq3-dev && \
    # link
    ln -sf /usr/bin/gcc /usr/bin/cc && \
    ln -sf /usr/bin/gcc /usr/bin/x86_64-linux-gnu-gcc && \
    # build
    git clone https://github.com/JSC-NIIAS/zcm.git \
        -b release --depth 1 --recursive && \
    cd zcm && \
    python ./waf configure --use-inproc --use-ipc --use-udpm --use-udp \
                           --use-serial --use-zmq --use-udpd --use-elf \
                           --use-python && \
    python ./waf build && \
    python ./waf install && \
    # install python module
    pip install zcm/python && \
    # clean workspace
    apt autopurge -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/bin/cc && \
    rm -rf /usr/bin/x86_64-linux-gnu-gcc
