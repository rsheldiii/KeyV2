module asa_row(row=3, column = 0) {
  $key_shape_type = "sculpted_square";
  $bottom_key_width = 18.4;
  $bottom_key_height = 18.4;
  $width_difference = 5.7;
  $height_difference = 5.7;
  $dish_type = "spherical";
  $dish_depth = 1;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 1.75;
  $stem_inset = 1.2;
  $height_slices = 10;
  $corner_radius = 1;

  // this is _incredibly_ intensive
  //$rounded_key = true;

  $top_tilt_y = side_tilt(column);
  extra_height =  $double_sculpted ? extra_side_tilt_height(column) : 0;

  if (row <= 1){
    $total_depth = 10.65 + extra_height;
    $top_tilt = 7;
    children();
  } else if (row == 2) {
    $total_depth = 9.65 + extra_height;
    $top_tilt = 3.25;
    children();
  } else if (row == 3) {
    $total_depth = 10.35 + extra_height;
    $top_tilt = 1.5;
    children();
  } else if (row == 4 || row == 5){
    $total_depth = 11.9 + extra_height;
    $top_tilt = 0.43;
    children();
  } else {
    // Same as row == 3
    $total_depth = 10.35 + extra_height;
    $top_tilt = 1.5;
    children();
  }
}
