include <../libraries/rounded_rectangle_profile.scad>

module rounded_square_shape(size, delta, progress, center = true) {
  offset(r=$corner_radius, $fa=360/$shape_facets){
    square_shape([size.x - $corner_radius*2, size.y - $corner_radius*2], delta, progress);
  }
}

// for skin

function skin_rounded_square(size, delta, progress, thickness_difference) =
  rounded_rectangle_profile(size - (delta * progress) - [thickness_difference, thickness_difference]*2, fn=$shape_facets, r=$corner_radius);
