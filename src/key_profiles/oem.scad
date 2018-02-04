module oem_row(n=1) {
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

  if (n == 5) {
    $total_depth = 11.2;
    $top_tilt = -3;
    children();
  } else if (n == 1) {
    $total_depth = 9.45;
    $top_tilt = 1;
    children();
  } else if (n == 2) {
    $total_depth = 9;
    $top_tilt = 6;
    children();
  } else if (n == 3) {
    $total_depth = 9.25;
    $top_tilt = 9;
    children();
  } else if (n == 4) {
    $total_depth = 9.25;
    $top_tilt = 10;
    children();
  }
}
