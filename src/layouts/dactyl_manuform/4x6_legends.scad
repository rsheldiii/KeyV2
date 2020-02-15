include <../layout.scad>

dactyl_manuform_4x6_main = [
  [1, 1, 1, 1, 1, 1, -1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, -1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, -1, 1, 1, 1, 1, 1, 1],
  [-1, -1, 1, 1, -1, -1, -1, -1, -1, 1, 1, -1, -1]
];

dactyl_manuform_4x6_thumbs_l = [
  [1.25, 1.25],
  [-0.25, 1, 1],
  [-0.25, 1, 1]
];

dactyl_manuform_4x6_thumbs_r = [
  [1.25, 1.25],
  [-0.25, 1, 1],
  [-0.25, 1, 1]
];

dactyl_manuform_4x6_main_legends = [
  ["ESC", "Q", "W", "E", "R", "T", "", "Y", "U", "I", "O", "P", "{["],
  ["LS", "A", "S", "D", "F", "G", "", "H", "J", "K", "L", ";:", "'\""],
  ["TAB", "Z", "X", "C", "V", "B", "", "N", "M", ",<", ".>", "/?", "\\|"],
  ["", "", "CAPS", "T(2)", "", "", "", "", "", "T(1)", "]}", "", ""]
];

dactyl_manuform_4x6_thumbs_l_legends = [
  ["~`", "LCTL"],
  ["", "RALT", "CMD"],
  ["", "MEH", "T(2^)"]
];

dactyl_manuform_4x6_thumbs_r_legends = [
  ["", "BKSP"],
  ["", "ENTR", "CP"],
  ["", "T(1^)", "PST"]
];

module dactyl_manuform_4x6_legends(profile) {
  layout(dactyl_manuform_4x6_main, profile, legends=dactyl_manuform_4x6_main_legends) children();
  translate_u(3,-5) rotate([0,0,25]) layout(dactyl_manuform_4x6_thumbs_l, profile, legends=dactyl_manuform_4x6_thumbs_l_legends, row_override=3) children();
  translate_u(7.75,-3.95) rotate([0,0,-25]) layout(dactyl_manuform_4x6_thumbs_r, profile, legends=dactyl_manuform_4x6_thumbs_r_legends, row_override=3) children();
}
