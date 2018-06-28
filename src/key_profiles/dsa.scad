module dsa_row(n=3) {
  $key_shape_type = "sculpted_square";
  $bottom_key_width = 18.24; // 18.4;
  $bottom_key_height = 18.24; // 18.4;
  $width_difference = 6; // 5.7;
  $height_difference = 6; // 5.7;
  $top_tilt = n == 5 ? -21 : (n-3) * 7;
  $top_skew = 0;
  $dish_type = "spherical";
  $dish_depth = 1.2;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $height_slices = 10;
  $enable_side_sculpting = true;
  // might wanna change this if you don't minkowski
  // do you even minkowski bro
  $corner_radius = 0.25;

  depth_raisers = [0, 3.5, 1, 0, 1, 3];
  if (n == 5) {
    $total_depth = 8.1 + depth_raisers[n];
    children();
  } else if (n == 1) {
    $total_depth = 8.1 + depth_raisers[n];
    children();
  } else if (n == 2) {
    $total_depth = 8.1 + depth_raisers[n];
    children();
  } else if (n == 3) {
    $total_depth = 8.1 + depth_raisers[n];
    children();
  } else if (n == 4) {
    $total_depth = 8.1 + depth_raisers[n];
    children();
  } else {
    children();
  }
}
