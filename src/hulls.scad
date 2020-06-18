include <hulls/skin.scad>
include <hulls/linear_extrude.scad>
include <hulls/hull.scad>

// basic key shape, no dish, no inside
// which is only used for dishing to cut the dish off correctly
// $height_difference used for keytop thickness
// extra_slices is a hack to make inverted dishes still work
module shape_hull(thickness_difference, depth_difference, extra_slices = 0){
  render() {
    if ($hull_shape_type == "skin") {
      skin_extrude_shape_hull(thickness_difference, depth_difference, extra_slices);
    } else if ($hull_shape_type == "linear extrude") {
      linear_extrude_shape_hull(thickness_difference, depth_difference, extra_slices);
    } else {
      hull_shape_hull(thickness_difference, depth_difference, extra_slices);
    }
  }
}
