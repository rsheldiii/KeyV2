module asa_row(row=3, column = 0) {
  $key_shape_type = "sculpted_square";
  $bottom_key_height = 18.06;
  $bottom_key_width = 18.05;      // Default (R3)
  $total_depth = 10.35;           // Default (R3)
  $top_tilt = 1.5;                // Default (R3)
  $width_difference = 5.05;
  $height_difference = 5.56;
  $dish_type = "spherical";
  $dish_depth = 1.2;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 1.75;
  $stem_inset = 1.2;
  $height_slices = 10;
  $corner_radius = 1;

  // this is _incredibly_ intensive
  //$rounded_key = true;

  if (row == 1){
    $bottom_key_width = 17.95;
    $width_difference = 4.95;
    $total_depth = 10.65;
    $top_tilt = 7;
    children();
  } else if (row == 2) {
    $bottom_key_width = 18.17;
    $width_difference = 5.17;
    $total_depth = 9.65;
    $top_tilt = 3.25;
    children();
  } else if (row == 4){
    $bottom_key_width = 18.02;
    $width_difference = 5.02;
    $total_depth = 11.9;
    $top_tilt = 0.43;
    children();
  } else {
    children();
  }
}
