include <../layout.scad>

// negative numbers are used for spacing
gherkin_mapping = [
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
];

module gherkin_default(profile) {
  layout(gherkin_mapping, profile, row_sculpting_offset=1);
}
