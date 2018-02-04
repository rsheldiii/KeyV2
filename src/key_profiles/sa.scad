module sa_row(n=1) {
	$bottom_key_width = 18.4;
	$bottom_key_height = 18.4;
	$width_difference = 5.7;
	$height_difference = 5.7;
  $dish_type = "spherical";
  $dish_depth = 0.85;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 0;
	$height_slices = 10;
	$enable_side_sculpting = true;
	// might wanna change this if you don't minkowski
	// do you even minkowski bro
	$corner_radius = 0.25;

  if (n == 1){
    $total_depth = 14.89;
    $top_tilt = -13;
    children();
  } else if (n == 2) {
    $total_depth = 12.925;
    $top_tilt = -7;
    children();
  } else if (n == 3) {
    $total_depth = 12.5;
    $top_tilt = 0;
    children();
  } else if (n == 4){
    $total_depth = 12.925;
    $top_tilt = 7;
    children();
  }
}
