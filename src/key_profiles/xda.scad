use <../functions.scad>
include <../settings.scad>

module xda_row(row=0, column = 0) {
  $key_shape_type = "sculpted_square";
  $bottom_key_width = 18.1;
  $bottom_key_height = 18.1;
  $width_difference = 3.7;
  $height_difference = 3.7;
  $top_tilt = 0;
  $top_skew = 0;
  $dish_type = "spherical";
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $height_slices = 10;
  $enable_side_sculpting = true;
  $corner_radius = 0.6;

  $side_sculpting = function(progress) (1 - progress) * 3.5;
  $corner_sculpting = function(progress) pow(progress, 2) * 3;

  $top_tilt_y = side_tilt(column);
  extra_height = $double_sculpted ? extra_side_tilt_height(column) : 0;

  // These together make the height = 9.7 at the corners and 9 at the center
  $total_depth = 10.3 + extra_height;
  $dish_depth = 1.3;
  children();
}
