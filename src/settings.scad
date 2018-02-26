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
// what type of dish the key has. note that unlike stems and supports a dish ALWAYS gets rendered.
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
//when $has_brim this is the height of the brim
$brim_height = 0.2;
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
// what type of stem you want. To turn off stems pass false. "cherry", "alps", and "cherry_rounded" supported
$stem_type = "cherry";
// how much higher the stem is than the bottom of the keycap.
// inset stem requires support but is more accurate in some profiles
$stem_inset = 0;
// how many degrees to rotate the stems. useful for sideways keycaps, maybe
$stem_rotation = 0;
// radius of corners of keycap
$corner_radius = 1;
// support type. default is "flared" for easy FDM printing. to disable pass false
$support_type = "flared";
// key shape type, determines the shape of the key. default is 'rounded square'
$key_shape_type = "rounded_square";
// ISO enter needs to be linear extruded NOT from the center. this tells the program how far up 'not from the center' is
$linear_extrude_height_adjustment = 0;
// if you need the dish to extend further, you can 'overdraw' the rectangle it will hit
$dish_overdraw_width = 0;
// same as width but for height
$dish_overdraw_height = 0;
// how many slices will be made, to approximate curves on corners. Leave at 1 if you are not curving corners
// if you're doing fancy bowed keycap sides, this controls how many slices you take
$height_slices = 1;
// this enables some fancy and currently hardcoded logic to bow the sides and corners of SA keycaps
$enable_side_sculpting = false;

//minkowski radius. radius of sphere used in minkowski sum for minkowski_key function. 1.75 for G20
$minkowski_radius = .33;


// [ Stem Variables ]


// the stem is the hardest part to print, so this variable controls how much 'slop' there is in the stem
$stem_slop = 0.3;

// how tall in mm the brim is, if there is one. brim sits around the keystem and helps to secure it while printing.
$brim_height = 0.4;
// how far the throw distance of the switch is. determines how far the 'cross' in the cherry switch digs into the stem, and how long the keystem needs to be before supports can start. luckily, alps and cherries have a pretty similar throw. can modify to have stouter keycaps for low profile switches, etc
$stem_throw = 4;

// cherry stem dimensions
$cherry_stem = [7.2 - $stem_slop * 2, 5.5 - $stem_slop * 2];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
$cherry_cross = [
  // horizontal tine
  [4.03 + $stem_slop, 1.15 + $stem_slop / 3],
  // vertical tine
  [1.25 + $stem_slop / 3, $cherry_stem[1] + .005],
];

// diameter of the outside of the rounded cherry stem
$rounded_cherry_stem_d = 5.5;

// dimensions of alps stem
$alps_stem = [4.45, 2.25];

//list of legends to place on a key format: [text, halign, valign, size]
//halign = "left" or "center" or "right"
//valign = "top" or "center" or "bottom"
$legends = [];
//insert locating bump
$key_bump = false;
//height of the location bump from the top surface of the key
$key_bump_depth = 0.3;
//distance to move the bump from the front edge of the key
$key_bump_edge = 0.4;

