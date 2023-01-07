# syntax=docker/dockerfile:1.3-labs
FROM ubuntu:20.04

RUN <<COMMAND
  apt-get update -qq
  apt-get install -y build-essential gcc-aarch64-linux-gnu g++-aarch64-linux-gnu wget git
  apt-get clean all
COMMAND

RUN <<COMMAND
  wget http://ports.ubuntu.com/ubuntu-ports/pool/main/liba/libaio/libaio1_0.3.112-5_arm64.deb
  dpkg --unpack --force-all libaio1_0.3.112-5_arm64.deb
  sed -i '/Package: libaio1/,/^$/{
            /Architecture: arm64/,/Depends:/s/libc6/libc6-arm64-cross/
        }' /var/lib/dpkg/status
  apt-get --fix-broken install -y
  rm -f libaio1_0.3.112-5_arm64.deb

  wget http://ports.ubuntu.com/ubuntu-ports/pool/main/liba/libaio/libaio-dev_0.3.112-5_arm64.deb
  dpkg -i --force-all libaio-dev_0.3.112-5_arm64.deb
  rm -f libaio-dev_0.3.112-5_arm64.deb
COMMAND

RUN <<COMMAND
  git clone https://github.com/microsoft/diskspd-for-linux.git --depth 1
  cd diskspd-for-linux
  sed -i -e 's/CXX=g++/CXX=aarch64-linux-gnu-g++/' \
         -e 's/LD=g++/LD=aarch64-linux-gnu-g++/' \
         -e 's/^LDFLAGS= /LDFLAGS= -s /g' \
         Makefile
  make
  install -o root -g root -m755 bin/diskspd /usr/local/bin
  cd ../
  rm -rf diskspd-for-linux
COMMAND
