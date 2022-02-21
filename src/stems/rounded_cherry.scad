include <../functions.scad>
include <cherry.scad>

module rounded_cherry_stem(depth, slop, throw) {
  difference(){
    cylinder(d=$rounded_cherry_stem_d, h=depth);

    // inside cross
    // translation purely for aesthetic purposes, to get rid of that awful lattice
    inside_cherry_cross($stem_inner_slop);
  }
}
