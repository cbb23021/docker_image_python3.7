FROM python:3.7-slim
LABEL maintainer='Michael Chou <snoopy02m@gmail.com>'

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONIOENCODING=UTF-8
ENV LANG C.UTF-8

RUN apt update -y
RUN apt install -y software-properties-common supervisor procps curl locales tzdata
RUN apt install -y gcc g++ libffi-dev libssl-dev vim

COPY ./vimrc /etc/vim/vimrc
COPY ./syntax /root/.vim/syntax

RUN ln -fs /usr/share/zoneinfo/Asia/Taipei /etc/localtime
RUN locale-gen zh_TW zh_TW.UTF-8 zh_CN.UTF-8 en_US.UTF-8
RUN dpkg-reconfigure -f noninteractive tzdata

RUN echo 'alias ls="ls --color=auto"' >> /root/.bashrc
RUN echo 'alias ll="ls -alF"' >> /root/.bashrc
RUN echo 'alias la="ls -A"' >> /root/.bashrc
RUN echo 'alias l="ls -CF"' >> /root/.bashrc
RUN echo 'alias python="python3"' >> /root/.bashrc
RUN echo 'alias pip="python3 -m pip"' >> /root/.bashrc

