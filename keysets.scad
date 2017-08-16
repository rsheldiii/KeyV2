/*use <key.scad>*/
include <keys.scad>

//TODO duplicate def to not make this a special var. maybe not worth it
unit = 19.05;

// defaults
$bottom_key_width = 18.16;
$bottom_key_height = 18.16;
$width_difference = 6;
$height_difference = 4;
$total_depth = 11.5;
$top_tilt = -6;
$top_skew = 1.7;
$dish_type = 0;
$dish_depth = 1;
$dish_skew_x = 0;
$dish_skew_y = 0;
$key_length = 1;
$key_height = 1;
$has_brim = false;
$inverted_dish = false;
$connectors = [[0,0]];
$ISOEnter = false;
$rounded_key = false;
$stem_profile = 0;
$stem_inset = 0;
$stem_rotation = 0;
$text = "";
$inset_text = false;
$corner_radius = 1;
$height_slices = 1;


for (column = [1:15]){
  for(row = [1:4]) {
    echo(row);
    translate_u(column, row) dishless() dcs_row(5-row)  blank() key();
  }
}
