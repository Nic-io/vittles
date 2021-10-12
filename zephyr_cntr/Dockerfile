FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
ENV PATH="/root/zephyrproject/zephyr/scripts:/root/.local/bin:${PATH}"
ENV ZEPHYR_BASE=/root/zephyrproject/zephyr
COPY zephyr_cntr/.bashrc /root/.bashrc

WORKDIR /tmp
RUN apt -y update && apt -y upgrade && apt -y install wget 
RUN wget https://apt.kitware.com/kitware-archive.sh 
RUN bash /tmp/kitware-archive.sh
RUN apt -y update && apt -y install --no-install-recommends git \
                cmake \
                locales \
                ninja-build \
                gperf \
                ccache \
                dfu-util \
                device-tree-compiler \
                python3-dev \
                python3-pip \
                python3-setuptools \
                python3-tk \
                python3-wheel \
                xz-utils \
                file\
                make \
                gcc \
                gcc-multilib \
                g++-multilib \
                libsdl2-dev
# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 

#Install Zephyr related tools and SDK
RUN pip3 install --user -U west
RUN echo 'export PATH=/root/.local/bin:$PATH' >> ~/.bashrc

WORKDIR /root/
RUN west init zephyrproject
WORKDIR /root/zephyrproject
RUN west update
RUN west zephyr-export

RUN pip3 install --user -r ~/zephyrproject/zephyr/scripts/requirements.txt

WORKDIR /root/

RUN wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.13.1/zephyr-sdk-0.13.1-linux-x86_64-setup.run
RUN chmod +x zephyr-sdk-0.13.1-linux-x86_64-setup.run
RUN sh "zephyr-sdk-0.13.1-linux-x86_64-setup.run" --quiet -- -d /root/zephyr-sdk-0.13.1 
RUN rm zephyr-sdk-0.13.1-linux-x86_64-setup.run
#RUN cp /root/zephyr-sdk-0.13.1/sysroots/x86_64-pokysdk-linux/usr/share/openocd/contrib/60-openocd.rules /etc/udev/rules.d
#RUN udevadm control --reload
