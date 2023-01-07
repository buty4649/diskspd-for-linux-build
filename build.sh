#!/bin/bash

set -xeu

for arch in amd64 aarch64; do
    docker buildx build -t diskspd-build-$arch $arch
    docker run --rm -v $(pwd):/work -w /work diskspd-build-$arch cp /usr/local/bin/diskspd ./diskspd-$arch
done
