include <../libraries/rounded_rectangle_profile.scad>

module rounded_square_shape(size, delta, progress, center = true) {
  offset(r=$corner_radius){
    square_shape([size.x - $corner_radius*2, size.y - $corner_radius*2], delta, progress);
  }
}

// for skin

function skin_rounded_square(size, delta, progress) =
  rounded_rectangle_profile(size - (delta * progress), fn=36, r=$corner_radius);
