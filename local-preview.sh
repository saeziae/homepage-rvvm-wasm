#!/bin/bash
cat >public/vite.config.js<<MEOW
export default {
  server: {
    headers: {
      "Cross-Origin-Embedder-Policy": "require-corp",
      "Cross-Origin-Opener-Policy": "same-origin",
    },
  },
};
MEOW
cd public
npx vite 