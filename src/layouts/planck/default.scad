include <../layout.scad>

// 0's are to make space for a middle row for just the spacebar so that it
// isn't sculpted with double sculpting. the 0's in the first three rows
// don't _need_ to be there but it's nice to keep track
planck_default_layout = [
  [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 0, 2, 0, 1, 1, 1, 1, 1]
];

planck_default_legends = [
  [  "⇥",   "Q",   "W",   "E",   "R", "T", "Y",   "U", "I", "O", "P", "⌫"],
  ["Esc",   "A",   "S",   "D",   "F", "G", "H",   "J", "K", "L", ";", "⏎"],
  [  "⇧",   "Z",   "X",   "C",   "V", "B", "N",   "M", ",", ".", "/", "⇧"],
  [ "Fn", "Ctl", "Alt", "Cmd", "Lwr",  "",  "", "RSE", "←", "↓", "↑", "→"],
];


module planck_default(profile, column_sculpt_profile="2hands") {
  layout(planck_default_layout, profile, row_sculpting_offset=1, column_sculpt_profile=column_sculpt_profile) children();
}
