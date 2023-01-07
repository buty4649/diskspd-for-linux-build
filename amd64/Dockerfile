# syntax=docker/dockerfile:1.3-labs
FROM ubuntu:20.04

RUN <<COMMAND
  apt-get update -qq
  apt-get install -y build-essential wget git libaio-dev
  apt-get clean all
COMMAND

RUN <<COMMAND
  git clone https://github.com/microsoft/diskspd-for-linux.git --depth 1
  cd diskspd-for-linux
  sed -i -e 's/^LDFLAGS= /LDFLAGS= -s /g' \
         Makefile
  make
  install -o root -g root -m755 bin/diskspd /usr/local/bin
  cd ../
  rm -rf diskspd-for-linux
COMMAND
