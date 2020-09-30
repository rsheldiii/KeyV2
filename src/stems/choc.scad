separation = 5.7;

positions = [
  [separation/2, 0],
  [-separation/2, 0],
];

module choc_stem(depth, slop){
  for (position=positions) {
    translate([position.x,position.y, depth/2]) single_choc_stem(depth, slop);
  }
}

module single_choc_stem(depth, slop) {
  cube([$choc_stem.x - slop, $choc_stem.y - slop, depth], center=true);
}
