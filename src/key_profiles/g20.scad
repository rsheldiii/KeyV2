module g20_row(n=3) {
  $bottom_key_width = 18.16;
  $bottom_key_height = 18.16;
  $width_difference = 2;
  $height_difference = 2;
  $top_tilt = 2.5;
  $top_skew = 0.75;
  $dish_type = "disable";
  $dish_depth = 0;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $minkowski_radius = 1.75;
  $key_bump_depth = 0.6;
  $key_bump_edge = 2;
  //also,
  $rounded_key = true;

  if (n == 5) {
    $total_depth = 6 + abs((n-3) * 0.5);
    $top_tilt =  -18.55;
    children();
  } else if (n == 1) {
    $total_depth = 6 + abs((n-3) * 0.5);
    $top_tilt = (n-3) * 7 + 2.5;
    children();
  } else if (n == 2) {
    $total_depth = 6 + abs((n-3) * 0.5);
    $top_tilt = (n-3) * 7 + 2.5;
    children();
  } else if (n == 3) {
    $total_depth = 6 + abs((n-3) * 0.5);
    $top_tilt = (n-3) * 7 + 2.5;
    children();
  } else if (n == 4) {
    $total_depth = 6 + abs((n-3) * 0.5);
    $top_tilt = (n-3) * 7 + 2.5;
    children();
  } else {
    children();
  }
}
