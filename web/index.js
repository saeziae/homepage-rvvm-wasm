import "./xterm.js";
import "./addon-web-links.js";
import { openpty } from "./xterm-pty.mjs";
import rvvm from "./rvvm_wasm32.mjs";

window.addEventListener('load', async function () {
  const term = new Terminal({
    cols: 80,
    rows: 30,
    convertEol: true,
    cursorBlink: true,
    theme: {
      foreground: '#cdd6f4',
      background: '#1e1e2e',
      cursor: '#f5e0dc',

      black: '#45475a',
      brightBlack: '#585b70',

      red: '#f38ba8',
      brightRed: '#f38ba8',

      green: '#a6e3a1',
      brightGreen: '#a6e3a1',

      yellow: '#f9e2af',
      brightYellow: '#f9e2af',

      blue: '#89b4fa',
      brightBlue: '#89b4fa',

      magenta: '#f5c2e7',
      brightMagenta: '#f5c2e7',

      cyan: '#94e2d5',
      brightCyan: '#94e2d5',

      white: '#bac2de',
      brightWhite: '#a6adc8'
    },
    fontFamily:
      'CozetteVector, "Terminess Nerd Font", "Terminus", monospace',
    fontSize: 13,
    scrollback: 0
  });
  term.open(document.getElementById("terminal"));
  document.getElementById("mrrp").remove();
  if (navigator.language.startsWith("zh")) {
    term.write("\u8BF7\u5750\u548C\u653E\u5BBD\uFF0C\u597D\u4E1C\u897F\u5C31\u8981\u6765\u4E86\u3002\n");
  } else {
    term.write("Loading... Sit back and relax.\n");
  }

  term.onBell(() => console.log('Bell'));
  const { master, slave } = openpty();
  const wla = new window.WebLinksAddon.WebLinksAddon();
  term.loadAddon(master);
  term.loadAddon(wla);

  await rvvm({
    arguments: [
      "/fw_jump.bin",
      "-k",
      "/Image",
      "-m",
      "80M",
      "-nogui",
      "-nonet",
      "-cmdline=''"
    ],
    pty: slave,
  });
});