module g20_row(n=3) {
	$bottom_key_width = 18.16;
	$bottom_key_height = 18.16;
	$width_difference = 2;
	$height_difference = 2;
	$total_depth = 6;
	$top_tilt = 2.5;
	$top_tilt = (n-3) * -7 + 2.5;
	$top_skew = 0.75;
	$dish_type = "no dish";
	$dish_depth = 0;
	$dish_skew_x = 0;
	$dish_skew_y = 0;
	$minkowski_radius = 1.75;
  //also,
  /*$rounded_key = true;*/


	children();
}
