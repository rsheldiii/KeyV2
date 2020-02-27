include <../layout.scad>

preonic_mit_layout = [
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
];

preonic_mit_legends = [
  [  "`",   "1",   "2",   "3",   "4", "5", "6",   "7", "8", "9", "0", "-"],
  [  "⇥",   "Q",   "W",   "E",   "R", "T", "Y",   "U", "I", "O", "P", "⌫"],
  ["Esc",   "A",   "S",   "D",   "F", "G", "H",   "J", "K", "L", ";", "⏎"],
  [  "⇧",   "Z",   "X",   "C",   "V", "B", "N",   "M", ",", ".", "/", "⇧"],
  [ "Fn", "Ctl", "Alt", "Cmd", "Lwr",  "",  "", "RSE", "←", "↓", "↑", "→"],
];

module planck_mit(profile) {
  layout(preonic_mit_layout, profile, legends=preonic_mit_legends, row_sculpting_offset=1) children();
}
