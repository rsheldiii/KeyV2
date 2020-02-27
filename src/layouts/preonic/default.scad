include <../layout.scad>

preonic_default_layout = [
  [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 0, 2, 0, 1, 1, 1, 1, 1]
];

preonic_default_legends = [
  [  "`",   "1",   "2",   "3",   "4", "5",  "", "6",  "7", "8", "9", "0", "-"],
  [  "⇥",   "Q",   "W",   "E",   "R", "T",  "", "Y",  "U", "I", "O", "P", "⌫"],
  ["Esc",   "A",   "S",   "D",   "F", "G",  "", "H",  "J", "K", "L", ";", "⏎"],
  [  "⇧",   "Z",   "X",   "C",   "V", "B",  "", "N",  "M", ",", ".", "/", "⇧"],
  [ "Fn", "Ctl", "Alt", "Cmd", "Lwr",  "",  "", "", "RSE", "←", "↓", "↑", "→"],
];

module preonic_default(profile, column_sculpt_profile="2hands") {
  layout(preonic_default_layout, profile, column_sculpt_profile=column_sculpt_profile) children();
}
