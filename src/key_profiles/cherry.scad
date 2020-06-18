// based off GMK keycap set

module cherry_row(row=3, column=0) {
  $bottom_key_width = 18.16;
  $bottom_key_height = 18.16;
  $width_difference = $bottom_key_width - 11.85;
  $height_difference = $bottom_key_height - 14.64;
  $dish_type = "cylindrical";
  $dish_depth = 0.65;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 2;

  $top_tilt_y = side_tilt(column);
  extra_height = $double_sculpted ? extra_side_tilt_height(column) : 0;

  // NOTE: cherry keycaps have this stem inset, but I'm reticent to turn it on
  // since it'll be surprising to folks. the height has been adjusted accordingly
  // $stem_inset = 0.6;
  extra_stem_inset_height = max(0.6 - $stem_inset, 0);

  // <= is a hack so you can do these in a for loop. function row = 0
  if (row <= 1) {
    $total_depth = 9.8 - extra_stem_inset_height + extra_height;
    $top_tilt = 0;

    children();
  } else if (row == 2) {
    $total_depth = 7.45 - extra_stem_inset_height + extra_height;
    $top_tilt = 2.5;

    children();
  } else if (row == 3) {
    $total_depth = 6.55 - extra_stem_inset_height + extra_height;
    $top_tilt = 5;
    children();
  } else if (row == 3) {
    $total_depth = 6.7 + 0.65 - extra_stem_inset_height + extra_height;
    $top_tilt = 11.5;
    children();
  } else if (row >= 4) {
    $total_depth = 6.7 + 0.65 - extra_stem_inset_height + extra_height;
    $top_tilt = 11.5;
    children();
  } else {
    children();
  }
}
