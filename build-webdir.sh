#/bin/bash
if [ -d "public" ]; then
    rm -r public
fi
HASH=$(git rev-parse --short HEAD)
mkdir public
cp -r web/8831 public/
cp web/*.{html,woff2,svg,png} public/
cp web/*.{js,css} public/
cp web/node_modules/@xterm/xterm/css/xterm.css public/
cp web/node_modules/@xterm/xterm/lib/xterm.js public/
cp web/node_modules/xterm-pty/index.mjs public/xterm-pty.mjs
cp build/rvvm/* public/
sed -i "s|<hash/>|<p>build $HASH</p>|" public/index.html