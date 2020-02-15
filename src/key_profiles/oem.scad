module oem_row(row=3, column = 0) {
  $bottom_key_width = 18.05;
  $bottom_key_height = 18.05;
  $width_difference = 5.8;
  $height_difference = 4;
  $dish_type = "cylindrical";
  $dish_depth = 1;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 1.75;
  $stem_inset = 1.2;

  $top_tilt_y = side_tilt(column);
  extra_height =  $double_sculpted ? extra_side_tilt_height(column) : 0;

  if (row == 5 || row == 0) {
    $total_depth = 11.2 + extra_height;
    $top_tilt = -3;
    children();
  } else if (row == 1) {
    $total_depth = 9.45 + extra_height;
    $top_tilt = 1;
    children();
  } else if (row == 2) {
    $total_depth = 9 + extra_height;
    $top_tilt = 6;
    children();
  } else if (row == 3) {
    $total_depth = 9.25 + extra_height;
    $top_tilt = 9;
    children();
  } else if (row == 4) {
    $total_depth = 9.25 + extra_height;
    $top_tilt = 10;
    children();
  } else {
    children();
  }
}
