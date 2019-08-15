FROM balenalib/raspberrypi3:latest-stretch

ENV LD_LIBRARY_PATH=/opt/z-way-server/libs
ENV PATH=/opt/z-way-server:$PATH
ENV ZWAY_VERSION=3.0.0


# Only for x86 emulation: Please refer
# https://matchboxdorry.gitbooks.io/matchboxblog/content/blogs/build_and_run_arm_images.html
COPY qemu-arm-static /usr/bin/qemu-arm-static 

RUN install_packages \
    wget \
    libarchive13 \
    sharutils \
    gawk \
    libavahi-compat-libdnssd-dev \
    libc-ares2 \
    libssl1.1 
    
RUN wget https://storage.z-wave.me/z-way-server/z-way-${ZWAY_VERSION}_armhf.deb 

RUN dpkg -i z-way-${ZWAY_VERSION}_armhf.deb && \
    rm *.deb 


WORKDIR /opt/z-way-server

EXPOSE 8083

CMD ["z-way-server"]
