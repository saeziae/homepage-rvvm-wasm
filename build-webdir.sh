#/bin/bash
if [ -d "public" ]; then
    rm -r public
fi
mkdir public
cp web/_headers public/
cp -r web/8831/ public/
cp web/*.{html,js,css,woff2,svg,png,gif} public/
cp web/node_modules/@xterm/xterm/css/xterm.css public/
cp web/node_modules/@xterm/xterm/lib/xterm.js public/
cp web/node_modules/xterm-pty/index.mjs public/xterm-pty.mjs
cp build/rvvm/* public/