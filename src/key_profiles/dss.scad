module dss_row(n=3, column=0) {
  $key_shape_type = "sculpted_square";
  $bottom_key_width = 18.24;
  $bottom_key_height = 18.24;
  $width_difference = 6;
  $height_difference = 6;
  $dish_type = "spherical";
  $dish_depth = 1.2;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 0;
  $height_slices = 10;
  $enable_side_sculpting = true;
  // might wanna change this if you don't minkowski
  // do you even minkowski bro
  $corner_radius = 1;

  // this is _incredibly_ intensive
  /* $rounded_key = true; */

  $top_tilt_y = side_tilt(column);
  extra_height = $double_sculpted ? extra_side_tilt_height(column) : 0;

  // 5th row is usually unsculpted or the same as the row below it
  // making a super-sculpted top row (or bottom row!) would be real easy
  // bottom row would just be 13 tilt and 14.89 total depth
  // top row would be something new entirely - 18 tilt maybe?
  if (n <= 1){
    $total_depth = 10.5 + extra_height;
    $top_tilt = -1;
    children();
  } else if (n == 2) {
    $total_depth = 8.6 + extra_height;
    $top_tilt = 3;
    children();
  } else if (n == 3) {
    $total_depth = 7.9 + extra_height;
    $top_tilt = 8;
    children();
  } else if (n == 4){
    $total_depth = 9.1 + extra_height;
    $top_tilt = 16;
    children();
  } else {
    $total_depth = 7.9 + extra_height;
    $top_tilt = 8;
    children();
  }
}