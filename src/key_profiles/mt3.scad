// This is an imperfect attempt to clone the MT3 profile
module mt3_row(row=3, column=0, deep_dish=false) {
  $key_shape_type = "sculpted_square";

  $bottom_key_width = 18.35;
  $bottom_key_height = 18.6;

  $width_difference = ($bottom_key_width - 13.0);
  $height_difference = ($bottom_key_height - 13.0);
  $dish_type = "squared spherical";
  $dish_depth = deep_dish ? 1.6 : 1.2;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 0;
  $height_slices = 10;

  $corner_sculpting_factor = 2;
  $corner_radius = 0.0125;

  $more_side_sculpting_factor = 0.75;

  $top_tilt_y = side_tilt(column);
  extra_height =  $double_sculpted ? extra_side_tilt_height(column) : 0;

  if (row == 0){
    // TODO I didn't change these yet
    $total_depth = 14.7 + extra_height;
    $top_tilt = -12.5;
    children();
  } else if (row == 1) {
    $total_depth = 13.1 + extra_height;
    $top_tilt = -6;
    children();
  }  else if (row == 2) {
    $total_depth = 10.7 + extra_height;
    $top_tilt = -6;
    children();
  } else if (row == 3) {
    $total_depth = 10.7 + extra_height;
    $top_tilt = 6;
    children();
  } else if (row == 4){
    $total_depth = 11.6 + extra_height;
    $top_tilt = 12;
    children();
  } else if (row >= 5) {
    $total_depth = 11.6 + extra_height;
    $top_tilt = 0;
    children();
  } else {
    children();
  }
}
