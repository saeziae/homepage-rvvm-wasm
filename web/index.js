import "./xterm.js";
import theme from "./xterm-theme.js";
import { openpty } from "./xterm-pty.mjs";
import rvvm from "./rvvm_wasm32.mjs";

var term = new Terminal({
  cols: 80,
  rows: 30,
  convertEol: true,
  cursorBlink: true,
  theme: theme,
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

term.onBell(bell);
const { master, slave } = openpty();

term.loadAddon(master);
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