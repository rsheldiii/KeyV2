module dsa_row(n=3) {
	$bottom_key_width = 18.24; // 18.4;
	$bottom_key_height = 18.24; // 18.4;
	$width_difference = 6; // 5.7;
	$height_difference = 6; // 5.7;
	$total_depth = 8.1 + abs((n-3) * 1);
	$top_tilt = n == 5 ? -21 : (n-3) * 7;
	$top_skew = 0;
	$dish_type = "spherical";
	$dish_depth = 1.2;
	$dish_skew_x = 0;
	$dish_skew_y = 0;
	$height_slices = 10;
	$enable_side_sculpting = true;
	// might wanna change this if you don't minkowski
	// do you even minkowski bro
	$corner_radius = 0.25;

  children();
}
