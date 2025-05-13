#/bin/bash
git rev-parse --short HEAD > rootfs/root/.version
date -d @$(git log -1 --format=%ct) --iso-8601=m >> rootfs/root/.version
if [ ! -d "build/buildroot" ]; then
  mkdir -p build/buildroot
fi
cp buildroot.config build/buildroot/.config
cd build/buildroot
HOSTCC=gcc-13 HOSTCXX=g++-13 make -C ../../buildroot O=$(pwd) -j$(expr $(nproc) - 1)
