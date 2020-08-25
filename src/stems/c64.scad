include <../functions.scad>

// extra length to the vertical tine of the inside c64 cross
// splits the stem into halves - allows easier fitment
extra_vertical = 0.6;

module inside_c64_cross(slop) {
  // inside cross
  // translation purely for aesthetic purposes, to get rid of that awful lattice
  translate([0,0,-SMALLEST_POSSIBLE]) {
    linear_extrude(height = $stem_throw) {
      square(c64_cross(slop, extra_vertical)[0], center=true);
      square(c64_cross(slop, extra_vertical)[1], center=true);
    }
  }

  // Guides to assist insertion and mitigate first layer squishing
  if ($c64_bevel){
    for (i = c64_cross(slop, extra_vertical)) hull() {
      linear_extrude(height = 0.01, center = false) offset(delta = 0.1) square(i, center=true);
      translate([0, 0, 0.1]) linear_extrude(height = 0.01, center = false)  square(i, center=true);
    }
  }
}

module c64_stem(depth, slop, throw) {
  difference(){
    // outside shape
    linear_extrude(height = depth) {
      offset(r=1){
        square(outer_c64_stem(slop) - [2,2], center=true);
      }
    }

    inside_c64_cross($stem_inner_slop);
  }
}
