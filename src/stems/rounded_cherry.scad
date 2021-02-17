include <../functions.scad>
include <cherry.scad>

module rounded_cherry_stem(depth, slop, throw) {
  difference(){
    hull() {
      translate([0,0,$cherry_outer_bevel_height])
      cylinder(d=$rounded_cherry_stem_d, h=depth-$cherry_outer_bevel_height);
      cylinder(d=$rounded_cherry_stem_d-$cherry_outer_bevel_width*2, h=depth);
    }

    // inside cross
    // translation purely for aesthetic purposes, to get rid of that awful lattice
    inside_cherry_cross(slop);
  }
}
