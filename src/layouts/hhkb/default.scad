include <../layout.scad>

hhkb_layout = [
  [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
  [1.5,1,1,1,1,1,1,1,1,1,1,1,1,1.5],
  [1.75,1,1,1,1,1,1,1,1,1,1,1,2.25],
  [2.25,1,1,1,1,1,1,1,1,1,1,1.75,1],
  [-1.5,1,1.5,6,1.5,1]
];

hhkb_legends = [
  ["Esc", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-", "=", "\\", "`"],
  ["Tab", "q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "[", "]", "Delete"],
  ["Ctrl", "a", "s", "d", "f", "g", "h", "j", "k", "l", ";", "'", "Return"],
  ["Shift", "z", "x", "c", "v", "b", "n", "m", ",", ".", "/", "Shift", "Fn"],
  ["", "Alt", "Cmd", "", "Cmd", "Alt"],
];

module hhkb_default(profile) {
  layout(hhkb_layout, profile, hhkb_legends) children();
}
