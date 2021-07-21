include <../layout.scad>

60_percent_default_layout = [
  [1,1,1,1,1,1,1,1,1,1,1,1,1,2],
  [1.5,1,1,1,1,1,1,1,1,1,1,1,1,1.5],
  [1.75,1,1,1,1,1,1,1,1,1,1,1,2.25],
  [2.25,1,1,1,1,1,1,1,1,1,1,2.75],
  [1.25,1.25,1.25,6.25,1.25,1.25,1.25,1.25]
];

60_percent_legends = [
  ["`", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-", "=", "⌫"],
  ["tab", "q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "[", "]", "\\"],
  ["caps", "a", "s", "d", "f", "g", "h", "j", "k", "l", ";", "'", "enter"],
  ["shift", "z", "x", "c", "v", "b", "n", "m", ",", ".", "/", "shift"],
  ["ctl", "win", "alt", "", "mnu", "win", "alt", "ctl"],
];

module 60_percent_default(profile) {
  layout(60_percent_default_layout, profile, 60_percent_legends, row_sculpting_offset=1) children();
}
