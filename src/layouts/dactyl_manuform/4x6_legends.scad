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
  ["", "", "CAPS", "T(1)", "", "", "", "", "", "T(2)", "]}", "", ""]
];

dactyl_manuform_4x6_main_front_legends = [
  ["F1", "F2", "F3", "F4", "F5", "F6", "", "F7", "F8", "F9", "F10", "F11", "F12"],
  ["", "", "", "", "", "PGUP", "", "", "UP", "", "", "", ""],
  ["", "", "", "", "", "PGDN", "", "LFT", "DWN", "RHT", "", "", ""],
  ["", "", "", "T(0)", "", "", "", "", "", "T(2)", "", "", ""]
];

dactyl_manuform_4x6_thumbs_l_legends = [
  ["~`", "LCTL"],
  ["", "RALT", "LCMD"],
  ["", "MEH", "T(2)"]
];

dactyl_manuform_4x6_thumbs_l_front_legends = [
  ["", ""],
  ["", "PSC", "LCMD"],
  ["", "", "TEMP"]
];

dactyl_manuform_4x6_thumbs_r_legends = [
  ["", "BKSP"],
  ["", "ENTR", "CP"],
  ["", "T(1)", "PST"]
];

dactyl_manuform_4x6_thumbs_r_front_legends = [
  ["", ""],
  ["", "", ""],
  ["", "TEMP", ""]
];

module dactyl_manuform_4x6_legends(profile, row_sculpting_offset=1, column_override=undef) {
  layout(dactyl_manuform_4x6_main, profile, legends=dactyl_manuform_4x6_main_legends, front_legends=dactyl_manuform_4x6_main_front_legends, row_sculpting_offset=row_sculpting_offset, column_override=column_override, column_sculpt_profile="cresting_wave") children();
  translate_u(3,-5) rotate([0,0,25]) layout(dactyl_manuform_4x6_thumbs_l, profile, legends=dactyl_manuform_4x6_thumbs_l_legends, front_legends=dactyl_manuform_4x6_thumbs_l_front_legends, row_sculpting_offset=row_sculpting_offset, column_override=column_override, column_sculpt_profile="cresting_wave") children();
  translate_u(7.75,-3.95) rotate([0,0,-25]) layout(dactyl_manuform_4x6_thumbs_r, profile, legends=dactyl_manuform_4x6_thumbs_r_legends, front_legends=dactyl_manuform_4x6_thumbs_r_front_legends, row_sculpting_offset=row_sculpting_offset, column_override=column_override, column_sculpt_profile="cresting_wave") children();
}