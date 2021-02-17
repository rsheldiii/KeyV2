include <../functions.scad>
include <cherry.scad>

module box_cherry_stem(depth, slop, throw) {
  difference(){
    // outside shape
    hull() {
      translate([0,0,$cherry_outer_bevel_height])
      linear_extrude(height = depth-$cherry_outer_bevel_height)
      offset(r=$cherry_radius)
      square(outer_box_cherry_stem(slop) - [$cherry_radius*2,$cherry_radius*2], center=true);

      linear_extrude(height = depth)
      offset(r=$cherry_radius-$cherry_outer_bevel_width)
      square(outer_box_cherry_stem(slop) - [$cherry_radius*2,$cherry_radius*2], center=true);
    }

    // inside cross
    inside_cherry_cross(slop);
  }
}
