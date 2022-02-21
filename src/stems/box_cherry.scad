include <../functions.scad>
include <cherry.scad>

module box_cherry_stem(depth, slop, throw) {
  difference(){
    // outside shape
    linear_extrude(height = depth) {
      offset(r=1){
        square(outer_box_cherry_stem(slop) - [2,2], center=true);
      }
    }

    // inside cross
    inside_cherry_cross($stem_inner_slop);
  }
}
