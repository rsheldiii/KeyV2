module dcs_row(n=1) {
	// names, so I don't go crazy
	$bottom_key_width = 18.16;
	$bottom_key_height = 18.16;
	$width_difference = 6;
	$height_difference = 4;
  $dish_type = "cylindrical";
  $dish_depth = 1;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 1.75;

  if (n == 5) {
    $total_depth = 11.5;
    $top_tilt = -6;
    children();
  } else if (n == 1) {
    $total_depth = 8.5;
    $top_tilt = -1;
    children();
  } else if (n == 2) {
    $total_depth = 7.5;
    $top_tilt = 3;
    children();
  } else if (n == 3) {
    $total_depth = 6;
    $top_tilt = 7;
    children();
  } else if (n == 4) {
    $total_depth = 6;
    $top_tilt = 16;
    children();
  }
}
