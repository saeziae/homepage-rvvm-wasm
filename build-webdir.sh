#/bin/bash
function _cp() {
    if [[ "$1" == *js ]] && [ -z "$DEBUG" ] ; then
        npx terser "$1" --compress --mangle --module --output "$2"
    elif [[ "$1" == *.css ]] && [ -z "$DEBUG" ] ; then
        npx csso "$1" --output "$2"
    else
        cp "$1" "$2"
    fi
}

if [ -d "public" ]; then
    rm -r public
fi
HASH=$(git rev-parse --short HEAD)
mkdir public
cp -r web/8831 public/
cp web/*.{html,woff2,svg,png,ogg} public/
_cp web/style.css public/style.css
_cp web/index.js public/index.js
_cp web/node_modules/@xterm/xterm/css/xterm.css public/xterm.css
cp web/node_modules/@xterm/xterm/lib/xterm.js public/xterm.js
cp web/node_modules/@xterm/addon-web-links/lib/addon-web-links.js public/addon-web-links.js
cp web/node_modules/xterm-pty/index.mjs public/xterm-pty.mjs
cp build/rvvm/* public/
sed -i "s|<hash />|<p>build $HASH</p>|" public/index.html
sed -i '/sourceMappingURL/d' public/*.{js,mjs}
[ -z "$CFHEADERS" ] || {
    cat > public/_headers << 'MEOW'
/*
    Cross-Origin-Embedder-Policy: require-corp
    Cross-Origin-Opener-Policy: same-origin
MEOW
[ -f public.zip ] && rm public.zip
(cd public && zip -0r ../public.zip .)
}