#/bin/bash
hd=$(pwd)
cd RVVM
git apply ../RVVM.diff
export PATH=$PATH:/usr/lib/emscripten/
make CC=emcc clean
make \
CC=emcc \
USE_RV32=0 \
USE_RV64=1 \
USE_GUI=0 \
USE_NET=0 \
USE_SDL=0 \
USE_X11=0 \
USE_FB=0 \
LDFLAGS="\
  -sFORCE_FILESYSTEM -sPROXY_TO_PTHREAD\
  -sLZ4\
  --js-library=$hd/web/node_modules/xterm-pty/emscripten-pty.js \
  --preload-file $hd/build/buildroot/images/fw_jump.bin@fw_jump.bin \
  --preload-file $hd/build/buildroot/images/Image@Image"

cd $hd
if [ -d "build/rvvm" ]; then
    rm -r build/rvvm
fi
mkdir -p build/rvvm
cp RVVM/release.emscripten.wasm32/rvvm_wasm* build/rvvm/