FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt update && \
    apt install -y dirmngr gnupg apt-transport-https \
    ca-certificates software-properties-common && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
    add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/' && \
    apt install -y r-base && \
    apt install -y wget python3 python3-pip git

RUN mkdir /usr/local/fastx-toolkit && \
    cd /usr/local/fastx-toolkit && \
    wget --quiet http://hannonlab.cshl.edu/fastx_toolkit/fastx_toolkit_0.0.13_binaries_Linux_2.6_amd64.tar.bz2 && \
    tar xvf fastx_toolkit_0.0.13_binaries_Linux_2.6_amd64.tar.bz2 && \
    mv bin/* /usr/local/bin/
