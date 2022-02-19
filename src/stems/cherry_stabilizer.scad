include <../functions.scad>

// extra length to the vertical tine of the inside cherry cross
// splits the stem into halves - allows easier fitment
extra_vertical = 0.6;

module inside_cherry_stabilizer_cross(slop, throw) {
  // inside cross
  // translation purely for aesthetic purposes, to get rid of that awful lattice
  translate([0,0,-SMALLEST_POSSIBLE]) {
    linear_extrude(height = throw) {
      square(cherry_cross(slop, extra_vertical)[0], center=true);
      square(cherry_cross(slop, extra_vertical)[1], center=true);
    }
  }
}

module cherry_stabilizer_stem(depth, slop, throw) {
  difference(){
    // outside shape
    linear_extrude(height = depth) {
      offset(r=1){
        square(outer_cherry_stabilizer_stem(slop) - [2,2], center=true);
      }
    }

    inside_cherry_stabilizer_cross(slop, throw);
  }
}
