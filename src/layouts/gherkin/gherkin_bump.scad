include <../layout.scad>

// negative numbers are used for spacing
gherkin_bump_mapping = [
  [1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1],
  [-1, -1, -1, -1, 2, -1, -1, -1, -1],
];

gherkin_bump_legends = [
  ["q", "w", "e", "r", "t", "", "y", "u", "i", "o", "p"],
  ["a", "s", "d", "f", "g", "", "h", "j", "k", "l", ";"],
  ["z", "x", "c", "v", "b", "", "n", "m", ",", ".", "/"],
  ["", "", "", "", "", "", "", "", ""],
];

module gherkin_bump_layout(profile, row_sculpting_offset=1, column_override=undef) {
  layout(gherkin_bump_mapping, profile, legends=gherkin_bump_legends, row_sculpting_offset=row_sculpting_offset, column_override=column_override, column_sculpt_profile="cresting_wave") {
    children();
  };
}
