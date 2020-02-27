include <../layout.scad>

// negative numbers are used for spacing
gherkin_default_layout = [
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
];

gherkin_default_legends = [
  ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
  ["a", "s", "d", "f", "g", "h", "j", "k", "l", ";"],
  ["z", "x", "c", "v", "b", "n", "m", ",", ".", "/"],
];

module gherkin_default(profile) {
  layout(gherkin_default_layout, profile, legends=gherkin_default_legends, row_sculpting_offset=1, row_override=3) children();
}
