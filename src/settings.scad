// keytop thickness, aka how many millimeters between the inside and outside of the top surface of the key
$keytop_thickness = 1;
// wall thickness, aka the thickness of the sides of the keycap. note this is the total thickness, aka 3 = 1.5mm walls
$wall_thickness = 3;
//whether stabilizer connectors are enabled
$stabilizers = false;
// font used for text
$font="DejaVu Sans Mono:style=Book";
// font size used for text
$font_size = 6;
// whether or not to render fake keyswitches to check clearances
$clearance_check = false;

/* [Key profile] */

// width of the very bottom of the key
$bottom_key_width = 18.16;
// height (from the front) of the very bottom of the ke
$bottom_key_height = 18.16;
// how much less width there is on the top. eg top_key_width = bottom_key_width - width_difference
$width_difference = 6;
// how much less height there is on the top
$height_difference = 4;
// how deep the key is, before adding a dish
$total_depth = 11.5;
// the tilt of the dish in degrees. divided by key height
$top_tilt = -6;
// how skewed towards the back the top is (0 for center)
$top_skew = 1.7;
// what type of dish the key has. 0 for cylindrical, 1 for spherical, 2 for something else idk TODO
$dish_type = "cylindrical";
// how deep the dish 'digs' into the top of the keycap. this is max depth, so you can't find the height from total_depth - dish_depth. besides the top is skewed anyways
$dish_depth = 1;
// how skewed in the x direction the dish is
$dish_skew_x = 0;
// how skewed in the y direction (height) the dish is
$dish_skew_y = 0;
//length in units of key
$key_length = 1;
//height in units of key. should remain 1 for most uses
$key_height = 1;
//print brim for connector to help with bed adhesion
$has_brim = false;
// invert dishing. mostly for spacebar
$inverted_dish = false;
// array of positions of all stems. includes stabilizers as well, for now
// ternary is a bad hack to keep the stabilizers flag working
$connectors = $stabilizers ? [[0,0],[-50,0],[50,0]] : [[0,0]];
// use linear_extrude instead of hull slices to make the shape of the key
// should be faster, also required for concave shapes
$linear_extrude_shape = false;
//should the key be rounded? unnecessary for most printers, and very slow
$rounded_key = false;
// 'cherry', 'alps' or 'cherry_rounded'
$stem_profile = "cherry";
// how much higher the stem is than the bottom of the keycap.
// inset stem requires support but is more accurate in some profiles
$stem_inset = 0;
// how many degrees to rotate the stems. useful for sideways keycaps, maybe
$stem_rotation = 0;
//text to be rendered in the center of the key, if any
$text = "";
// is the text on the key inset? inset text is still experimental
$inset_text = false;
// radius of corners of keycap
$corner_radius = 1;
// keystem slop - lengthens the cross and thins out the connector
$slop = 0.3;
// support type. default is 'flared' for easy FDM printing
$support_type = "flared";
// key shape type. default is 'normal'. only other supported option is 'iso_enter'
$key_shape_type = "normal";
// ISO enter needs to be linear extruded NOT from the center. this tells the program how far up 'not from the center' is
$linear_extrude_height_adjustment = 0;
// if you need the dish to extend further, you can 'overdraw' the rectangle it will hit
$dish_overdraw_width = 0;
// same as width but for height
$dish_overdraw_height = 0;
// how many slices will be made, to approximate curves on corners. Leave at 1 if you are not curving corners
$height_slices = 1;
