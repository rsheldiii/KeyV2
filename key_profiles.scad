// key profile definitions

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

module dsa_row(n=3) {
	$bottom_key_width = 18.24; // 18.4;
	$bottom_key_height = 18.24; // 18.4;
	$width_difference = 6; // 5.7;
	$height_difference = 6; // 5.7;
	$total_depth = 8.1;
	$top_tilt = (n-1) * 7 - 14;
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

module g20() {
	$bottom_key_width = 18.16;
	$bottom_key_height = 18.16;
	$width_difference = 2;
	$height_difference = 2;
	$total_depth = 6;
	$top_tilt = 2.5;
	$top_skew = 0.75;
	$dish_type = "no dish";
	$dish_depth = 0;
	$dish_skew_x = 0;
	$dish_skew_y = 0;
	$minkowski_radius = 1.75;


	children();
  //also,
  /*$rounded_key = true;*/
}
