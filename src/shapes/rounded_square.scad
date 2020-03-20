include <../libraries/rounded_rectangle_profile.scad>

module rounded_square_shape(size, delta, progress, center = true) {
  offset(r=$corner_radius){
    square_shape([size.x - $corner_radius*2, size.y - $corner_radius*2], delta, progress);
  }
}

module square_shape(size, delta, progress) {
  alpha = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
  gamma = ($width_difference * alpha) / ($total_depth+alpha);
  polygon(points=[
    [-size.x /2 + delta.x * progress/2 , -size.y / 2 + delta.y * progress/2],
    [size.x / 2 - delta.x * progress/2,-size.y / 2 + delta.y * progress/2],
    [size.x / 2 - delta.x * progress/2 + gamma * progress, size.y / 2 - delta.y * progress/2],
    [-size.x / 2 + delta.x * progress/2 - gamma * progress, size.y / 2 - delta.y * progress/2]
  ]);
}

// for skin

function skin_rounded_square(size, delta, progress) =
  rounded_rectangle_profile(size - (delta * progress), fn=36, r=$corner_radius);
