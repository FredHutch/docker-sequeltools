FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt update && \
    apt install -y dirmngr gnupg apt-transport-https \
    ca-certificates software-properties-common && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
    add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/' && \
    apt install -y r-base && \
    apt install -y wget python python-pip git

RUN mkdir /usr/local/sequeltools && \
    cd /usr/local/sequeltools && \
    git clone https://github.com/ISUgenomics/SequelTools.git && \
    cd SequelTools/Scripts && \
    chmod +x *.sh *.py *.R && \
    export PATH=$PATH:"$(pwd)"
