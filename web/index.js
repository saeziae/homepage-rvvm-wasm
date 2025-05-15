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
  term.write("请坐和放宽，好东西就要来了。\n");
} else {
  term.write("Loading... Sit back and relax.\n");
}

const nya = new Audio('./nya.ogg')

function bell() {
    nya.play();
}
term.onBell(bell);
const { master, slave } = openpty();

term.loadAddon(master);
await rvvm({
  arguments: [
    "/fw_jump.bin",
    "-k",
    "/Image",
    "-i",
    "/rootfs.img",
    "-m",
    "64M",
    "-nogui",
    "-nonet",
  ],
  pty: slave,
});