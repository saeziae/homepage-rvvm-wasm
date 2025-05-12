#/bin/bash
if [ ! -d "build/buildroot" ]; then
  mkdir -p build/buildroot
fi
cp buildroot.config build/buildroot/.config
cd build/buildroot
HOSTCC=gcc-13 HOSTCXX=g++-13 make -C ../../buildroot O=$(pwd) -j$(expr $(nproc) - 1)
