include <square.scad>
include <../libraries/round-anything/polyround.scad>

module rounded_square_shape(size, delta, progress, center = true) {
  offset(r=$corner_radius, $fa=360/$shape_facets){
    square_shape([size.x - $corner_radius*2, size.y - $corner_radius*2], delta, progress);
  }
}

// for skin
function skin_rounded_square(size, delta, progress, thickness_difference) =
  polyRound(add_rounding(rectangle_profile(size - (delta * progress)), $corner_radius), $shape_facets/4);
