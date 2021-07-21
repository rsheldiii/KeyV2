// This is an imperfect attempt to clone the MT3 profile
// I'm unsure if "MT3" is copyrighted or anything, but
// Since my name is "Matt" and "Matty3" sounds like "MT3,"
// that's what I'm going with for now
module matty3_row(row=3, column=0, deep_dish=false) {
  $key_shape_type = "sculpted_square";

  $bottom_key_width = 18.35;
  $bottom_key_height = 18.6;

  $width_difference = ($bottom_key_width - 13.0);
  $height_difference = ($bottom_key_height - 13.0);
  $dish_type = "squared spherical";
  $dish_depth = deep_dish ? 1.6 : 0.75;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 0;
  $height_slices = 10;
  $corner_radius = 1;

  $top_tilt_y = side_tilt(column);
  extra_height =  $double_sculpted ? extra_side_tilt_height(column) : 0;

  if (row == 0){
    // TODO I didn't change these yet
    $total_depth = 14.6 + extra_height;
    $top_tilt = -12;
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
