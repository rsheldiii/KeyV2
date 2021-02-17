include <../functions.scad>

// extra length to the vertical tine of the inside cherry cross
// splits the stem into halves - allows easier fitment
extra_vertical = 0.6;

module inside_cherry_cross(slop) {
  // inside cross
  // translation purely for aesthetic purposes, to get rid of that awful lattice
  translate([0,0,-SMALLEST_POSSIBLE]) {
    linear_extrude(height = $stem_throw) {
      square(cherry_cross(slop, extra_vertical)[0], center=true);
      square(cherry_cross(slop, extra_vertical)[1], center=true);
    }
  }

  // Guides to assist insertion and mitigate first layer squishing
  if ($cherry_bevel_height){
    for (i = cherry_cross(slop, extra_vertical)) hull() {
      linear_extrude(height = $zero, center = false)
      offset(delta = $cherry_bevel_width)
      square(i, center=true);

      translate([0, 0, $cherry_bevel_height-$zero])
      linear_extrude(height = $zero, center = false)
      square(i, center=true);
    }
  }
}

module cherry_stem(depth, slop, throw) {
  difference(){
    // outside shape
    hull() {
      translate([0,0,$cherry_outer_bevel_height])
      linear_extrude(height = depth - $cherry_outer_bevel_height)
      offset(r=$cherry_radius)
      square(outer_cherry_stem(slop) - [$cherry_radius*2,$cherry_radius*2], center=true);

      linear_extrude(height = depth, center = false)
      offset(r=$cherry_radius-$cherry_outer_bevel_width)
      square(outer_cherry_stem(slop) - [$cherry_radius*2,$cherry_radius*2], center=true);
    }

    inside_cherry_cross($stem_inner_slop);
  }
}
