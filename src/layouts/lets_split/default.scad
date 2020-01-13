include <../layout.scad>

// negative numbers are used for spacing
lets_split_mapping = [
  [1, 1, 1, 1, 1, 1, -1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, -1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, -1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, -1, 1, 1, 1, 1, 1, 1]
];

module lets_split_default(profile) {
  layout(lets_split_mapping, profile, row_sculpting_offset=1) children();
}
