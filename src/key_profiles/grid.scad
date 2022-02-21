module grid_row(row=3, column = 0) {
  $bottom_key_width = 18.16;
  $bottom_key_height = 18.16;
  $width_difference = 1;
  $height_difference = 1;
  $top_tilt = 0;
  $top_skew = 0;
  $dish_type = "old spherical";
  // something weird is going on with this and legends - can't put it below 1.2 or they won't show
  $dish_depth = 1;
  $dish_skew_x = 0;
  $dish_skew_y = 0;

  $hull_shape_type = "linear extrude";


  $dish_overdraw_width = -6.5;
  $dish_overdraw_height = -6.5;

  $minkowski_radius = 0.5;
  //also,
  /* $rounded_key = true; */

  $top_tilt_y = side_tilt(column);
  extra_height =  $double_sculpted ? extra_side_tilt_height(column) : 0;

  $total_depth = 7 + abs((row-3) * 0.5) + extra_height;

  if (row == 5 || row == 0) {
    /* $top_tilt =  -18.55; */
    children();
  } else if (row == 1) {
    /* $top_tilt = (row-3) * 7 + 2.5; */
    children();
  } else if (row == 2) {
    /* $top_tilt = (row-3) * 7 + 2.5; */
    children();
  } else if (row == 3) {
    /* $top_tilt = (row-3) * 7 + 2.5; */
    children();
  } else if (row == 4) {
    /* $top_tilt = (row-3) * 7 + 2.5; */
    children();
  } else {
    children();
  }
}
