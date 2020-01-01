include <../layout.scad>

preonic_layout_mapping = [
  [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 0, 2, 0, 1, 1, 1, 1, 1]
];

module preonic_default(profile, column_sculpt_profile="2hands") {
  layout(preonic_layout_mapping, profile, column_sculpt_profile=column_sculpt_profile);
}
