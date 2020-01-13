include <../layout.scad>

project_zen_main = [
  [1.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.5],
  [1.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.5],
  [1.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.5],
  [1.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.5],
  [1.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.5]
];

project_zen_thumbs = [
  [2,2],
  [2,2],
];

module project_zen_default(profile) {
  layout(project_zen_main, profile) children();
  translate_u(4.5,-5) layout(project_zen_thumbs, profile, row_override=3) children();
}
