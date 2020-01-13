include <../layout.scad>

// 0's are to make space for a middle row for just the spacebar so that it
// isn't sculpted with double sculpting. the 0's in the first three rows
// don't _need_ to be there but it's nice to keep track
planck_layout_mapping = [
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
];

module planck_mit(profile) {
  layout(planck_layout_mapping, profile, row_sculpting_offset=1) children();
}
