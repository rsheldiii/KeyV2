include <../constants.scad>
// Regular polygon shapes CIRCUMSCRIBE the sphere of diameter $bottom_key_width
// This is to make tiling them easier, like in the case of hexagonal keycaps etc

// this function doesn't set the key shape, so you can't use it directly without some fiddling
module hex_row(n=3, column=0) {
  $bottom_key_width = $unit - 0.5;
  $bottom_key_height = $unit - 0.5;
  
  $width_difference = 0;
  $height_difference = 0;
  
  $dish_type = "spherical";
  $key_shape_type = "hexagon";

  $stem_inset = -2.5;
  $stem_throw = 3;

  // $dish_depth = 1;

  $top_skew = 0;
  $height_slices = 1;
  $stem_support_type = "disable";
  
  $dish_overdraw_width = -8.25;
  $dish_overdraw_height = -8.25;
//   $corner_radius = 1;

  // this is _incredibly_ intensive
  /* $rounded_key = true; */

  $top_tilt_y = side_tilt(column);
  extra_height = $double_sculpted ? extra_side_tilt_height(column) : 0;

  base_depth = 4;
  if (n <= 1){
    $total_depth = base_depth + 2.5 + extra_height;
    $top_tilt = -13;

    children();
  } else if (n == 2) {
    $total_depth = base_depth + 0.5 + extra_height;
    $top_tilt = -7;

    children();
  } else if (n == 3) {
    $total_depth = base_depth + extra_height;
    $top_tilt = 0;

    children();
  } else if (n == 4){
    $total_depth = base_depth + 0.5 + extra_height;
    $top_tilt = 7;

    children();
  } else {
    $total_depth = base_depth + extra_height;
    $top_tilt = 0;

    children();
  }
}