module dsa_row(n=3) {
  $key_shape_type = "sculpted_square";
  depth_raisers = [0, 3.5, 1, 0, 1, 3];
	$bottom_key_width = 18.24; // 18.4;
	$bottom_key_height = 18.24; // 18.4;
	$width_difference = 6; // 5.7;
	$height_difference = 6; // 5.7;
	$total_depth = 8.1 + depth_raisers[n];
	$top_tilt = n == 5 ? -21 : (n-3) * 7;
	$top_skew = 0;
	$dish_type = "spherical";
	$dish_depth = 1;
	$dish_skew_x = 0;
	$dish_skew_y = 0;
	$height_slices = 10;
	// might wanna change this if you don't minkowski
	// do you even minkowski bro
	$corner_radius = 0.25;

  children();
}
