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

module dactyl_manuform_4x6(profile) {
  layout(dactyl_manuform_4x6_main, profile) children();
  translate_u(3,-5) rotate([0,0,25])layout(dactyl_manuform_4x6_thumbs_l, profile, row_override=3) children();
  translate_u(7.75,-3.95) rotate([0,0,-25])layout(dactyl_manuform_4x6_thumbs_r, profile, row_override=3) children();
}
