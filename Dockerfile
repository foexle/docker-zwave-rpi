FROM balenalib/raspberrypi3-alpine-node:latest

ENV LD_LIBRARY_PATH=/opt/z-way-server/lib
ENV PATH=/opt/z-way-server:$PATH
ENV ZWAY_VERSION=3.0.0


# Only for x86 emulation: Please refer
# https://matchboxdorry.gitbooks.io/matchboxblog/content/blogs/build_and_run_arm_images.html
#COPY qemu-arm-static /usr/bin/qemu-arm-static 

RUN install_packages \
    wget \
    libarchive \
    avahi-compat-libdns_sd \
    sharutils \
    gawk \
    c-ares \
    libssl1.1 \
    tar \
    binutils 
    
RUN wget https://storage.z-wave.me/z-way-server/z-way-${ZWAY_VERSION}_armhf.deb 

RUN ar vx z-way-${ZWAY_VERSION}_armhf.deb && \
    unxz data.tar.xz && \
    tar xvf data.tar --exclude=./etc/ && \
    rm *.deb *.tar*


WORKDIR /opt/z-way-server

EXPOSE 8083

CMD ["z-way-server"]
