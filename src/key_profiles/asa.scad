use <../functions.scad>
include <../settings.scad>

module asa_row(row=3, column = 0) {
$key_shape_type = "sculpted_square";
  $bottom_key_height = 18.15;
  $bottom_key_width = 18.10;      // Default (R3)
  $total_depth = 10.75;           // Default (R3)
  $top_tilt = 1.5;                // Default (R3)
  $width_difference = 6.20;
  $height_difference = 6.55;
  $dish_type = "spherical";
  $dish_depth = 1.3;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 1.75;
  $stem_inset = 1.2;
  $height_slices = 10;

  $corner_radius = 1;
  $more_side_sculpting_factor = 0.4;

  $side_sculpting = function(progress) (1 - progress) * 4.5;
  $corner_sculpting = function(progress) pow(progress, 2);

  // this is _incredibly_ intensive
  //$rounded_key = true;

  if (row == 1){
    $total_depth = 10.5;
    $top_tilt = 9.33;
    children();
  } else if (row == 2) {
    $total_depth = 9.95;
    $top_tilt = 4;
    children();
  } else if (row == 4){
    $total_depth = 12.55;
    $top_tilt = 0.43;
    children();
  }else{
    children();
  }  		
}
