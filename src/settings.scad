/* [Basic-Settings] */

// what type of stem you want. Most people want Cherry.
$stem_type = "cherry";  // [cherry, alps, rounded_cherry, filled, disable]

// support type. default is "flared" for easy FDM printing; bars are more realistic, and flat could be for artisans
$support_type = "flared"; // [flared, bars, flat, disable]

// length in units of key. A regular key is 1 unit; spacebar is usually 6.25
$key_length = 1.0; // range not working in thingiverse customizer atm [1:0.25:16]

// print brim for connector to help with bed adhesion
$has_brim = false;

// the stem is the hardest part to print, so this variable controls how much 'slop' there is in the stem
$stem_slop = 0.3; // not working in thingiverse customizer atm [0:0.01:1]

// font size used for text
$font_size = 6;

// invert dishing. mostly for spacebar
$inverted_dish = false;

// Enable stabilizers. If you don't want stabilizers use disable; most other keycaps use Cherry stabilizers
$stabilizer_type = "disable"; // [cherry, rounded_cherry, alps, disable]

/* [Advanced] */

/* Key */
// height in units of key. should remain 1 for most uses
$key_height = 1.0;
// keytop thickness, aka how many millimeters between the inside and outside of the top surface of the key
$keytop_thickness = 1;
// wall thickness, aka the thickness of the sides of the keycap. note this is the total thickness, aka 3 = 1.5mm walls
$wall_thickness = 3;
// radius of corners of keycap
$corner_radius = 1;
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

/* Stem */

// where the stems are in relation to the center of the keycap, in units. default is one in the center
$stem_positions = [[0,0]];
// how far the throw distance of the switch is. determines how far the 'cross' in the cherry switch digs into the stem, and how long the keystem needs to be before supports can start. luckily, alps and cherries have a pretty similar throw. can modify to have stouter keycaps for low profile switches, etc
$stem_throw = 4;
// diameter of the outside of the rounded cherry stem
$rounded_cherry_stem_d = 5.5;
// dimensions of alps stem
$alps_stem = [4.45, 2.25];

// how much higher the stem is than the bottom of the keycap.
// inset stem requires support but is more accurate in some profiles
$stem_inset = 0;
// how many degrees to rotate the stems. useful for sideways keycaps, maybe
$stem_rotation = 0;

/* Stabilizers */

// ternary is ONLY for customizer. it will NOT work if you're using this in
// openSCAD, unless you're using the customizer. you should use stabilized() or
// set the variable directly
// array of positions of stabilizers
$stabilizers = $key_length > 5.75 ? [[-50, 0], [50, 0]] : [[-12,0],[12,0]];

/* Shape */

// key shape type, determines the shape of the key. default is 'rounded square'
$key_shape_type = "rounded_square";
// ISO enter needs to be linear extruded NOT from the center. this tells the program how far up 'not from the center' is
$linear_extrude_height_adjustment = 0;
// how many slices will be made, to approximate curves on corners. Leave at 1 if you are not curving corners
// if you're doing fancy bowed keycap sides, this controls how many slices you take
$height_slices = 1;

/* Dish */

// what type of dish the key has. note that unlike stems and supports a dish ALWAYS gets rendered.
$dish_type = "cylindrical"; // [cylindrical, spherical, sideways cylindrical, old spherical, disable]
// how deep the dish 'digs' into the top of the keycap. this is max depth, so you can't find the height from total_depth - dish_depth. besides the top is skewed anyways
$dish_depth = 1;
// how skewed in the x direction the dish is
$dish_skew_x = 0;
// how skewed in the y direction (height) the dish is
$dish_skew_y = 0;
// if you need the dish to extend further, you can 'overdraw' the rectangle it will hit
$dish_overdraw_width = 0;
// same as width but for height
$dish_overdraw_height = 0;

/* Misc */

// how tall in mm the brim is, if there is one. brim sits around the keystem and helps to secure it while printing.
$brim_height = 0.4;
// font used for text
$font="DejaVu Sans Mono:style=Book";
// whether or not to render fake keyswitches to check clearances
$clearance_check = false;
// use linear_extrude instead of hull slices to make the shape of the key
// should be faster, also required for concave shapes
$linear_extrude_shape = false;
//should the key be rounded? unnecessary for most printers, and very slow
$rounded_key = false;
//minkowski radius. radius of sphere used in minkowski sum for minkowski_key function. 1.75 for G20
$minkowski_radius = .33;

/* Features */

//list of legends to place on a key format: [text, halign, valign, size]
//halign = "left" or "center" or "right"
//valign = "top" or "center" or "bottom"
$legends = [];
//insert locating bump
$key_bump = false;
//height of the location bump from the top surface of the key
$key_bump_depth = 0.5;
//distance to move the bump from the front edge of the key
$key_bump_edge = 0.4;
