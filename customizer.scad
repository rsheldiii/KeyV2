// entry point for customizer script. This probably isn't useful to most people,
// as it's just a wrapper that helps generate customizer.scad for thingiverse.

/* [Basic-Settings] */

// what preset profile do you wish to use? disable if you are going to set paramters below
key_profile = "dcs"; // [dcs, oem, dsa, sa, g20, disable]
// what key profile row is this keycap on? 0 for disable
row = 1; // [5,1,2,3,4,0]

// What does the top of your key say?
legend = "";

$using_customizer = true;

/* [Basic-Settings] */

// Length in units of key. A regular key is 1 unit; spacebar is usually 6.25
$key_length = 1.0; // Range not working in thingiverse customizer atm [1:0.25:16]

// What type of stem you want. Most people want Cherry.
$stem_type = "cherry";  // [cherry, alps, rounded_cherry, box_cherry, filled, disable]

// The stem is the hardest part to print, so this variable controls how much 'slop' there is in the stem
// if your keycaps stick in the switch raise this value
$stem_slop = 0.35; // Not working in thingiverse customizer atm [0:0.01:1]
// broke this out. if your keycaps are falling off lower this value. only works for cherry stems rn
$stem_inner_slop = 0.2;

// Font size used for text
$font_size = 6;

// Set this to true if you're making a spacebar!
$inverted_dish = false;

// change aggressiveness of double sculpting
// this is the radius of the cylinder the keytops are placed on
$double_sculpt_radius = 200;


// Support type. default is "flared" for easy FDM printing; bars are more realistic, and flat could be for artisans
$support_type = "flared"; // [flared, bars, flat, disable]

// Supports for the stem, as it often comes off during printing. Reccommended for most machines
$stem_support_type = "tines"; // [tines, brim, disabled]

// make legends outset instead of inset.
// broken off from artisan support since who wants outset legends?
$outset_legends = false;

/* [Key] */
// Height in units of key. should remain 1 for most uses
$key_height = 1.0;
// Keytop thickness, aka how many millimeters between the inside and outside of the top surface of the key
$keytop_thickness = 1;
// Wall thickness, aka the thickness of the sides of the keycap. note this is the total thickness, aka 3 = 1.5mm walls
$wall_thickness = 3;
// Radius of corners of keycap
$corner_radius = 1;
// Width of the very bottom of the key
$bottom_key_width = 18.16;
// Height (from the front) of the very bottom of the key
$bottom_key_height = 18.16;
// How much less width there is on the top. eg top_key_width = bottom_key_width - width_difference
$width_difference = 6;
// How much less height there is on the top
$height_difference = 4;
// How deep the key is, before adding a dish
$total_depth = 11.5;
// The tilt of the dish in degrees. divided by key height
$top_tilt = -6;
// the y tilt of the dish in degrees. divided by key width.
// for double axis sculpted keycaps and probably not much else
$top_tilt_y = 0;
// How skewed towards the back the top is (0 for center)
$top_skew = 1.7;

// how skewed towards the right the top is. unused, but implemented.
// for double axis sculpted keycaps and probably not much else
$top_skew_x = 0;

/* [Stem] */

// How far the throw distance of the switch is. determines how far the 'cross' in the cherry switch digs into the stem, and how long the keystem needs to be before supports can start. luckily, alps and cherries have a pretty similar throw. can modify to have stouter keycaps for low profile switches, etc
$stem_throw = 4;
// Diameter of the outside of the rounded cherry stem
$rounded_cherry_stem_d = 5.5;


// How much higher the stem is than the bottom of the keycap.
// Inset stem requires support but is more accurate in some profiles
// can be negative to make outset stems!
$stem_inset = 0;
// How many degrees to rotate the stems. useful for sideways keycaps, maybe
$stem_rotation = 0;

/* [Shape] */

// Key shape type, determines the shape of the key. default is 'rounded square'
$key_shape_type = "rounded_square";
// ISO enter needs to be linear extruded NOT from the center when not using skin. this tells the program how far up 'not from the center' is
$linear_extrude_height_adjustment = 0;
// How many slices will be made, to approximate curves on corners. Leave at 1 if you are not curving corners
// If you're doing fancy bowed keycap sides, this controls how many slices you take
$height_slices = 1;

/* [Dish] */

// What type of dish the key has. note that unlike stems and supports a dish ALWAYS gets rendered.
$dish_type = "cylindrical"; // [cylindrical, spherical, sideways cylindrical, old spherical, disable]
// How deep the dish 'digs' into the top of the keycap. this is max depth, so you can't find the height from total_depth - dish_depth. besides the top is skewed anyways
$dish_depth = 1;
// How skewed in the x direction the dish is
$dish_skew_x = 0;
// How skewed in the y direction (height) the dish is
$dish_skew_y = 0;


$dish_offset_x = 0;

// If you need the dish to extend further, you can 'overdraw' the rectangle it will hit. this was mostly for iso enter and should be deprecated
$dish_overdraw_width = 0;
// Same as width but for height
$dish_overdraw_height = 0;

/* [Misc] */
// There's a bevel on the cherry stems to aid insertion / guard against first layer squishing making a hard-to-fit stem.
$cherry_bevel = true;

// How tall in mm the stem support is, if there is any. stem support sits around the keystem and helps to secure it while printing.
$stem_support_height = .8;
// Font used for text
$font="DejaVu Sans Mono:style=Book";
// Whether or not to render fake keyswitches to check clearances
$clearance_check = false;
// Should be faster, also required for concave shapes

// what kind of extrusion we use to create the keycap. "hull" is standard, "linear extrude" is legacy, "skin" is new and not well supported.
$hull_shape_type = "hull"; // ["hull", "linear extrude", "skin"]

// This doesn't work very well, but you can try
$rounded_key = false;
//minkowski radius. radius of sphere used in minkowski sum for minkowski_key function. 1.75 for G20
$minkowski_radius = .33;

/* [Features] */

//insert locating bump
$key_bump = false;
//height of the location bump from the top surface of the key
$key_bump_depth = 0.5;
//distance to move the bump from the front edge of the key
$key_bump_edge = 0.4;

/* [Hidden] */

// set this to true if you are making double sculpted keycaps
$double_sculpted = false;

//list of legends to place on a key format: [text, halign, valign, size]
//halign = "left" or "center" or "right"
//valign = "top" or "center" or "bottom"
// Currently does not work with thingiverse customizer, and actually breaks it
$legends = [];

//list of front legends to place on a key format: [text, halign, valign, size]
//halign = "left" or "center" or "right"
//valign = "top" or "center" or "bottom"
// Currently does not work with thingiverse customizer, and actually breaks it
$front_legends = [];

// print legends on the front of the key instead of the top
$front_print_legends = false;

// how recessed inset legends / artisans are from the top of the key
$inset_legend_depth = 0.2;

// Dimensions of alps stem
$alps_stem = [4.45, 2.25];

// Dimensions of choc stem
$choc_stem = [1.2, 3];

// Enable stabilizer stems, to hold onto your cherry or costar stabilizers
$stabilizer_type = "costar_stabilizer"; // [costar_stabilizer, cherry_stabilizer, disable]

// Ternaries are ONLY for customizer. they will NOT work if you're using this in
// OpenSCAD. you should use stabilized(), openSCAD customizer,
// or set $stabilizers directly
// Array of positions of stabilizers
$stabilizers = $key_length >= 6 ? [[-50, 0], [50, 0]] : $key_length >= 2 ? [[-12,0],[12,0]] : [];

// Where the stems are in relation to the center of the keycap, in units. default is one in the center
// Shouldn't work in thingiverse customizer, though it has been...
$stem_positions = [[0,0]];

// colors
$primary_color = [.2667,.5882,1];
$secondary_color = [.4412, .7, .3784];
$tertiary_color = [1, .6941, .2];
$quaternary_color = [.4078, .3569, .749];
$warning_color = [1,0,0, 0.15];

// how many facets circles will have when used in these features
$minkowski_facets = 30;
$shape_facets =30;



// "flat" / "dished" / "disable"
$inner_shape_type = "flat";

// When sculpting sides using sculpted_square, how much in should the tops come
$side_sculpting_factor = 4.5;
// When sculpting corners, how much extra radius should be added
$corner_sculpting_factor = 1;
// When doing more side sculpting corners, how much extra radius should be added
$more_side_sculpting_factor = 0.4;

// 3d surface functions (still in beta)

// 3d surface settings
// unused for now
$3d_surface_size = 20;
// resolution in each axis. 10 = 10 divisions per x/y = 100 points total. 
// 5 = 20 divisions per x/y
$3d_surface_step = 1;

// monotonically increasing function that distributes the points of the surface mesh
// only for polar_3d_surface right now
// if it's linear it's a grid. sin(dim) * size concentrates detail around the edges
sinusoidal_surface_distribution = function(dim,size) sin(dim) * size;
linear_surface_distribution = function(dim,size) sin(dim) * size;

$surface_distribution_function = linear_surface_distribution;

// the function that actually determines what the surface is.
// feel free to override, the last one wins

// debug
// $surface_function = function(x,y) 1;
cylindrical_surface = function(x,y) (sin(acos(x/$3d_surface_size)));
spherical_surface = function(x,y) (1 - (x/$3d_surface_size)^2)^0.5 * (1 - (y/$3d_surface_size)^2)^0.5;
// looks a lot like mt3
quartic_surface = function(x,y) (1 - (x/$3d_surface_size)^4)^0.5 * (1 - (y/$3d_surface_size)^4)^0.5;
ripple_surface = function(x,y) cos((x^2+y^2)^0.5 * 50)/4 + 0.75; 
rosenbrocks_banana_surface = function(x,y) (pow(1-(x/$3d_surface_size))^2 + 100 * pow((y/$3d_surface_size)-(x/$3d_surface_size)^2)^2)/200 + 0.1;
spike_surface = function(x,y) 1/(((x/$3d_surface_size)^2+(y/$3d_surface_size)^2)^0.5) + .01;
random_surface = function(x,y) sin(rands(0,90,1,x+y)[0]);
bumps_surface = function(x,y) sin(20*x)*cos(20*y)/3+1;

$surface_function = bumps_surface; // bumps_surface;

// ripples
/* 
// Rosenbrock's banana
/* $
// y=x revolved around the y axis
/* $surface_function =  */
/* $surface_function =  */
// key width functions

module u(u=1) {
  $key_length = u;
  children();
}

module 1u() {
  u(1) children();
}

module 1_25u() {
  u(1.25) children();
}

module 1_5u() {
  u(1.5) children();
}

module 1_75u(){
  u(1.75) children();
}

module 2u() {
  u(2) children();
}

module 2_25u() {
  u(2.25) children();
}

module 2_50u() {
  u(2.5) children();
}

module 2_75u() {
  u(2.75) children();
}

module 6_25u() {
  u(6.25) children();
}

// key height functions

module uh(u=1) {
  $key_height = u;
  children();
}

module 1uh() {
  uh(1) children();
}

module 2uh() {
  uh(2) children();
}

module 1_25uh() {
  uh(1.25) children();
}

module 1_5uh() {
  uh(1.5) children();
}

module 2_25uh() {
  uh(2.25) children();
}

module 2_75uh() {
  uh(2.75) children();
}

module 6_25uh() {
  uh(6.25) children();
}
// key profile definitions

// unlike the other files with their own dedicated folders, this one doesn't
// need a selector. I wrote one anyways for customizer support though
module dcs_row(row=3, column=0) {
  $bottom_key_width = 18.16;
  $bottom_key_height = 18.16;
  $width_difference = 6;
  $height_difference = 4;
  $dish_type = "cylindrical";
  $dish_depth = 0.5;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 1.75;

  $top_tilt_y = side_tilt(column);
  extra_height = $double_sculpted ? extra_side_tilt_height(column) : 0;

  // this dish depth should match the depth of the uberdishing in fully sculpted mode
  // but it doesn't, and it's very slight for any reasonable double sculpting
  /* $dish_depth = $double_sculpt_radius - sin(acos(top_total_key_width()/2 /$double_sculpt_radius)) * $double_sculpt_radius; */

  /* echo("DISH DEPTH", $dish_depth, "column", column); */

  // 5/0 is a hack so you can do these in a for loop
  if (row == 5 || row == 0) {
    $total_depth = 11.5 + extra_height;
    $top_tilt = -6;

    children();
  } else if (row == 1) {
    $total_depth = 8.5 + extra_height;
    $top_tilt = -1;

    children();
  } else if (row == 2) {
    $total_depth = 7.5 + extra_height;
    $top_tilt = 3;
    children();
  } else if (row == 3) {
    $total_depth = 6 + extra_height;
    $top_tilt = 7;
    children();
  } else if (row == 4) {
    $total_depth = 6 + extra_height;
    $top_tilt = 16;
    children();
  } else {
    children();
  }
}
module oem_row(row=3, column = 0) {
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

  $top_tilt_y = side_tilt(column);
  extra_height =  $double_sculpted ? extra_side_tilt_height(column) : 0;

  if (row == 5 || row == 0) {
    $total_depth = 11.2 + extra_height;
    $top_tilt = -3;
    children();
  } else if (row == 1) {
    $total_depth = 9.45 + extra_height;
    $top_tilt = 1;
    children();
  } else if (row == 2) {
    $total_depth = 9 + extra_height;
    $top_tilt = 6;
    children();
  } else if (row == 3) {
    $total_depth = 9.25 + extra_height;
    $top_tilt = 9;
    children();
  } else if (row == 4) {
    $total_depth = 9.25 + extra_height;
    $top_tilt = 10;
    children();
  } else {
    children();
  }
}
module dsa_row(row=3, column = 0) {
  $key_shape_type = "sculpted_square";
  $bottom_key_width = 18.24; // 18.4;
  $bottom_key_height = 18.24; // 18.4;
  $width_difference = 6; // 5.7;
  $height_difference = 6; // 5.7;
  $top_tilt = row == 5 ? -21 : (row-3) * 7;
  $top_skew = 0;
  $dish_type = "spherical";
  $dish_depth = 1.2;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $height_slices = 10;
  $enable_side_sculpting = true;
  $corner_radius = 1;

  $top_tilt_y = side_tilt(column);
  extra_height = $double_sculpted ? extra_side_tilt_height(column) : 0;

  depth_raisers = [0, 3.5, 1, 0, 1, 3];
  if (row < 1 || row > 4) {
    $total_depth = 8.1 + depth_raisers[row] + extra_height;
    children();
  } else if (row == 1) {
    $total_depth = 8.1 + depth_raisers[row] + extra_height;
    children();
  } else if (row == 2) {
    $total_depth = 8.1 + depth_raisers[row] + extra_height;
    children();
  } else if (row == 3) {
    $total_depth = 8.1 + depth_raisers[row] + extra_height;
    children();
  } else if (row == 4) {
    $total_depth = 8.1 + depth_raisers[row] + extra_height;
    children();
  } else {
    children();
  }
}
module sa_row(n=3, column=0) {
  $key_shape_type = "sculpted_square";
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
  $corner_radius = 1;

  // this is _incredibly_ intensive
  /* $rounded_key = true; */

  $top_tilt_y = side_tilt(column);
  extra_height = $double_sculpted ? extra_side_tilt_height(column) : 0;

  // 5th row is usually unsculpted or the same as the row below it
  // making a super-sculpted top row (or bottom row!) would be real easy
  // bottom row would just be 13 tilt and 14.89 total depth
  // top row would be something new entirely - 18 tilt maybe?
  if (n <= 1){
    $total_depth = 14.89 + extra_height;
    $top_tilt = -13;
    children();
  } else if (n == 2) {
    $total_depth = 12.925 + extra_height;
    $top_tilt = -7;
    children();
  } else if (n == 3) {
    $total_depth = 12.5 + extra_height;
    $top_tilt = 0;
    children();
  } else if (n == 4){
    $total_depth = 12.925 + extra_height;
    $top_tilt = 7;
    children();
  } else {
    $total_depth = 12.5 + extra_height;
    $top_tilt = 0;
    children();
  }
}
module g20_row(row=3, column = 0) {
  $bottom_key_width = 18.16;
  $bottom_key_height = 18.16;
  $width_difference = 2;
  $height_difference = 2;
  $top_tilt = 2.5;
  $top_skew = 0.75;
  $dish_type = "disable";
  // something weird is going on with this and legends - can't put it below 1.2 or they won't show
  $dish_depth = 1.2;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $minkowski_radius = 1.75;
  $key_bump_depth = 0.6;
  $key_bump_edge = 2;
  //also,
  $rounded_key = true;

  $top_tilt_y = side_tilt(column);
  extra_height =  $double_sculpted ? extra_side_tilt_height(column) : 0;

  $total_depth = 6 + abs((row-3) * 0.5) + extra_height;

  if (row == 5 || row == 0) {

    $top_tilt =  -18.55;
    children();
  } else if (row == 1) {
    $top_tilt = (row-3) * 7 + 2.5;
    children();
  } else if (row == 2) {
    $top_tilt = (row-3) * 7 + 2.5;
    children();
  } else if (row == 3) {
    $top_tilt = (row-3) * 7 + 2.5;
    children();
  } else if (row == 4) {
    $top_tilt = (row-3) * 7 + 2.5;
    children();
  } else {
    children();
  }
}
module hipro_row(row=3, column=0) {
  $key_shape_type = "sculpted_square";

  $bottom_key_width = 18.35;
  $bottom_key_height = 18.17;

  $width_difference = ($bottom_key_width - 12.3);
  $height_difference = ($bottom_key_height - 12.65);
  $dish_type = "squared scoop";
  $dish_depth = 0.75;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 0;
  $height_slices = 10;
  $corner_radius = 1;

  $top_tilt_y = side_tilt(column);
  extra_height =  $double_sculpted ? extra_side_tilt_height(column) : 0;

  if (row <= 1){
    $total_depth = 13.7 + extra_height;
    // TODO I didn't change these yet
    $top_tilt = -13;
    children();
  } else if (row == 2) {
    $total_depth = 11.1 + extra_height;
    $top_tilt = -7;
    children();
  } else if (row == 3) {
    $total_depth = 11.1 + extra_height;
    $top_tilt = 7;
    children();
  } else if (row == 4 || row == 5){
    $total_depth = 12.25 + extra_height;
    $top_tilt = 13;
    children();
  } else {
    children();
  }
}
// This is an imperfect attempt to clone the MT3 profile
module mt3_row(row=3, column=0, deep_dish=false) {
  $key_shape_type = "sculpted_square";

  $bottom_key_width = 18.35;
  $bottom_key_height = 18.6;

  $width_difference = ($bottom_key_width - 13.0);
  $height_difference = ($bottom_key_height - 13.0);
  $dish_type = "squared spherical";
  $dish_depth = deep_dish ? 1.6 : 1.2;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 0;
  $height_slices = 10;

  $corner_sculpting_factor = 2;
  $corner_radius = 0.0125;

  $more_side_sculpting_factor = 0.75;

  $top_tilt_y = side_tilt(column);
  extra_height =  $double_sculpted ? extra_side_tilt_height(column) : 0;

  if (row == 0){
    // TODO I didn't change these yet
    $total_depth = 14.7 + extra_height;
    $top_tilt = -12.5;
    children();
  } else if (row == 1) {
    $total_depth = 13.1 + extra_height;
    $top_tilt = -6;
    children();
  }  else if (row == 2) {
    $total_depth = 10.7 + extra_height;
    $top_tilt = -6;
    children();
  } else if (row == 3) {
    $total_depth = 10.7 + extra_height;
    $top_tilt = 6;
    children();
  } else if (row == 4){
    $total_depth = 11.6 + extra_height;
    $top_tilt = 12;
    children();
  } else if (row >= 5) {
    $total_depth = 11.6 + extra_height;
    $top_tilt = 0;
    children();
  } else {
    children();
  }
}
module grid_row(row=3, column = 0) {
  $bottom_key_width = 18.16;
  $bottom_key_height = 18.16;
  $width_difference = 1;
  $height_difference = 1;
  $top_tilt = 0;
  $top_skew = 0;
  $dish_type = "old spherical";
  // something weird is going on with this and legends - can't put it below 1.2 or they won't show
  $dish_depth = 1;
  $dish_skew_x = 0;
  $dish_skew_y = 0;

  $hull_shape_type = "linear extrude";


  $dish_overdraw_width = -6.5;
  $dish_overdraw_height = -6.5;

  $minkowski_radius = 0.5;
  //also,
  /* $rounded_key = true; */

  $top_tilt_y = side_tilt(column);
  extra_height =  $double_sculpted ? extra_side_tilt_height(column) : 0;

  $total_depth = 7 + abs((row-3) * 0.5) + extra_height;

  if (row == 5 || row == 0) {
    /* $top_tilt =  -18.55; */
    children();
  } else if (row == 1) {
    /* $top_tilt = (row-3) * 7 + 2.5; */
    children();
  } else if (row == 2) {
    /* $top_tilt = (row-3) * 7 + 2.5; */
    children();
  } else if (row == 3) {
    /* $top_tilt = (row-3) * 7 + 2.5; */
    children();
  } else if (row == 4) {
    /* $top_tilt = (row-3) * 7 + 2.5; */
    children();
  } else {
    children();
  }
}
// a safe theoretical distance between two vertices such that they don't collapse. hard to use
SMALLEST_POSSIBLE = 1/128;
$fs=0.1;
$unit=19.05;
// Regular polygon shapes CIRCUMSCRIBE the sphere of diameter $bottom_key_width
// This is to make tiling them easier, like in the case of hexagonal keycaps etc

// this function doesn't set the key shape, so you can't use it directly without some fiddling
module regular_polygon_row(n=3, column=0) {
  $bottom_key_width = $unit - 0.5;
  $bottom_key_height = $unit - 0.5;
  $width_difference = 0;
  $height_difference = 0;
  $dish_type = "spherical";
  $dish_depth = 0.85;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 0;
  $height_slices = 1;
  $corner_radius = 1;

  // this is _incredibly_ intensive
  /* $rounded_key = true; */

  $top_tilt_y = side_tilt(column);
  extra_height = $double_sculpted ? extra_side_tilt_height(column) : 0;

  base_depth = 7.5;
  if (n <= 1){
    $total_depth = base_depth + 2.5 + extra_height;
    $top_tilt = -13;

    children();
  } else if (n == 2) {
    $total_depth = base_depth + 0.5 + extra_height;
    $top_tilt = -7;

    children();
  } else if (n == 3) {
    $total_depth = base_depth + extra_height;
    $top_tilt = 0;

    children();
  } else if (n == 4){
    $total_depth = base_depth + 0.5 + extra_height;
    $top_tilt = 7;

    children();
  } else {
    $total_depth = base_depth + extra_height;
    $top_tilt = 0;

    children();
  }
}

module hexagonal_row(n=3, column=0) {
  $key_shape_type = "hexagon";
  regular_polygon_row(n,column) {
    children();
  }
}

module octagonal_row(n=3, column=0) {
  $key_shape_type = "octagon";
  regular_polygon_row(n, column) {
    children();
  }
}
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
module dss_row(n=3, column=0) {
  $key_shape_type = "sculpted_square";
  $bottom_key_width = 18.24;
  $bottom_key_height = 18.24;
  $width_difference = 6;
  $height_difference = 6;
  $dish_type = "spherical";
  $dish_depth = 1.2;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 0;
  $height_slices = 10;
  $enable_side_sculpting = true;
  // might wanna change this if you don't minkowski
  // do you even minkowski bro
  $corner_radius = 1;

  // this is _incredibly_ intensive
  /* $rounded_key = true; */

  $top_tilt_y = side_tilt(column);
  extra_height = $double_sculpted ? extra_side_tilt_height(column) : 0;

  // 5th row is usually unsculpted or the same as the row below it
  // making a super-sculpted top row (or bottom row!) would be real easy
  // bottom row would just be 13 tilt and 14.89 total depth
  // top row would be something new entirely - 18 tilt maybe?
  if (n <= 1){
    $total_depth = 10.5 + extra_height;
    $top_tilt = -1;
    children();
  } else if (n == 2) {
    $total_depth = 8.6 + extra_height;
    $top_tilt = 3;
    children();
  } else if (n == 3) {
    $total_depth = 7.9 + extra_height;
    $top_tilt = 8;
    children();
  } else if (n == 4){
    $total_depth = 9.1 + extra_height;
    $top_tilt = 16;
    children();
  } else {
    $total_depth = 7.9 + extra_height;
    $top_tilt = 8;
    children();
  }
}module asa_row(row=3, column = 0) {
  $key_shape_type = "sculpted_square";
  $bottom_key_height = 18.06;
  $bottom_key_width = 18.05;      // Default (R3)
  $total_depth = 10.35;           // Default (R3)
  $top_tilt = 1.5;                // Default (R3)
  $width_difference = 5.05;
  $height_difference = 5.56;
  $dish_type = "spherical";
  $dish_depth = 1.2;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 1.75;
  $stem_inset = 1.2;
  $height_slices = 10;
  $corner_radius = 1;

  // this is _incredibly_ intensive
  //$rounded_key = true;

  if (row == 1){
    $bottom_key_width = 17.95;
    $width_difference = 4.95;
    $total_depth = 10.65;
    $top_tilt = 7;
    children();
  } else if (row == 2) {
    $bottom_key_width = 18.17;
    $width_difference = 5.17;
    $total_depth = 9.65;
    $top_tilt = 3.25;
    children();
  } else if (row == 4){
    $bottom_key_width = 18.02;
    $width_difference = 5.02;
    $total_depth = 11.9;
    $top_tilt = 0.43;
    children();
  } else {
    children();
  }
}
// a safe theoretical distance between two vertices such that they don't collapse. hard to use
SMALLEST_POSSIBLE = 1/128;
$fs=0.1;
$unit=19.05;
// Regular polygon shapes CIRCUMSCRIBE the sphere of diameter $bottom_key_width
// This is to make tiling them easier, like in the case of hexagonal keycaps etc

// this function doesn't set the key shape, so you can't use it directly without some fiddling
module typewriter_row(n=3, column=0) {
  $bottom_key_width = $unit - 0.5;
  $bottom_key_height = $unit - 0.5;
  $width_difference = 0;
  $height_difference = 0;
  $dish_type = "spherical";
  $key_shape_type = "circular";
  $inverted_dish = true;
  $stem_inset = -4.5;
  $stem_throw = 5;
  $dish_depth = 1;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 0;
  $height_slices = 1;
  $stem_support_type = "disable";
//   $corner_radius = 1;

  // this is _incredibly_ intensive
  /* $rounded_key = true; */

  $top_tilt_y = side_tilt(column);
  extra_height = $double_sculpted ? extra_side_tilt_height(column) : 0;

  base_depth = 3.5;
  if (n <= 1){
    $total_depth = base_depth + 2.5 + extra_height;
    $top_tilt = -13;

    children();
  } else if (n == 2) {
    $total_depth = base_depth + 0.5 + extra_height;
    $top_tilt = -7;

    children();
  } else if (n == 3) {
    $total_depth = base_depth + extra_height;
    $top_tilt = 0;

    children();
  } else if (n == 4){
    $total_depth = base_depth + 0.5 + extra_height;
    $top_tilt = 7;

    children();
  } else {
    $total_depth = base_depth + extra_height;
    $top_tilt = 0;

    children();
  }
}
// man, wouldn't it be so cool if functions were first order
module key_profile(key_profile_type, row, column=0) {
  if (key_profile_type == "dcs") {
    dcs_row(row, column) children();
  } else if (key_profile_type == "oem") {
    oem_row(row, column) children();
  } else if (key_profile_type == "dsa") {
    dsa_row(row, column) children();
  } else if (key_profile_type == "dss") {
    dss_row(row, column) children();
  } else if (key_profile_type == "sa") {
    sa_row(row, column) children();
  } else if (key_profile_type == "asa") {
    asa_row(row, column) children();
  } else if (key_profile_type == "g20") {
    g20_row(row, column) children();
  } else if (key_profile_type == "hipro") {
    hipro_row(row, column) children();
  } else if (key_profile_type == "grid") {
    grid_row(row, column) children();
  } else if (key_profile_type == "typewriter") {
    typewriter_row(row, column) children();
  } else if (key_profile_type == "hexagon") {
    hexagonal_row(row, column) children();
  } else if (key_profile_type == "octagon") {
    octagonal_row(row, column) children();
  } else if (key_profile_type == "cherry") {
    cherry_row(row, column) children();
  } else if (key_profile_type == "mt3") {
    mt3_row(row, column) children();  
  } else if (key_profile_type == "disable") {
    children();
  } else {
    echo("Warning: unsupported key_profile_type");
  }
}
// a safe theoretical distance between two vertices such that they don't collapse. hard to use
SMALLEST_POSSIBLE = 1/128;
$fs=0.1;
$unit=19.05;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

function stem_height() = $total_depth - $dish_depth - $stem_inset;

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// cherry stabilizer stem dimensions
function outer_cherry_stabilizer_stem(slop) = [4.85 - slop * 2, 6.05 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.25 + slop / 3],
  // vertical tine
  [1.15 + slop / 3, 4.23 + extra_vertical + slop / 3 + SMALLEST_POSSIBLE],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

function side_tilt(column) = asin($unit * column / $double_sculpt_radius);
// tan of 0 is 0, division by 0 is nan, so we have to guard
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - ($unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// adds uniform rounding radius for round-anything polyRound
function add_rounding(p, radius)=[for(i=[0:len(p)-1])[p[i].x,p[i].y, radius]];
// computes millimeter length from unit length
function unit_length(length) = $unit * (length - 1) + 18.16;

module spacebar() {
  $inverted_dish = $dish_type != "disable";
  $dish_type = $dish_type != "disable" ? "sideways cylindrical" : "disable";
  6_25u() stabilized(mm=50) children();
}

module lshift() {
  2_25u() stabilized() children();
}

module rshift() {
  2_75u() stabilized() children();
}

module backspace() {
  2u() stabilized() children();
}

module enter() {
  2_25u() stabilized() children();
}

module numpad_enter() {
  2uh() stabilized(vertical=true) children();
}

module numpad_plus() {
  numpad_enter() children();
}

module numpad_0() {
  backspace() children();
}

module stepped_caps_lock() {
  u(1.75) {
    $stem_positions = [[-5, 0]];
    children();
  }
}

module iso_enter() {
  $key_length = 1.5;
  $key_height = 2;

  $dish_offset_x = -(unit_length(1.5) - unit_length(1.25))/2;

  /* $top_tilt = 0; */
  $stem_support_type = "disable";
  $key_shape_type = "iso_enter";
  $hull_shape_type = "skin";
  $linear_extrude_height_adjustment = 19.05 * 0.5;
  // this equals (unit_length(1.5) - unit_length(1.25)) / 2
  /* $dish_overdraw_width = 2.38125; */

  render() {
    stabilized(vertical=true) {
      children();
    }
  }
}
// kind of a catch-all at this point for any directive that doesn't fit in the other files

// a safe theoretical distance between two vertices such that they don't collapse. hard to use
SMALLEST_POSSIBLE = 1/128;
$fs=0.1;
$unit=19.05;

module translate_u(x=0, y=0, z=0){
  translate([x * $unit, y*$unit, z*$unit]) children();
}

module no_stem_support() {
  $stem_support_type = "disable";
  children();
}

module brimmed_stem_support(height = 0.4) {
  $stem_support_type = "brim";
  $stem_support_height = height;
  children();
}

module tined_stem_support(height = 0.4) {
  $stem_support_type = "tines";
  $stem_support_height = height;
  children();
}

module unsupported_stem() {
  $stem_support_type = "disable";
  children();
}

module rounded() {
  $rounded_key = true;
  children();
}

module inverted() {
  $inverted_dish = true;
  children();
}

module rotated() {
  $stem_rotation = 90;
  children();
}

module vertically_stabilized(mm=12, vertical=true, type=undef) {
  stabilized(mm,vertical,type) {
    children();
  }
}

module stabilized(mm=12, vertical = false, type=undef) {
  if (vertical) {
    $stabilizer_type = (type ? type : ($stabilizer_type ? $stabilizer_type : "costar_stabilizer"));
    $stabilizers = [
    [0,  mm],
    [0, -mm]
    ];

    children();
  } else {
    $stabilizer_type = (type ? type : ($stabilizer_type ? $stabilizer_type : "costar_stabilizer"));


    $stabilizers = [
      [mm,  0],
      [-mm, 0]
    ];

    children();
  }
}

module dishless() {
  $dish_type = "disable";
  children();
}

module inset(val=1) {
  $stem_inset = val;
  children();
}

module filled() {
  $stem_type = "filled";
  children();
}

module blank() {
  $stem_type = "disable";
  children();
}

module cherry(slop = undef) {
  $stem_slop = slop != undef ? slop : $stem_slop;
  $stem_type = "cherry";
  children();
}

module alps(slop = undef) {
  $stem_slop = slop != undef ? slop : $stem_slop;
  $stem_type = "alps";
  children();
}

module rounded_cherry(slop = undef) {
  $stem_slop = slop != undef ? slop : $stem_slop;
  $stem_type = "rounded_cherry";
  children();
}

module box_cherry(slop = undef) {
  $stem_slop = slop != undef ? slop : $stem_slop;
  $stem_type = "box_cherry";
  children();
}

module choc(slop = 0.05) {
  echo("WARN:\n\n * choc support is experimental.\n * $stem_slop is overridden.\n * it is also recommended to print them upside down if you can\n\n");
  $stem_throw = 3;
  $stem_slop = slop;

  $bottom_key_width = 18;
  $bottom_key_height = 17;

  $stem_type = "choc";
  children();
}

// a hacky way to make "low profile" keycaps
module low_profile() {
  $width_difference = $width_difference / 1.5;
  $height_difference = $height_difference / 1.5;
  // helps tilted keycaps not have holes if worst comes to worst
  $inner_shape_type = "dished";

  $top_tilt = $top_tilt / 1.25;

  $total_depth = ($total_depth / 2) < 7 ? 7 : $total_depth / 2;

  // just to make sure
  $stem_throw = 3;
  children();
}

module flared_support() {
  $support_type = "flared";
  children();
}

module bar_support() {
  $support_type = "bars";
  children();
}

module flat_support() {
  $support_type = "flat";
  children();
}

module legend(text, position=[0,0], size=undef) {
    font_size = size == undef ? $font_size : size;
    $legends = [for(L=[$legends, [[text, position, font_size]]], a=L) a];
    children();
}

module front_legend(text, position=[0,0], size=undef) {
    font_size = size == undef ? $font_size : size;
    $front_legends = [for(L=[$front_legends, [[text, position, font_size]]], a=L) a];
    children();
}

module bump(depth=undef) {
    $key_bump = true;
    $key_bump_depth = depth == undef ? $key_bump_depth : depth;
    children();
}

// kinda dirty, but it works
// might not work great with fully sculpted profiles yet
// NOTE: this needs to come after row declarations or it won't work
module upside_down() {
  if ($stem_inner_slop != 0) {
    echo("it is recommended you set inner stem slop to 0 when you use upside_down()");
  }

  $stem_support_type = "disable";
  // $top_tilt*2 because top_placement rotates by top_tilt for us
  // first rotate 180 to get the keycaps to face the same direction
  rotate([0,0,180]) top_placement() rotate([180+$top_tilt*2,0,0]) {
    children();
  }
}

module sideways() {
  $stem_support_type = "disable";
  $key_shape_type = "flat_sided_square";
  $dish_overdraw_width = abs(extra_keytop_length_for_flat_sides());
  extra_y_rotation = atan2($width_difference/2,$total_depth); // TODO assumes centered top
  translate([0,0,cos(extra_y_rotation) * total_key_width()/2])
  rotate([0,90 + extra_y_rotation ,0]) children();
}

/* this is hard to explain. we want the angle of the back of the keycap.
 * first we draw a line at the back of the keycap perpendicular to the ground.
 * then we extend the line created by the slope of the keytop to that line
 * the angle of the latter line off the ground is $top_tilt, and
 * you can create a right triangle with the adjacent edge being $bottom_key_height/2
 * raised up $total_depth. this gets you x, the component of the extended 
 * keytop slope line, and y, a component of the first perpendicular line.
 * by a very similar triangle you get r and s, where x is the hypotenuse of that
 * right triangle and the right angle is again against the first perpendicular line
 * s is the opposite line in the right triangle required to find q, the angle
 * of the back. if you subtract r from $total_depth plus y you can now use these
 * two values in atan to find the angle of interest.
 */
module backside() {
  $stem_support_type = "disable";

  // $key_shape_type = "flat_sided_square";

  a = $bottom_key_height;
  b = $total_depth;
  c = top_total_key_height();

  x = (a / 2 - $top_skew) / cos(-$top_tilt) - c / 2;
  y = sin(-$top_tilt) * (x + c/2);
  r = sin(-$top_tilt) * x;
  s = cos(-$top_tilt) * x;

  q = atan2(s, (y + b - r));
  
  translate([0,0,cos(q) * total_key_height()/2])
    rotate([-90 - q, 0,0]) children();
}

// this is just backside with a few signs switched
module frontside() {
  $stem_support_type = "disable";

  // $key_shape_type = "flat_sided_square";

  a = $bottom_key_height;
  b = $total_depth;
  c = top_total_key_height();

  x = (a / 2 + $top_skew) / cos($top_tilt) - c / 2;
  y = sin($top_tilt) * (x + c/2);
  r = sin($top_tilt) * x;
  s = cos($top_tilt) * x;

  q = atan2(s, (y + b - r));

  translate([0,0,cos(q) * total_key_height()/2])
  rotate([90 + q, 0,0]) children();
}

// emulating the % modifier.
// since we use custom colors, just using the % modifier doesn't work
module debug() {
  $primary_color = [0.5,0.5,0.5,0.2];
  $secondary_color = [0.5,0.5,0.5,0.2];
  $tertiary_color = [0.5,0.5,0.5,0.2];
  $quaternary_color = [0.5,0.5,0.5,0.2];

  %children();
}

// auto-place children in a grid.
// For this to work all children have to be single keys, no for loops etc
module auto_place() {
  num_children = $children;
  row_size = round(pow(num_children, 0.5));

  for (child_index = [0:num_children-1]) {
    x = child_index % row_size;
    y = floor(child_index / row_size);
    translate_u(x,-y) children(child_index);
  }
}

// suggested settings for resin prints
module resin() {
  $stem_slop = 0;
  $stem_inner_slop = 0;
  $stem_support_type = "disable";
  children();
}module arrows(profile, rows = [4,4,4,3]) {
  positions = [[0, 0], [1, 0], [2, 0], [1, 1]];
  legends = ["←", "↓", "→", "↑"];

  for (i = [0:3]) {
    translate_u(positions[i].x, positions[i].y) key_profile(profile, rows[i]) legend(legends[i]) cherry() key(true);
  }
}

module f_cluster(profile, row=5) {
  legends = ["F1", "F2", "F3", "F4"];
  for (i =[0:len(legends)-1]) {
    translate_u(i) key_profile(profile, row) cherry() legend(legends[i]) key(true);
  }
}

module wasd(profile, rows = [2,2,2,1]) {
  positions = [[0, 0], [1, 0], [2, 0], [1, 1]];
  legends = ["A", "S", "D", "W"];

  for (i = [0:3]) {
    translate_u(positions[i].x, positions[i].y) key_profile(profile, rows[i]) legend(legends[i]) cherry() key(true);
  }
}

module row_profile(profile, unsculpted = false) {
  rows = [5, 1, 2, 3, 4];
  for(row = [0:len(rows)-1]) {
    translate_u(0, -row) key_profile(profile, unsculpted ? 3 : rows[row]) children();
  }
}
// files
// a safe theoretical distance between two vertices such that they don't collapse. hard to use
SMALLEST_POSSIBLE = 1/128;
$fs=0.1;
$unit=19.05;
// a safe theoretical distance between two vertices such that they don't collapse. hard to use
SMALLEST_POSSIBLE = 1/128;
$fs=0.1;
$unit=19.05;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

function stem_height() = $total_depth - $dish_depth - $stem_inset;

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// cherry stabilizer stem dimensions
function outer_cherry_stabilizer_stem(slop) = [4.85 - slop * 2, 6.05 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.25 + slop / 3],
  // vertical tine
  [1.15 + slop / 3, 4.23 + extra_vertical + slop / 3 + SMALLEST_POSSIBLE],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

function side_tilt(column) = asin($unit * column / $double_sculpt_radius);
// tan of 0 is 0, division by 0 is nan, so we have to guard
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - ($unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// adds uniform rounding radius for round-anything polyRound
function add_rounding(p, radius)=[for(i=[0:len(p)-1])[p[i].x,p[i].y, radius]];
// computes millimeter length from unit length
function unit_length(length) = $unit * (length - 1) + 18.16;
// a safe theoretical distance between two vertices such that they don't collapse. hard to use
SMALLEST_POSSIBLE = 1/128;
$fs=0.1;
$unit=19.05;
// a safe theoretical distance between two vertices such that they don't collapse. hard to use
SMALLEST_POSSIBLE = 1/128;
$fs=0.1;
$unit=19.05;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

function stem_height() = $total_depth - $dish_depth - $stem_inset;

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// cherry stabilizer stem dimensions
function outer_cherry_stabilizer_stem(slop) = [4.85 - slop * 2, 6.05 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.25 + slop / 3],
  // vertical tine
  [1.15 + slop / 3, 4.23 + extra_vertical + slop / 3 + SMALLEST_POSSIBLE],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

function side_tilt(column) = asin($unit * column / $double_sculpt_radius);
// tan of 0 is 0, division by 0 is nan, so we have to guard
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - ($unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// adds uniform rounding radius for round-anything polyRound
function add_rounding(p, radius)=[for(i=[0:len(p)-1])[p[i].x,p[i].y, radius]];
// computes millimeter length from unit length
function unit_length(length) = $unit * (length - 1) + 18.16;
// Library: round-anything
// Version: 1.0
// Author: IrevDev
// Contributors: TLC123
// Copyright: 2020
// License: MIT


function addZcoord(points,displacement)=[for(i=[0:len(points)-1])[points[i].x,points[i].y, displacement]];
function translate3Dcoords(points,tran=[0,0,0],mult=[1,1,1])=[for(i=[0:len(points)-1])[
  (points[i].x*mult.x)+tran.x,
  (points[i].y*mult.y)+tran.y,
  (points[i].z*mult.z)+tran.z
]];
function offsetPolygonPoints(points, offset=0)=
// Work sthe same as the offset does, except for the fact that instead of a 2d shape
// It works directly on polygon points
// It returns the same number of points just offset into or, away from the original shape.
// points= a series of x,y points[[x1,y1],[x2,y2],...]
// offset= amount to offset by, negative numbers go inwards into the shape, positive numbers go out
// return= a series of x,y points[[x1,y1],[x2,y2],...]
let(
  isCWorCCW=sign(offset)*CWorCCW(points)*-1,
  lp=len(points)
)
[for(i=[0:lp-1]) parallelFollow([
  points[listWrap(i-1,lp)],
  points[i],
  points[listWrap(i+1,lp)],
],thick=offset,mode=isCWorCCW)];

function makeCurvedPartOfPolyHedron(radiiPoints,r,fn,minR=0.01)=
// this is a private function that I'm not expecting library users to use directly
// radiiPoints= serise of x, y, r points
// r= radius of curve that will be put on the end of the extrusion
// fn= amount of subdivisions
// minR= if one of the points in radiiPoints is less than r, it's likely to converge and form a sharp edge,
//     the min radius on these converged edges can be controled with minR, though because of legacy reasons it can't be 0, but can be a very small number.
// return= array of [polyhedronPoints, Polyhedronfaces, theLength of a singe layer in the curve]
let(
  lp=len(radiiPoints),
  radii=[for(i=[0:lp-1])radiiPoints[i].z],
  isCWorCCWOverall=CWorCCW(radiiPoints),
  dir=sign(r),
  absR=abs(r),
  fractionOffLp=1-1/fn,
  allPoints=[for(fraction=[0:1/fn:1])
    let(
      iterationOffset=dir*sqrt(sq(absR)-sq(fraction*absR))-dir*absR,
      theOffsetPoints=offsetPolygonPoints(radiiPoints,iterationOffset),
      polyRoundOffsetPoints=[for(i=[0:lp-1])
        let(
          pointsAboutCurrent=[
            theOffsetPoints[listWrap(i-1,lp)],
            theOffsetPoints[i],
            theOffsetPoints[listWrap(i+1,lp)]
          ],
          isCWorCCWLocal=CWorCCW(pointsAboutCurrent),
          isInternalRadius=(isCWorCCWLocal*isCWorCCWOverall)==-1,
          // the radius names are only true for positive r,
          // when are r is negative increasingRadius is actually decreasing and vice-vs
          // increasingRadiusWithPositiveR is just to verbose of a variable name for my liking
          increasingRadius=max(radii[i]-iterationOffset, minR),
          decreasingRadius=max(radii[i]+iterationOffset, minR)
        )
        [theOffsetPoints[i].x, theOffsetPoints[i].y, isInternalRadius? increasingRadius: decreasingRadius]
      ],
      pointsForThisLayer=polyRound(polyRoundOffsetPoints,fn)
    )
    addZcoord(pointsForThisLayer,fraction*absR)
  ],
  polyhedronPoints=flatternArray(allPoints),
  allLp=len(allPoints),
  layerLength=len(allPoints[0]),
  loopToSecondLastLayer=allLp-2,
  sideFaces=[for(layerIndex=[0:loopToSecondLastLayer])let(
    currentLayeroffset=layerIndex*layerLength,
    nextLayeroffset=(layerIndex+1)*layerLength,
    layerFaces=[for(subLayerIndex=[0:layerLength-1])
      [
        currentLayeroffset+subLayerIndex, currentLayeroffset + listWrap(subLayerIndex+1,layerLength), nextLayeroffset+listWrap(subLayerIndex+1,layerLength), nextLayeroffset+subLayerIndex]
    ]
  )layerFaces],
  polyhedronFaces=flatternArray(sideFaces)
)
[polyhedronPoints, polyhedronFaces, layerLength];

function flatternRecursion(array, init=[], currentIndex)=
// this is a private function, init and currentIndex are for the function's use 
// only for when it's calling itself, which is why there is a simplified version flatternArray that just calls this one
// array= array to flattern by one level of nesting
// init= the array used to cancat with the next call, only for when the function calls itself
// currentIndex= so the function can keep track of how far it's progressed through the array, only for when it's calling itself
// returns= flatterned array, by one level of nesting
let(
  shouldKickOffRecursion=currentIndex==undef?1:0,
  isLastIndex=currentIndex+1==len(array)?1:0,
  flatArray=shouldKickOffRecursion?flatternRecursion(array,[],0):
    isLastIndex?concat(init,array[currentIndex]):
    flatternRecursion(array,concat(init,array[currentIndex]),currentIndex+1)
)
flatArray;

function flatternArray(array)=
// public version of flatternRecursion, has simplified params to avoid confusion
// array= array to be flatterned
// return= array that been flatterend by one level of nesting
flatternRecursion(array);

function offsetAllFacesBy(array,offset)=[
  // polyhedron faces are simply a list of indices to points, if your concat points together than you probably need to offset
  // your faces array to points to the right place in the new list
  // array= array of point indicies
  // offset= number to offset all indecies by
  // return= array of point indices (i.e. faces) with offset applied
  for(faceIndex=[0:len(array)-1])[
    for(pointIndex=[0:len(array[faceIndex])-1])array[faceIndex][pointIndex]+offset
  ]
];

function extrudePolygonWithRadius(radiiPoints,h=5,r1=1,r2=1,fn=4)=
// this basically calls makeCurvedPartOfPolyHedron twice to get the curved section of the final polyhedron
// and then goes about assmbling them, as the side faces and the top and bottom face caps are missing
// radiiPoints= series of [x,y,r] points,
// h= height of the extrude (total including radius sections)
// r1,r2= define the radius at the top and bottom of the extrud respectively, negative number flange out the extrude
// fn= number of subdivisions
// returns= [polyhedronPoints, polyhedronFaces]
let(
  // top is the top curved part of the extrude
  top=makeCurvedPartOfPolyHedron(radiiPoints,r1,fn),
  topRadiusPoints=translate3Dcoords(top[0],[0,0,h-r1]),
  singeLayerLength=top[2],
  topRadiusFaces=top[1],
  radiusPointsLength=len(topRadiusPoints), // is the same length as bottomRadiusPoints
  // bottom is the bottom curved part of the extrude
  bottom=makeCurvedPartOfPolyHedron(radiiPoints,r2,fn),
  // Z axis needs to be multiplied by -1 to flip it so the radius is going in the right direction [1,1,-1]
  bottomRadiusPoints=translate3Dcoords(bottom[0],[0,0,abs(r2)],[1,1,-1]),
  // becaues the points will be all concatenated into the same array, and the bottom points come second, than
  // the original indices the faces are points towards are wrong and need to have an offset applied to them
  bottomRadiusFaces=offsetAllFacesBy(bottom[1],radiusPointsLength),
  // all of the side panel of the extrusion, connecting points from the inner layers of each
  // of the curved sections
  sideFaces=[for(i=[0:singeLayerLength-1])[
    i,
    listWrap(i+1,singeLayerLength),
    radiusPointsLength + listWrap(i+1,singeLayerLength),
    radiusPointsLength + i
  ]],
  // both of these caps are simple every point from the last layer of the radius points
  topCapFace=[for(i=[0:singeLayerLength-1])radiusPointsLength-singeLayerLength+i],
  bottomCapFace=[for(i=[0:singeLayerLength-1])radiusPointsLength*2-singeLayerLength+i],
  finalPolyhedronPoints=concat(topRadiusPoints,bottomRadiusPoints),
  finalPolyhedronFaces=concat(topRadiusFaces,bottomRadiusFaces, sideFaces, [topCapFace], [bottomCapFace])
)
[
  finalPolyhedronPoints,
  finalPolyhedronFaces
];

module polyRoundExtrude(radiiPoints,length=5,r1=1,r2=1,fn=10,convexity=10) {
  polyhedronPointsNFaces=extrudePolygonWithRadius(radiiPoints,length,r1,r2,fn);
  polyhedron(points=polyhedronPointsNFaces[0], faces=polyhedronPointsNFaces[1], convexity=convexity);
}


// testingInternals();
module testingInternals(){
  //example of rounding random points, this has no current use but is a good demonstration
  random=[for(i=[0:20])[rnd(0,50),rnd(0,50),/*rnd(0,30)*/1000]];
  R =polyRound(random,7);
  translate([-25,25,0]){
    polyline(R);
  }
  
  //example of different modes of the CentreN2PointsArc() function 0=shortest arc, 1=longest arc, 2=CW, 3=CCW
  p1=[0,5];p2=[10,5];centre=[5,0];
  translate([60,0,0]){
    color("green"){
      polygon(CentreN2PointsArc(p1,p2,centre,0,20));//draws the shortest arc
    }
    color("cyan"){
      polygon(CentreN2PointsArc(p1,p2,centre,1,20));//draws the longest arc
    }
  }
  translate([75,0,0]){
    color("purple"){
      polygon(CentreN2PointsArc(p1,p2,centre,2,20));//draws the arc CW (which happens to be the short arc)
    }
    color("red"){
      polygon(CentreN2PointsArc(p2,p1,centre,2,20));//draws the arc CW but p1 and p2 swapped order resulting in the long arc being drawn
    }
  }
  
  radius=6;
  radiipoints=[[0,0,0],[10,20,radius],[20,0,0]];
  tangentsNcen=round3points(radiipoints);
  translate([10,0,0]){
    for(i=[0:2]){
      color("red")translate(getpoints(radiipoints)[i])circle(1);//plots the 3 input points
      color("cyan")translate(tangentsNcen[i])circle(1);//plots the two tangent poins and the circle centre
    }
    translate([tangentsNcen[2][0],tangentsNcen[2][1],-0.2])circle(r=radius,$fn=25);//draws the cirle
    %polygon(getpoints(radiipoints));//draws a polygon
  }
}

function polyRound(radiipoints,fn=5,mode=0)=
  /*Takes a list of radii points of the format [x,y,radius] and rounds each point
    with fn resolution
    mode=0 - automatic radius limiting - DEFAULT
    mode=1 - Debug, output radius reduction for automatic radius limiting
    mode=2 - No radius limiting*/
  let(
    p=getpoints(radiipoints), //make list of coordinates without radii
    Lp=len(p),
    //remove the middle point of any three colinear points, otherwise adding a radius to the middle of a straigh line causes problems
    radiiPointsWithoutTrippleColinear=[
      for(i=[0:len(p)-1]) if(
        // keep point if it isn't colinear or if the radius is 0
        !isColinear(
          p[listWrap(i-1,Lp)],
          p[listWrap(i+0,Lp)],
          p[listWrap(i+1,Lp)]
        )||
        p[listWrap(i+0,Lp)].z!=0
      ) radiipoints[listWrap(i+0,Lp)] 
    ],
    newrp2=processRadiiPoints(radiiPointsWithoutTrippleColinear),
    plusMinusPointRange=mode==2?1:2,
    temp=[
      for(i=[0:len(newrp2)-1]) //for each point in the radii array
      let(
        thepoints=[for(j=[-plusMinusPointRange:plusMinusPointRange])newrp2[listWrap(i+j,len(newrp2))]],//collect 5 radii points
        temp2=mode==2?round3points(thepoints,fn):round5points(thepoints,fn,mode)
      )
      mode==1?temp2:newrp2[i][2]==0?
        [[newrp2[i][0],newrp2[i][1]]]: //return the original point if the radius is 0
        CentreN2PointsArc(temp2[0],temp2[1],temp2[2],0,fn) //return the arc if everything is normal
    ]
  )
  [for (a = temp) for (b = a) b];//flattern and return the array

function round5points(rp,fn,debug=0)=
	rp[2][2]==0&&debug==0?[[rp[2][0],rp[2][1]]]://return the middle point if the radius is 0
	rp[2][2]==0&&debug==1?0://if debug is enabled and the radius is 0 return 0
	let(
    p=getpoints(rp), //get list of points
    r=[for(i=[1:3]) abs(rp[i][2])],//get the centre 3 radii
    //start by determining what the radius should be at point 3
    //find angles at points 2 , 3 and 4
    a2=cosineRuleAngle(p[0],p[1],p[2]),
    a3=cosineRuleAngle(p[1],p[2],p[3]),
    a4=cosineRuleAngle(p[2],p[3],p[4]),
    //find the distance between points 2&3 and between points 3&4
    d23=pointDist(p[1],p[2]),
    d34=pointDist(p[2],p[3]),
    //find the radius factors
    F23=(d23*tan(a2/2)*tan(a3/2))/(r[0]*tan(a3/2)+r[1]*tan(a2/2)),
    F34=(d34*tan(a3/2)*tan(a4/2))/(r[1]*tan(a4/2)+r[2]*tan(a3/2)),
    newR=min(r[1],F23*r[1],F34*r[1]),//use the smallest radius
    //now that the radius has been determined, find tangent points and circle centre
    tangD=newR/tan(a3/2),//distance to the tangent point from p3
      circD=newR/sin(a3/2),//distance to the circle centre from p3
    //find the angle from the p3
    an23=getAngle(p[1],p[2]),//angle from point 3 to 2
    an34=getAngle(p[3],p[2]),//angle from point 3 to 4
    //find tangent points
    t23=[p[2][0]-cos(an23)*tangD,p[2][1]-sin(an23)*tangD],//tangent point between points 2&3
    t34=[p[2][0]-cos(an34)*tangD,p[2][1]-sin(an34)*tangD],//tangent point between points 3&4
    //find circle centre
    tmid=getMidpoint(t23,t34),//midpoint between the two tangent points
    anCen=getAngle(tmid,p[2]),//angle from point 3 to circle centre
    cen=[p[2][0]-cos(anCen)*circD,p[2][1]-sin(anCen)*circD]
  )
    //circle center by offseting from point 3
    //determine the direction of rotation
	debug==1?//if debug in disabled return arc (default)
    (newR-r[1]):
	[t23,t34,cen];

function round3points(rp,fn)=
  rp[1][2]==0?[[rp[1][0],rp[1][1]]]://return the middle point if the radius is 0
	let(
    p=getpoints(rp), //get list of points
	  r=rp[1][2],//get the centre 3 radii
    ang=cosineRuleAngle(p[0],p[1],p[2]),//angle between the lines
    //now that the radius has been determined, find tangent points and circle centre
	  tangD=r/tan(ang/2),//distance to the tangent point from p2
    circD=r/sin(ang/2),//distance to the circle centre from p2
    //find the angles from the p2 with respect to the postitive x axis
    angleFromPoint1ToPoint2=getAngle(p[0],p[1]),
    angleFromPoint2ToPoint3=getAngle(p[2],p[1]),
    //find tangent points
    t12=[p[1][0]-cos(angleFromPoint1ToPoint2)*tangD,p[1][1]-sin(angleFromPoint1ToPoint2)*tangD],//tangent point between points 1&2
    t23=[p[1][0]-cos(angleFromPoint2ToPoint3)*tangD,p[1][1]-sin(angleFromPoint2ToPoint3)*tangD],//tangent point between points 2&3
    //find circle centre
    tmid=getMidpoint(t12,t23),//midpoint between the two tangent points
    angCen=getAngle(tmid,p[1]),//angle from point 2 to circle centre
    cen=[p[1][0]-cos(angCen)*circD,p[1][1]-sin(angCen)*circD] //circle center by offseting from point 2 
  )
	[t12,t23,cen];

function parallelFollow(rp,thick=4,minR=1,mode=1)=
    //rp[1][2]==0?[rp[1][0],rp[1][1],0]://return the middle point if the radius is 0
    thick==0?[rp[1][0],rp[1][1],0]://return the middle point if the radius is 0
	let(
    p=getpoints(rp), //get list of points
	  r=thick,//get the centre 3 radii
    ang=cosineRuleAngle(p[0],p[1],p[2]),//angle between the lines
    //now that the radius has been determined, find tangent points and circle centre
    tangD=r/tan(ang/2),//distance to the tangent point from p2
  	sgn=CWorCCW(rp),//rotation of the three points cw or ccw?let(sgn=mode==0?1:-1)
    circD=mode*sgn*r/sin(ang/2),//distance to the circle centre from p2
    //find the angles from the p2 with respect to the postitive x axis
    angleFromPoint1ToPoint2=getAngle(p[0],p[1]),
    angleFromPoint2ToPoint3=getAngle(p[2],p[1]),
    //find tangent points
    t12=[p[1][0]-cos(angleFromPoint1ToPoint2)*tangD,p[1][1]-sin(angleFromPoint1ToPoint2)*tangD],//tangent point between points 1&2
	  t23=[p[1][0]-cos(angleFromPoint2ToPoint3)*tangD,p[1][1]-sin(angleFromPoint2ToPoint3)*tangD],//tangent point between points 2&3
    //find circle centre
    tmid=getMidpoint(t12,t23),//midpoint between the two tangent points
    angCen=getAngle(tmid,p[1]),//angle from point 2 to circle centre
    cen=[p[1][0]-cos(angCen)*circD,p[1][1]-sin(angCen)*circD],//circle center by offseting from point 2 
    outR=max(minR,rp[1][2]-thick*sgn*mode) //ensures radii are never too small.
  )
	concat(cen,outR);

function findPoint(ang1,refpoint1,ang2,refpoint2,r=0)=
  let(
    m1=tan(ang1),
    c1=refpoint1.y-m1*refpoint1.x,
	  m2=tan(ang2),
    c2=refpoint2.y-m2*refpoint2.x,
    outputX=(c2-c1)/(m1-m2),
    outputY=m1*outputX+c1
  )
	[outputX,outputY,r];

function beamChain(radiiPoints,offset1=0,offset2,mode=0,minR=0,startAngle,endAngle)= 
  /*This function takes a series of radii points and plots points to run along side at a consistant distance, think of it as offset but for line instead of a polygon
  radiiPoints=radii points,
  offset1 & offset2= The two offsets that give the beam it's thickness. When using with mode=2 only offset1 is needed as there is no return path for the polygon
  minR=min radius, if all of your radii are set properly within the radii points this value can be ignored
  startAngle & endAngle= Angle at each end of the beam, different mode determine if this angle is relative to the ending legs of the beam or absolute.
  mode=1 - include endpoints startAngle&2 are relative to the angle of the last two points and equal 90deg if not defined
  mode=2 - Only the forward path is defined, useful for combining the beam with other radii points, see examples for a use-case.
  mode=3 - include endpoints startAngle&2 are absolute from the x axis and are 0 if not defined
  negative radiuses only allowed for the first and last radii points
  
  As it stands this function could probably be tidied a lot, but it works, I'll tidy later*/
  let(
    offset2undef=offset2==undef?1:0,
    offset2=offset2undef==1?0:offset2,
    CWorCCW1=sign(offset1)*CWorCCW(radiiPoints),
    CWorCCW2=sign(offset2)*CWorCCW(radiiPoints),
    offset1=abs(offset1),
    offset2b=abs(offset2),
    Lrp3=len(radiiPoints)-3,
    Lrp=len(radiiPoints),
    startAngle=mode==0&&startAngle==undef?
      getAngle(radiiPoints[0],radiiPoints[1])+90:
      mode==2&&startAngle==undef?
      0:
      mode==0?
      getAngle(radiiPoints[0],radiiPoints[1])+startAngle:
      startAngle,
    endAngle=mode==0&&endAngle==undef?
            getAngle(radiiPoints[Lrp-1],radiiPoints[Lrp-2])+90:
        mode==2&&endAngle==undef?
            0:
        mode==0?
            getAngle(radiiPoints[Lrp-1],radiiPoints[Lrp-2])+endAngle:
            endAngle,
    OffLn1=[for(i=[0:Lrp3]) offset1==0?radiiPoints[i+1]:parallelFollow([radiiPoints[i],radiiPoints[i+1],radiiPoints[i+2]],offset1,minR,mode=CWorCCW1)],
    OffLn2=[for(i=[0:Lrp3]) offset2==0?radiiPoints[i+1]:parallelFollow([radiiPoints[i],radiiPoints[i+1],radiiPoints[i+2]],offset2b,minR,mode=CWorCCW2)],  
    Rp1=abs(radiiPoints[0].z),
    Rp2=abs(radiiPoints[Lrp-1].z),
    endP1a=findPoint(getAngle(radiiPoints[0],radiiPoints[1]),         OffLn1[0],              startAngle,radiiPoints[0],     Rp1),
    endP1b=findPoint(getAngle(radiiPoints[Lrp-1],radiiPoints[Lrp-2]), OffLn1[len(OffLn1)-1],  endAngle,radiiPoints[Lrp-1], Rp2),
    endP2a=findPoint(getAngle(radiiPoints[0],radiiPoints[1]),         OffLn2[0],              startAngle,radiiPoints[0],     Rp1),
    endP2b=findPoint(getAngle(radiiPoints[Lrp-1],radiiPoints[Lrp-2]), OffLn2[len(OffLn1)-1],  endAngle,radiiPoints[Lrp-1], Rp2),
    absEnda=getAngle(endP1a,endP2a),
    absEndb=getAngle(endP1b,endP2b),
    negRP1a=[cos(absEnda)*radiiPoints[0].z*10+endP1a.x,        sin(absEnda)*radiiPoints[0].z*10+endP1a.y,       0.0],
    negRP2a=[cos(absEnda)*-radiiPoints[0].z*10+endP2a.x,       sin(absEnda)*-radiiPoints[0].z*10+endP2a.y,      0.0],
    negRP1b=[cos(absEndb)*radiiPoints[Lrp-1].z*10+endP1b.x,    sin(absEndb)*radiiPoints[Lrp-1].z*10+endP1b.y,   0.0],
    negRP2b=[cos(absEndb)*-radiiPoints[Lrp-1].z*10+endP2b.x,   sin(absEndb)*-radiiPoints[Lrp-1].z*10+endP2b.y,  0.0],
    OffLn1b=(mode==0||mode==2)&&radiiPoints[0].z<0&&radiiPoints[Lrp-1].z<0?
        concat([negRP1a],[endP1a],OffLn1,[endP1b],[negRP1b])
      :(mode==0||mode==2)&&radiiPoints[0].z<0?
        concat([negRP1a],[endP1a],OffLn1,[endP1b])
      :(mode==0||mode==2)&&radiiPoints[Lrp-1].z<0?
        concat([endP1a],OffLn1,[endP1b],[negRP1b])
      :mode==0||mode==2?
        concat([endP1a],OffLn1,[endP1b])
      :
        OffLn1,
    OffLn2b=(mode==0||mode==2)&&radiiPoints[0].z<0&&radiiPoints[Lrp-1].z<0?
        concat([negRP2a],[endP2a],OffLn2,[endP2b],[negRP2b])
      :(mode==0||mode==2)&&radiiPoints[0].z<0?
        concat([negRP2a],[endP2a],OffLn2,[endP2b])
      :(mode==0||mode==2)&&radiiPoints[Lrp-1].z<0?
        concat([endP2a],OffLn2,[endP2b],[negRP2b])
      :mode==0||mode==2?
        concat([endP2a],OffLn2,[endP2b])
      :
        OffLn2
    )//end of let()
  offset2undef==1?OffLn1b:concat(OffLn2b,revList(OffLn1b));
    
function revList(list)=//reverse list
  let(Llist=len(list)-1)
  [for(i=[0:Llist]) list[Llist-i]];

function CWorCCW(p)=
	let(
    Lp=len(p),
	  e=[for(i=[0:Lp-1]) 
      (p[listWrap(i+0,Lp)].x-p[listWrap(i+1,Lp)].x)*(p[listWrap(i+0,Lp)].y+p[listWrap(i+1,Lp)].y)
    ]
  )  
  sign(sum(e));

function CentreN2PointsArc(p1,p2,cen,mode=0,fn)=
  /* This function plots an arc from p1 to p2 with fn increments using the cen as the centre of the arc.
  the mode determines how the arc is plotted
  mode==0, shortest arc possible 
  mode==1, longest arc possible
  mode==2, plotted clockwise
  mode==3, plotted counter clockwise
  */
	let(
    isCWorCCW=CWorCCW([cen,p1,p2]),//determine the direction of rotation
    //determine the arc angle depending on the mode
    p1p2Angle=cosineRuleAngle(p2,cen,p1),
    arcAngle=
      mode==0?p1p2Angle:
      mode==1?p1p2Angle-360:
      mode==2&&isCWorCCW==-1?p1p2Angle:
      mode==2&&isCWorCCW== 1?p1p2Angle-360:
      mode==3&&isCWorCCW== 1?p1p2Angle:
      mode==3&&isCWorCCW==-1?p1p2Angle-360:
      cosineRuleAngle(p2,cen,p1),
    r=pointDist(p1,cen),//determine the radius
	  p1Angle=getAngle(cen,p1) //angle of line 1
  )
  [for(i=[0:fn])
  let(angleIncrement=(arcAngle/fn)*i*isCWorCCW)
  [cos(p1Angle+angleIncrement)*r+cen.x,sin(p1Angle+angleIncrement)*r+cen.y]];

function translateRadiiPoints(radiiPoints,tran=[0,0],rot=0)=
	[for(i=radiiPoints) 
		let(
      a=getAngle([0,0],[i.x,i.y]),//get the angle of the this point
		  h=pointDist([0,0],[i.x,i.y]) //get the hypotenuse/radius
    )
		[h*cos(a+rot)+tran.x,h*sin(a+rot)+tran.y,i.z]//calculate the point's new position
	];

module round2d(OR=3,IR=1){
  offset(OR,$fn=100){
    offset(-IR-OR,$fn=100){
      offset(IR,$fn=100){
        children();
      }
    }
  }
}

module shell2d(offset1,offset2=0,minOR=0,minIR=0){
	difference(){
		round2d(minOR,minIR){
      offset(max(offset1,offset2)){
        children(0);//original 1st child forms the outside of the shell
      }
    }
		round2d(minIR,minOR){
      difference(){//round the inside cutout
        offset(min(offset1,offset2)){
          children(0);//shrink the 1st child to form the inside of the shell 
        }
        if($children>1){
          for(i=[1:$children-1]){
            children(i);//second child and onwards is used to add material to inside of the shell
          }
        }
      }
		}
	}
}

module internalSq(size,r,center=0){
    tran=center==1?[0,0]:size/2;
    translate(tran){
      square(size,true);
      offs=sin(45)*r;
      for(i=[-1,1],j=[-1,1]){
        translate([(size.x/2-offs)*i,(size.y/2-offs)*j])circle(r);
      }
    }
}

module extrudeWithRadius(length,r1=0,r2=0,fn=30){
  n1=sign(r1);n2=sign(r2);
  r1=abs(r1);r2=abs(r2);
  translate([0,0,r1]){
    linear_extrude(length-r1-r2){
      children();
    }
  }
  for(i=[0:fn-1]){
    translate([0,0,i/fn*r1]){
      linear_extrude(r1/fn+0.01){
        offset(n1*sqrt(sq(r1)-sq(r1-i/fn*r1))-n1*r1){
          children();
        }
      }
    }
    translate([0,0,length-r2+i/fn*r2]){
      linear_extrude(r2/fn+0.01){
        offset(n2*sqrt(sq(r2)-sq(i/fn*r2))-n2*r2){
          children();
        }
      }
    }
  }
}

function mirrorPoints(radiiPoints,rot=0,endAttenuation=[0,0])= //mirrors a list of points about Y, ignoring the first and last points and returning them in reverse order for use with polygon or polyRound
  let(
    a=translateRadiiPoints(radiiPoints,[0,0],-rot),
    temp3=[for(i=[0+endAttenuation[0]:len(a)-1-endAttenuation[1]])
      [a[i][0],-a[i][1],a[i][2]]
    ],
    temp=translateRadiiPoints(temp3,[0,0],rot),
    temp2=revList(temp3)
  )    
  concat(radiiPoints,temp2);

function processRadiiPoints(rp)=
  [for(i=[0:len(rp)-1])
    processRadiiPoints2(rp,i)
  ];

function processRadiiPoints2(list,end=0,idx=0,result=0)=
  idx>=end+1?result:
  processRadiiPoints2(list,end,idx+1,relationalRadiiPoints(result,list[idx]));

function cosineRuleBside(a,c,C)=c*cos(C)-sqrt(sq(a)+sq(c)+sq(cos(C))-sq(c));

function absArelR(po,pn)=
  let(
    th2=atan(po[1]/po[0]),
    r2=sqrt(sq(po[0])+sq(po[1])),
    r3=cosineRuleBside(r2,pn[1],th2-pn[0])
  )
  [cos(pn[0])*r3,sin(pn[0])*r3,pn[2]];

function relationalRadiiPoints(po,pi)=
  let(
    p0=pi[0],
    p1=pi[1],
    p2=pi[2],
    pv0=pi[3][0],
    pv1=pi[3][1],
    pt0=pi[3][2],
    pt1=pi[3][3],
    pn=
      (pv0=="y"&&pv1=="x")||(pv0=="r"&&pv1=="a")||(pv0=="y"&&pv1=="a")||(pv0=="x"&&pv1=="a")||(pv0=="y"&&pv1=="r")||(pv0=="x"&&pv1=="r")?
        [p1,p0,p2,concat(pv1,pv0,pt1,pt0)]:
        [p0,p1,p2,concat(pv0,pv1,pt0,pt1)],
    n0=pn[0],
    n1=pn[1],
    n2=pn[2],
    nv0=pn[3][0],
    nv1=pn[3][1],
    nt0=pn[3][2],
    nt1=pn[3][3],
    temp=
      pn[0]=="l"?
        [po[0],pn[1],pn[2]]
      :pn[1]=="l"?
        [pn[0],po[1],pn[2]]
      :nv0==undef?
        [pn[0],pn[1],pn[2]]//abs x, abs y as default when undefined
      :nv0=="a"?
        nv1=="r"?
          nt0=="a"?
            nt1=="a"||nt1==undef?
              [cos(n0)*n1,sin(n0)*n1,n2]//abs angle, abs radius
            :absArelR(po,pn)//abs angle rel radius
          :nt1=="r"||nt1==undef?
            [po[0]+cos(pn[0])*pn[1],po[1]+sin(pn[0])*pn[1],pn[2]]//rel angle, rel radius 
          :[pn[0],pn[1],pn[2]]//rel angle, abs radius
        :nv1=="x"?
          nt0=="a"?
            nt1=="a"||nt1==undef?
              [pn[1],pn[1]*tan(pn[0]),pn[2]]//abs angle, abs x
            :[po[0]+pn[1],(po[0]+pn[1])*tan(pn[0]),pn[2]]//abs angle rel x
            :nt1=="r"||nt1==undef?
              [po[0]+pn[1],po[1]+pn[1]*tan(pn[0]),pn[2]]//rel angle, rel x 
            :[pn[1],po[1]+(pn[1]-po[0])*tan(pn[0]),pn[2]]//rel angle, abs x
          :nt0=="a"?
            nt1=="a"||nt1==undef?
              [pn[1]/tan(pn[0]),pn[1],pn[2]]//abs angle, abs y
            :[(po[1]+pn[1])/tan(pn[0]),po[1]+pn[1],pn[2]]//abs angle rel y
          :nt1=="r"||nt1==undef?
            [po[0]+(pn[1]-po[0])/tan(90-pn[0]),po[1]+pn[1],pn[2]]//rel angle, rel y 
          :[po[0]+(pn[1]-po[1])/tan(pn[0]),pn[1],pn[2]]//rel angle, abs y
      :nv0=="r"?
        nv1=="x"?
          nt0=="a"?
            nt1=="a"||nt1==undef?
              [pn[1],sign(pn[0])*sqrt(sq(pn[0])-sq(pn[1])),pn[2]]//abs radius, abs x
            :[po[0]+pn[1],sign(pn[0])*sqrt(sq(pn[0])-sq(po[0]+pn[1])),pn[2]]//abs radius rel x
          :nt1=="r"||nt1==undef?
            [po[0]+pn[1],po[1]+sign(pn[0])*sqrt(sq(pn[0])-sq(pn[1])),pn[2]]//rel radius, rel x 
          :[pn[1],po[1]+sign(pn[0])*sqrt(sq(pn[0])-sq(pn[1]-po[0])),pn[2]]//rel radius, abs x
        :nt0=="a"?
          nt1=="a"||nt1==undef?
            [sign(pn[0])*sqrt(sq(pn[0])-sq(pn[1])),pn[1],pn[2]]//abs radius, abs y
          :[sign(pn[0])*sqrt(sq(pn[0])-sq(po[1]+pn[1])),po[1]+pn[1],pn[2]]//abs radius rel y
        :nt1=="r"||nt1==undef?
          [po[0]+sign(pn[0])*sqrt(sq(pn[0])-sq(pn[1])),po[1]+pn[1],pn[2]]//rel radius, rel y 
        :[po[0]+sign(pn[0])*sqrt(sq(pn[0])-sq(pn[1]-po[1])),pn[1],pn[2]]//rel radius, abs y
      :nt0=="a"?
        nt1=="a"||nt1==undef?
          [pn[0],pn[1],pn[2]]//abs x, abs y
        :[pn[0],po[1]+pn[1],pn[2]]//abs x rel y
      :nt1=="r"||nt1==undef?
        [po[0]+pn[0],po[1]+pn[1],pn[2]]//rel x, rel y 
      :[po[0]+pn[0],pn[1],pn[2]]//rel x, abs y
  )
  temp;

function invtan(run,rise)=
  let(a=abs(atan(rise/run)))
  rise==0&&run>0?
    0:rise>0&&run>0?
    a:rise>0&&run==0?
    90:rise>0&&run<0?
    180-a:rise==0&&run<0?
    180:rise<0&&run<0?
    a+180:rise<0&&run==0?
    270:rise<0&&run>0?
    360-a:"error";

function cosineRuleAngle(p1,p2,p3)=
  let(
    p12=abs(pointDist(p1,p2)),
    p13=abs(pointDist(p1,p3)),
    p23=abs(pointDist(p2,p3))
  )
  acos((sq(p23)+sq(p12)-sq(p13))/(2*p23*p12));

function sum(list, idx = 0, result = 0) = 
	idx >= len(list) ? result : sum(list, idx + 1, result + list[idx]);

function sq(x)=x*x;
function getGradient(p1,p2)=(p2.y-p1.y)/(p2.x-p1.x);
function getAngle(p1,p2)=p1==p2?0:invtan(p2[0]-p1[0],p2[1]-p1[1]);
function getMidpoint(p1,p2)=[(p1[0]+p2[0])/2,(p1[1]+p2[1])/2]; //returns the midpoint of two points
function pointDist(p1,p2)=sqrt(abs(sq(p1[0]-p2[0])+sq(p1[1]-p2[1]))); //returns the distance between two points
function isColinear(p1,p2,p3)=getGradient(p1,p2)==getGradient(p2,p3)?1:0;//return 1 if 3 points are colinear
module polyline(p, width=0.3) {
  for(i=[0:max(0,len(p)-1)]){
    color([i*1/len(p),1-i*1/len(p),0,0.5])line(p[i],p[listWrap(i+1,len(p) )],width);
  }
} // polyline plotter
module line(p1, p2 ,width=0.3) { // single line plotter
  hull() {
    translate(p1){
      circle(width);
    }
    translate(p2){
      circle(width);
    }
  }
}

function getpoints(p)=[for(i=[0:len(p)-1])[p[i].x,p[i].y]];// gets [x,y]list of[x,y,r]list
function listWrap(x,x_max=1,x_min=0) = (((x - x_min) % (x_max - x_min)) + (x_max - x_min)) % (x_max - x_min) + x_min; // wraps numbers inside boundaries
function rnd(a = 1, b = 0, s = []) = 
  s == [] ? 
    (rands(min(a, b), max(   a, b), 1)[0]):(rands(min(a, b), max(a, b), 1, s)[0]); // nice rands wrapper 

width_ratio = unit_length(1.25) / unit_length(1.5);
height_ratio = unit_length(1) / unit_length(2);



module ISO_enter_shape(size, delta, progress){
  width = size[0];
  height = size[1];


  // in order to make the ISO keycap shape generic, we are going to express the
  // 'elbow point' in terms of ratios. an ISO enter is just a 1.5u key stuck on
  // top of a 1.25u key, but since our key_shape function doesnt understand that
  // and wants to pass just width and height, we make these ratios to know where
  // to put the elbow joint

  delta = delta / 2;

  pointArray = [
      [                   0-delta.x,                     0-delta.y], // top right
      [                   0-delta.x,               -height+delta.y], // bottom right
      [-width * width_ratio+delta.x,               -height+delta.y], // bottom left
      [-width * width_ratio + delta.x,-height * height_ratio+delta.y], // inner middle point
      [              -width + delta.x,-height * height_ratio + delta.y], // outer middle point
      [              -width + delta.x,                     0-delta.y]  // top left
  ];

  minkowski(){
    circle(r=$corner_radius);
    // gives us rounded inner corner
    offset(r=-$corner_radius*2) {
      translate([(width * width_ratio)/2, height/2]) polygon(points=pointArray);
    }
  }
}

function iso_enter_vertices(size, delta, progress, thickness_difference) = [
  [                       0-delta.x/2 * progress - thickness_difference/8,                      0 - delta.y / 2 * progress - thickness_difference/8], // top right
  [                       0-delta.x/2 * progress - thickness_difference/8,               -size[1] + delta.y / 2 * progress + thickness_difference/8], // bottom right
  [-size[0] * width_ratio + delta.x/2 * progress + thickness_difference/8,               -size[1] + delta.y / 2 * progress + thickness_difference/8], // bottom left
  [-size[0] * width_ratio + delta.x/2 * progress + thickness_difference/8,-size[1] * height_ratio + delta.y / 2 * progress + thickness_difference/2], // inner middle point
  [              -size[0] + delta.x/2 * progress + thickness_difference/8,-size[1] * height_ratio + delta.y / 2 * progress + thickness_difference/2], // outer middle point
  [              -size[0] + delta.x/2 * progress + thickness_difference/8,                      0 - delta.y / 2 * progress - thickness_difference/8]  // top left
] + [
  [(size[0] * width_ratio)/2, size[1]/2 ],
  [(size[0] * width_ratio)/2, size[1]/2 ],
  [(size[0] * width_ratio)/2, size[1]/2 ],
  [(size[0] * width_ratio)/2, size[1]/2 ],
  [(size[0] * width_ratio)/2, size[1]/2 ],
  [(size[0] * width_ratio)/2, size[1]/2 ]
];

// no rounding on the corners at all
function skin_iso_enter_shape(size, delta, progress, thickness_difference) =
  polyRound(
    add_rounding(
      iso_enter_vertices(
        size,
        delta,
        progress,
        thickness_difference
      ),
      $corner_radius
    ),
    $shape_facets
  );
// rounded square shape with additional sculpting functions to better approximate

// side sculpting functions
// bows the sides out on stuff like SA and DSA keycaps
function side_sculpting(progress) = (1 - progress) * $side_sculpting_factor;
// makes the rounded corners of the keycap grow larger as they move upwards
function corner_sculpting(progress) = pow(progress, 2) * $corner_sculpting_factor;

module sculpted_square_shape(size, delta, progress) {
  width = size[0];
  height = size[1];

  width_difference = delta[0];
  height_difference = delta[1];
  // makes the sides bow
  extra_side_size =  side_sculpting(progress);
  // makes the rounded corners of the keycap grow larger as they move upwards
  extra_corner_size = corner_sculpting(progress);

  // computed values for this slice
  extra_width_this_slice = (width_difference - extra_side_size) * progress;
  extra_height_this_slice = (height_difference - extra_side_size) * progress;
  extra_corner_radius_this_slice = ($corner_radius + extra_corner_size);

  square_size = [
    width - extra_width_this_slice,
    height - extra_height_this_slice
  ];

  offset(r = extra_corner_radius_this_slice, $fa=360/$shape_facets) {
    offset(r = -extra_corner_radius_this_slice) {
      side_rounded_square(square_size, r = $more_side_sculpting_factor * progress);
    }
  }
}

function new_side_rounded_square(size, r, cornerRadius=0) =
  let(
    width = (size.x - r)/2,
    height = (size.y - r)/2,

    // fudge numbers! the radius conflict resolution in polyround smooths out
    // the entire shape based on the ratios between conflicting radii. bumping
    // these up makes the whole shape more fluid
    widthRadius = r ? width*8 : 0,
    heightRadius = r ? height*8 : 0,

    bow = r/2,

    // close enough :/
    facets = 360 / $shape_facets/2,

    points = [
       [-width,-height,cornerRadius],
       [0,-height-bow,widthRadius],
       [width,-height,cornerRadius],
       [width + bow,0,heightRadius],
       [width,height,cornerRadius],
       [0,height + bow,widthRadius],
       [-width,height,cornerRadius],
       [-width-bow,0,heightRadius]
    ]
  ) polyRound(points,facets);


function skin_sculpted_square_shape(size, delta, progress, thickness_difference) =
  let(
    width = size[0],
    height = size[1],

    width_difference = delta[0],
    height_difference = delta[1],
    // makes the sides bow
    extra_side_size =  side_sculpting(progress),
    // makes the rounded corners of the keycap grow larger as they move upwards
    extra_corner_size = corner_sculpting(progress),

    // computed values for this slice
    extra_width_this_slice = (width_difference - extra_side_size) * progress,
    extra_height_this_slice = (height_difference - extra_side_size) * progress,
    extra_corner_radius_this_slice = ($corner_radius + extra_corner_size),

    square_size = [
      width - extra_width_this_slice - thickness_difference,
      height - extra_height_this_slice - thickness_difference
    ]
  ) new_side_rounded_square(square_size, $more_side_sculpting_factor * progress, extra_corner_radius_this_slice);


module side_rounded_square(size, r) {
    iw = size.x - 2 * r;
    ih = size.y - 2 * r;
    resolution = 100;
    sr = r / resolution * 2;
    sh = ih / resolution;
    sw = iw / resolution;
    union() {
      if (sr > 0) {
        translate([-iw/2, 0]) scale([sr, sh]) circle(d = resolution, $fa=360/$shape_facets);
        translate([iw/2, 0]) scale([sr, sh]) circle(d = resolution, $fa=360/$shape_facets);
        translate([0, -ih/2]) scale([sw, sr]) circle(d = resolution, $fa=360/$shape_facets);
        translate([0, ih/2]) scale([sw, sr]) circle(d = resolution, $fa=360/$shape_facets);
      }
        square([iw, ih], center=true);
    }
}
// a safe theoretical distance between two vertices such that they don't collapse. hard to use
SMALLEST_POSSIBLE = 1/128;
$fs=0.1;
$unit=19.05;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

function stem_height() = $total_depth - $dish_depth - $stem_inset;

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// cherry stabilizer stem dimensions
function outer_cherry_stabilizer_stem(slop) = [4.85 - slop * 2, 6.05 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.25 + slop / 3],
  // vertical tine
  [1.15 + slop / 3, 4.23 + extra_vertical + slop / 3 + SMALLEST_POSSIBLE],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

function side_tilt(column) = asin($unit * column / $double_sculpt_radius);
// tan of 0 is 0, division by 0 is nan, so we have to guard
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - ($unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// adds uniform rounding radius for round-anything polyRound
function add_rounding(p, radius)=[for(i=[0:len(p)-1])[p[i].x,p[i].y, radius]];
// computes millimeter length from unit length
function unit_length(length) = $unit * (length - 1) + 18.16;

// we do this weird key_shape_type check here because rounded_square uses
// square_shape, and we want flat sides to work for that too.
// could be refactored, idk
module square_shape(size, delta, progress){
  if ($key_shape_type == "flat_sided_square") {
    flat_sided_square_shape(size, delta,progress);
  } else {
    square(size - delta * progress, center = true);
  }
}
/*
[-size.x /2,-size.y / 2],
[size.x / 2,-size.y / 2],
[size.x / 2, size.y / 2],
[-size.x / 2, size.y / 2] */

// for side-printed keycaps. Any amount of top tilt (on a keycap with a smaller
// top than bottom) makes the left and right side of the keycap convex. This
// shape makes the sides flat by making the top a trapezoid.
// This obviously doesn't work with rounded sides at all
module flat_sided_square_shape(size, delta, progress) {
  polygon(skin_flat_sided_square_shape(size, delta, progress));
}

function skin_flat_sided_square_shape(size,delta,progress) = [
  [(-size.x + (delta.x + extra_keytop_length_for_flat_sides()) * progress)/2, (-size.y + delta.y * progress)/2],
  [(size.x - (delta.x + extra_keytop_length_for_flat_sides()) * progress)/2,(-size.y + delta.y * progress)/2],
  [(size.x - (delta.x - extra_keytop_length_for_flat_sides()) * progress)/2, (size.y - delta.y * progress)/2],
  [(-size.x + (delta.x - extra_keytop_length_for_flat_sides()) * progress)/2, (size.y - delta.y * progress)/2]
];

function rectangle_profile(size) = [
  [-size.x/2, -size.y/2],
  [size.x/2, -size.y/2],
  [size.x/2, size.y/2],
  [-size.x/2, size.y/2],
];

function skin_square_shape(size, delta, progress, thickness_difference) =
  let(
    width = size[0],
    height = size[1],

    width_difference = delta[0] * progress,
    height_difference = delta[1] * progress,

    square_size = [
      width - width_difference - thickness_difference,
      height - height_difference - thickness_difference
    ]
  ) $key_shape_type == "flat_sided_square" ? skin_flat_sided_square_shape(size, delta, progress) : rectangle_profile(square_size);
// Library: round-anything
// Version: 1.0
// Author: IrevDev
// Contributors: TLC123
// Copyright: 2020
// License: MIT


function addZcoord(points,displacement)=[for(i=[0:len(points)-1])[points[i].x,points[i].y, displacement]];
function translate3Dcoords(points,tran=[0,0,0],mult=[1,1,1])=[for(i=[0:len(points)-1])[
  (points[i].x*mult.x)+tran.x,
  (points[i].y*mult.y)+tran.y,
  (points[i].z*mult.z)+tran.z
]];
function offsetPolygonPoints(points, offset=0)=
// Work sthe same as the offset does, except for the fact that instead of a 2d shape
// It works directly on polygon points
// It returns the same number of points just offset into or, away from the original shape.
// points= a series of x,y points[[x1,y1],[x2,y2],...]
// offset= amount to offset by, negative numbers go inwards into the shape, positive numbers go out
// return= a series of x,y points[[x1,y1],[x2,y2],...]
let(
  isCWorCCW=sign(offset)*CWorCCW(points)*-1,
  lp=len(points)
)
[for(i=[0:lp-1]) parallelFollow([
  points[listWrap(i-1,lp)],
  points[i],
  points[listWrap(i+1,lp)],
],thick=offset,mode=isCWorCCW)];

function makeCurvedPartOfPolyHedron(radiiPoints,r,fn,minR=0.01)=
// this is a private function that I'm not expecting library users to use directly
// radiiPoints= serise of x, y, r points
// r= radius of curve that will be put on the end of the extrusion
// fn= amount of subdivisions
// minR= if one of the points in radiiPoints is less than r, it's likely to converge and form a sharp edge,
//     the min radius on these converged edges can be controled with minR, though because of legacy reasons it can't be 0, but can be a very small number.
// return= array of [polyhedronPoints, Polyhedronfaces, theLength of a singe layer in the curve]
let(
  lp=len(radiiPoints),
  radii=[for(i=[0:lp-1])radiiPoints[i].z],
  isCWorCCWOverall=CWorCCW(radiiPoints),
  dir=sign(r),
  absR=abs(r),
  fractionOffLp=1-1/fn,
  allPoints=[for(fraction=[0:1/fn:1])
    let(
      iterationOffset=dir*sqrt(sq(absR)-sq(fraction*absR))-dir*absR,
      theOffsetPoints=offsetPolygonPoints(radiiPoints,iterationOffset),
      polyRoundOffsetPoints=[for(i=[0:lp-1])
        let(
          pointsAboutCurrent=[
            theOffsetPoints[listWrap(i-1,lp)],
            theOffsetPoints[i],
            theOffsetPoints[listWrap(i+1,lp)]
          ],
          isCWorCCWLocal=CWorCCW(pointsAboutCurrent),
          isInternalRadius=(isCWorCCWLocal*isCWorCCWOverall)==-1,
          // the radius names are only true for positive r,
          // when are r is negative increasingRadius is actually decreasing and vice-vs
          // increasingRadiusWithPositiveR is just to verbose of a variable name for my liking
          increasingRadius=max(radii[i]-iterationOffset, minR),
          decreasingRadius=max(radii[i]+iterationOffset, minR)
        )
        [theOffsetPoints[i].x, theOffsetPoints[i].y, isInternalRadius? increasingRadius: decreasingRadius]
      ],
      pointsForThisLayer=polyRound(polyRoundOffsetPoints,fn)
    )
    addZcoord(pointsForThisLayer,fraction*absR)
  ],
  polyhedronPoints=flatternArray(allPoints),
  allLp=len(allPoints),
  layerLength=len(allPoints[0]),
  loopToSecondLastLayer=allLp-2,
  sideFaces=[for(layerIndex=[0:loopToSecondLastLayer])let(
    currentLayeroffset=layerIndex*layerLength,
    nextLayeroffset=(layerIndex+1)*layerLength,
    layerFaces=[for(subLayerIndex=[0:layerLength-1])
      [
        currentLayeroffset+subLayerIndex, currentLayeroffset + listWrap(subLayerIndex+1,layerLength), nextLayeroffset+listWrap(subLayerIndex+1,layerLength), nextLayeroffset+subLayerIndex]
    ]
  )layerFaces],
  polyhedronFaces=flatternArray(sideFaces)
)
[polyhedronPoints, polyhedronFaces, layerLength];

function flatternRecursion(array, init=[], currentIndex)=
// this is a private function, init and currentIndex are for the function's use 
// only for when it's calling itself, which is why there is a simplified version flatternArray that just calls this one
// array= array to flattern by one level of nesting
// init= the array used to cancat with the next call, only for when the function calls itself
// currentIndex= so the function can keep track of how far it's progressed through the array, only for when it's calling itself
// returns= flatterned array, by one level of nesting
let(
  shouldKickOffRecursion=currentIndex==undef?1:0,
  isLastIndex=currentIndex+1==len(array)?1:0,
  flatArray=shouldKickOffRecursion?flatternRecursion(array,[],0):
    isLastIndex?concat(init,array[currentIndex]):
    flatternRecursion(array,concat(init,array[currentIndex]),currentIndex+1)
)
flatArray;

function flatternArray(array)=
// public version of flatternRecursion, has simplified params to avoid confusion
// array= array to be flatterned
// return= array that been flatterend by one level of nesting
flatternRecursion(array);

function offsetAllFacesBy(array,offset)=[
  // polyhedron faces are simply a list of indices to points, if your concat points together than you probably need to offset
  // your faces array to points to the right place in the new list
  // array= array of point indicies
  // offset= number to offset all indecies by
  // return= array of point indices (i.e. faces) with offset applied
  for(faceIndex=[0:len(array)-1])[
    for(pointIndex=[0:len(array[faceIndex])-1])array[faceIndex][pointIndex]+offset
  ]
];

function extrudePolygonWithRadius(radiiPoints,h=5,r1=1,r2=1,fn=4)=
// this basically calls makeCurvedPartOfPolyHedron twice to get the curved section of the final polyhedron
// and then goes about assmbling them, as the side faces and the top and bottom face caps are missing
// radiiPoints= series of [x,y,r] points,
// h= height of the extrude (total including radius sections)
// r1,r2= define the radius at the top and bottom of the extrud respectively, negative number flange out the extrude
// fn= number of subdivisions
// returns= [polyhedronPoints, polyhedronFaces]
let(
  // top is the top curved part of the extrude
  top=makeCurvedPartOfPolyHedron(radiiPoints,r1,fn),
  topRadiusPoints=translate3Dcoords(top[0],[0,0,h-r1]),
  singeLayerLength=top[2],
  topRadiusFaces=top[1],
  radiusPointsLength=len(topRadiusPoints), // is the same length as bottomRadiusPoints
  // bottom is the bottom curved part of the extrude
  bottom=makeCurvedPartOfPolyHedron(radiiPoints,r2,fn),
  // Z axis needs to be multiplied by -1 to flip it so the radius is going in the right direction [1,1,-1]
  bottomRadiusPoints=translate3Dcoords(bottom[0],[0,0,abs(r2)],[1,1,-1]),
  // becaues the points will be all concatenated into the same array, and the bottom points come second, than
  // the original indices the faces are points towards are wrong and need to have an offset applied to them
  bottomRadiusFaces=offsetAllFacesBy(bottom[1],radiusPointsLength),
  // all of the side panel of the extrusion, connecting points from the inner layers of each
  // of the curved sections
  sideFaces=[for(i=[0:singeLayerLength-1])[
    i,
    listWrap(i+1,singeLayerLength),
    radiusPointsLength + listWrap(i+1,singeLayerLength),
    radiusPointsLength + i
  ]],
  // both of these caps are simple every point from the last layer of the radius points
  topCapFace=[for(i=[0:singeLayerLength-1])radiusPointsLength-singeLayerLength+i],
  bottomCapFace=[for(i=[0:singeLayerLength-1])radiusPointsLength*2-singeLayerLength+i],
  finalPolyhedronPoints=concat(topRadiusPoints,bottomRadiusPoints),
  finalPolyhedronFaces=concat(topRadiusFaces,bottomRadiusFaces, sideFaces, [topCapFace], [bottomCapFace])
)
[
  finalPolyhedronPoints,
  finalPolyhedronFaces
];

module polyRoundExtrude(radiiPoints,length=5,r1=1,r2=1,fn=10,convexity=10) {
  polyhedronPointsNFaces=extrudePolygonWithRadius(radiiPoints,length,r1,r2,fn);
  polyhedron(points=polyhedronPointsNFaces[0], faces=polyhedronPointsNFaces[1], convexity=convexity);
}


// testingInternals();
module testingInternals(){
  //example of rounding random points, this has no current use but is a good demonstration
  random=[for(i=[0:20])[rnd(0,50),rnd(0,50),/*rnd(0,30)*/1000]];
  R =polyRound(random,7);
  translate([-25,25,0]){
    polyline(R);
  }
  
  //example of different modes of the CentreN2PointsArc() function 0=shortest arc, 1=longest arc, 2=CW, 3=CCW
  p1=[0,5];p2=[10,5];centre=[5,0];
  translate([60,0,0]){
    color("green"){
      polygon(CentreN2PointsArc(p1,p2,centre,0,20));//draws the shortest arc
    }
    color("cyan"){
      polygon(CentreN2PointsArc(p1,p2,centre,1,20));//draws the longest arc
    }
  }
  translate([75,0,0]){
    color("purple"){
      polygon(CentreN2PointsArc(p1,p2,centre,2,20));//draws the arc CW (which happens to be the short arc)
    }
    color("red"){
      polygon(CentreN2PointsArc(p2,p1,centre,2,20));//draws the arc CW but p1 and p2 swapped order resulting in the long arc being drawn
    }
  }
  
  radius=6;
  radiipoints=[[0,0,0],[10,20,radius],[20,0,0]];
  tangentsNcen=round3points(radiipoints);
  translate([10,0,0]){
    for(i=[0:2]){
      color("red")translate(getpoints(radiipoints)[i])circle(1);//plots the 3 input points
      color("cyan")translate(tangentsNcen[i])circle(1);//plots the two tangent poins and the circle centre
    }
    translate([tangentsNcen[2][0],tangentsNcen[2][1],-0.2])circle(r=radius,$fn=25);//draws the cirle
    %polygon(getpoints(radiipoints));//draws a polygon
  }
}

function polyRound(radiipoints,fn=5,mode=0)=
  /*Takes a list of radii points of the format [x,y,radius] and rounds each point
    with fn resolution
    mode=0 - automatic radius limiting - DEFAULT
    mode=1 - Debug, output radius reduction for automatic radius limiting
    mode=2 - No radius limiting*/
  let(
    p=getpoints(radiipoints), //make list of coordinates without radii
    Lp=len(p),
    //remove the middle point of any three colinear points, otherwise adding a radius to the middle of a straigh line causes problems
    radiiPointsWithoutTrippleColinear=[
      for(i=[0:len(p)-1]) if(
        // keep point if it isn't colinear or if the radius is 0
        !isColinear(
          p[listWrap(i-1,Lp)],
          p[listWrap(i+0,Lp)],
          p[listWrap(i+1,Lp)]
        )||
        p[listWrap(i+0,Lp)].z!=0
      ) radiipoints[listWrap(i+0,Lp)] 
    ],
    newrp2=processRadiiPoints(radiiPointsWithoutTrippleColinear),
    plusMinusPointRange=mode==2?1:2,
    temp=[
      for(i=[0:len(newrp2)-1]) //for each point in the radii array
      let(
        thepoints=[for(j=[-plusMinusPointRange:plusMinusPointRange])newrp2[listWrap(i+j,len(newrp2))]],//collect 5 radii points
        temp2=mode==2?round3points(thepoints,fn):round5points(thepoints,fn,mode)
      )
      mode==1?temp2:newrp2[i][2]==0?
        [[newrp2[i][0],newrp2[i][1]]]: //return the original point if the radius is 0
        CentreN2PointsArc(temp2[0],temp2[1],temp2[2],0,fn) //return the arc if everything is normal
    ]
  )
  [for (a = temp) for (b = a) b];//flattern and return the array

function round5points(rp,fn,debug=0)=
	rp[2][2]==0&&debug==0?[[rp[2][0],rp[2][1]]]://return the middle point if the radius is 0
	rp[2][2]==0&&debug==1?0://if debug is enabled and the radius is 0 return 0
	let(
    p=getpoints(rp), //get list of points
    r=[for(i=[1:3]) abs(rp[i][2])],//get the centre 3 radii
    //start by determining what the radius should be at point 3
    //find angles at points 2 , 3 and 4
    a2=cosineRuleAngle(p[0],p[1],p[2]),
    a3=cosineRuleAngle(p[1],p[2],p[3]),
    a4=cosineRuleAngle(p[2],p[3],p[4]),
    //find the distance between points 2&3 and between points 3&4
    d23=pointDist(p[1],p[2]),
    d34=pointDist(p[2],p[3]),
    //find the radius factors
    F23=(d23*tan(a2/2)*tan(a3/2))/(r[0]*tan(a3/2)+r[1]*tan(a2/2)),
    F34=(d34*tan(a3/2)*tan(a4/2))/(r[1]*tan(a4/2)+r[2]*tan(a3/2)),
    newR=min(r[1],F23*r[1],F34*r[1]),//use the smallest radius
    //now that the radius has been determined, find tangent points and circle centre
    tangD=newR/tan(a3/2),//distance to the tangent point from p3
      circD=newR/sin(a3/2),//distance to the circle centre from p3
    //find the angle from the p3
    an23=getAngle(p[1],p[2]),//angle from point 3 to 2
    an34=getAngle(p[3],p[2]),//angle from point 3 to 4
    //find tangent points
    t23=[p[2][0]-cos(an23)*tangD,p[2][1]-sin(an23)*tangD],//tangent point between points 2&3
    t34=[p[2][0]-cos(an34)*tangD,p[2][1]-sin(an34)*tangD],//tangent point between points 3&4
    //find circle centre
    tmid=getMidpoint(t23,t34),//midpoint between the two tangent points
    anCen=getAngle(tmid,p[2]),//angle from point 3 to circle centre
    cen=[p[2][0]-cos(anCen)*circD,p[2][1]-sin(anCen)*circD]
  )
    //circle center by offseting from point 3
    //determine the direction of rotation
	debug==1?//if debug in disabled return arc (default)
    (newR-r[1]):
	[t23,t34,cen];

function round3points(rp,fn)=
  rp[1][2]==0?[[rp[1][0],rp[1][1]]]://return the middle point if the radius is 0
	let(
    p=getpoints(rp), //get list of points
	  r=rp[1][2],//get the centre 3 radii
    ang=cosineRuleAngle(p[0],p[1],p[2]),//angle between the lines
    //now that the radius has been determined, find tangent points and circle centre
	  tangD=r/tan(ang/2),//distance to the tangent point from p2
    circD=r/sin(ang/2),//distance to the circle centre from p2
    //find the angles from the p2 with respect to the postitive x axis
    angleFromPoint1ToPoint2=getAngle(p[0],p[1]),
    angleFromPoint2ToPoint3=getAngle(p[2],p[1]),
    //find tangent points
    t12=[p[1][0]-cos(angleFromPoint1ToPoint2)*tangD,p[1][1]-sin(angleFromPoint1ToPoint2)*tangD],//tangent point between points 1&2
    t23=[p[1][0]-cos(angleFromPoint2ToPoint3)*tangD,p[1][1]-sin(angleFromPoint2ToPoint3)*tangD],//tangent point between points 2&3
    //find circle centre
    tmid=getMidpoint(t12,t23),//midpoint between the two tangent points
    angCen=getAngle(tmid,p[1]),//angle from point 2 to circle centre
    cen=[p[1][0]-cos(angCen)*circD,p[1][1]-sin(angCen)*circD] //circle center by offseting from point 2 
  )
	[t12,t23,cen];

function parallelFollow(rp,thick=4,minR=1,mode=1)=
    //rp[1][2]==0?[rp[1][0],rp[1][1],0]://return the middle point if the radius is 0
    thick==0?[rp[1][0],rp[1][1],0]://return the middle point if the radius is 0
	let(
    p=getpoints(rp), //get list of points
	  r=thick,//get the centre 3 radii
    ang=cosineRuleAngle(p[0],p[1],p[2]),//angle between the lines
    //now that the radius has been determined, find tangent points and circle centre
    tangD=r/tan(ang/2),//distance to the tangent point from p2
  	sgn=CWorCCW(rp),//rotation of the three points cw or ccw?let(sgn=mode==0?1:-1)
    circD=mode*sgn*r/sin(ang/2),//distance to the circle centre from p2
    //find the angles from the p2 with respect to the postitive x axis
    angleFromPoint1ToPoint2=getAngle(p[0],p[1]),
    angleFromPoint2ToPoint3=getAngle(p[2],p[1]),
    //find tangent points
    t12=[p[1][0]-cos(angleFromPoint1ToPoint2)*tangD,p[1][1]-sin(angleFromPoint1ToPoint2)*tangD],//tangent point between points 1&2
	  t23=[p[1][0]-cos(angleFromPoint2ToPoint3)*tangD,p[1][1]-sin(angleFromPoint2ToPoint3)*tangD],//tangent point between points 2&3
    //find circle centre
    tmid=getMidpoint(t12,t23),//midpoint between the two tangent points
    angCen=getAngle(tmid,p[1]),//angle from point 2 to circle centre
    cen=[p[1][0]-cos(angCen)*circD,p[1][1]-sin(angCen)*circD],//circle center by offseting from point 2 
    outR=max(minR,rp[1][2]-thick*sgn*mode) //ensures radii are never too small.
  )
	concat(cen,outR);

function findPoint(ang1,refpoint1,ang2,refpoint2,r=0)=
  let(
    m1=tan(ang1),
    c1=refpoint1.y-m1*refpoint1.x,
	  m2=tan(ang2),
    c2=refpoint2.y-m2*refpoint2.x,
    outputX=(c2-c1)/(m1-m2),
    outputY=m1*outputX+c1
  )
	[outputX,outputY,r];

function beamChain(radiiPoints,offset1=0,offset2,mode=0,minR=0,startAngle,endAngle)= 
  /*This function takes a series of radii points and plots points to run along side at a consistant distance, think of it as offset but for line instead of a polygon
  radiiPoints=radii points,
  offset1 & offset2= The two offsets that give the beam it's thickness. When using with mode=2 only offset1 is needed as there is no return path for the polygon
  minR=min radius, if all of your radii are set properly within the radii points this value can be ignored
  startAngle & endAngle= Angle at each end of the beam, different mode determine if this angle is relative to the ending legs of the beam or absolute.
  mode=1 - include endpoints startAngle&2 are relative to the angle of the last two points and equal 90deg if not defined
  mode=2 - Only the forward path is defined, useful for combining the beam with other radii points, see examples for a use-case.
  mode=3 - include endpoints startAngle&2 are absolute from the x axis and are 0 if not defined
  negative radiuses only allowed for the first and last radii points
  
  As it stands this function could probably be tidied a lot, but it works, I'll tidy later*/
  let(
    offset2undef=offset2==undef?1:0,
    offset2=offset2undef==1?0:offset2,
    CWorCCW1=sign(offset1)*CWorCCW(radiiPoints),
    CWorCCW2=sign(offset2)*CWorCCW(radiiPoints),
    offset1=abs(offset1),
    offset2b=abs(offset2),
    Lrp3=len(radiiPoints)-3,
    Lrp=len(radiiPoints),
    startAngle=mode==0&&startAngle==undef?
      getAngle(radiiPoints[0],radiiPoints[1])+90:
      mode==2&&startAngle==undef?
      0:
      mode==0?
      getAngle(radiiPoints[0],radiiPoints[1])+startAngle:
      startAngle,
    endAngle=mode==0&&endAngle==undef?
            getAngle(radiiPoints[Lrp-1],radiiPoints[Lrp-2])+90:
        mode==2&&endAngle==undef?
            0:
        mode==0?
            getAngle(radiiPoints[Lrp-1],radiiPoints[Lrp-2])+endAngle:
            endAngle,
    OffLn1=[for(i=[0:Lrp3]) offset1==0?radiiPoints[i+1]:parallelFollow([radiiPoints[i],radiiPoints[i+1],radiiPoints[i+2]],offset1,minR,mode=CWorCCW1)],
    OffLn2=[for(i=[0:Lrp3]) offset2==0?radiiPoints[i+1]:parallelFollow([radiiPoints[i],radiiPoints[i+1],radiiPoints[i+2]],offset2b,minR,mode=CWorCCW2)],  
    Rp1=abs(radiiPoints[0].z),
    Rp2=abs(radiiPoints[Lrp-1].z),
    endP1a=findPoint(getAngle(radiiPoints[0],radiiPoints[1]),         OffLn1[0],              startAngle,radiiPoints[0],     Rp1),
    endP1b=findPoint(getAngle(radiiPoints[Lrp-1],radiiPoints[Lrp-2]), OffLn1[len(OffLn1)-1],  endAngle,radiiPoints[Lrp-1], Rp2),
    endP2a=findPoint(getAngle(radiiPoints[0],radiiPoints[1]),         OffLn2[0],              startAngle,radiiPoints[0],     Rp1),
    endP2b=findPoint(getAngle(radiiPoints[Lrp-1],radiiPoints[Lrp-2]), OffLn2[len(OffLn1)-1],  endAngle,radiiPoints[Lrp-1], Rp2),
    absEnda=getAngle(endP1a,endP2a),
    absEndb=getAngle(endP1b,endP2b),
    negRP1a=[cos(absEnda)*radiiPoints[0].z*10+endP1a.x,        sin(absEnda)*radiiPoints[0].z*10+endP1a.y,       0.0],
    negRP2a=[cos(absEnda)*-radiiPoints[0].z*10+endP2a.x,       sin(absEnda)*-radiiPoints[0].z*10+endP2a.y,      0.0],
    negRP1b=[cos(absEndb)*radiiPoints[Lrp-1].z*10+endP1b.x,    sin(absEndb)*radiiPoints[Lrp-1].z*10+endP1b.y,   0.0],
    negRP2b=[cos(absEndb)*-radiiPoints[Lrp-1].z*10+endP2b.x,   sin(absEndb)*-radiiPoints[Lrp-1].z*10+endP2b.y,  0.0],
    OffLn1b=(mode==0||mode==2)&&radiiPoints[0].z<0&&radiiPoints[Lrp-1].z<0?
        concat([negRP1a],[endP1a],OffLn1,[endP1b],[negRP1b])
      :(mode==0||mode==2)&&radiiPoints[0].z<0?
        concat([negRP1a],[endP1a],OffLn1,[endP1b])
      :(mode==0||mode==2)&&radiiPoints[Lrp-1].z<0?
        concat([endP1a],OffLn1,[endP1b],[negRP1b])
      :mode==0||mode==2?
        concat([endP1a],OffLn1,[endP1b])
      :
        OffLn1,
    OffLn2b=(mode==0||mode==2)&&radiiPoints[0].z<0&&radiiPoints[Lrp-1].z<0?
        concat([negRP2a],[endP2a],OffLn2,[endP2b],[negRP2b])
      :(mode==0||mode==2)&&radiiPoints[0].z<0?
        concat([negRP2a],[endP2a],OffLn2,[endP2b])
      :(mode==0||mode==2)&&radiiPoints[Lrp-1].z<0?
        concat([endP2a],OffLn2,[endP2b],[negRP2b])
      :mode==0||mode==2?
        concat([endP2a],OffLn2,[endP2b])
      :
        OffLn2
    )//end of let()
  offset2undef==1?OffLn1b:concat(OffLn2b,revList(OffLn1b));
    
function revList(list)=//reverse list
  let(Llist=len(list)-1)
  [for(i=[0:Llist]) list[Llist-i]];

function CWorCCW(p)=
	let(
    Lp=len(p),
	  e=[for(i=[0:Lp-1]) 
      (p[listWrap(i+0,Lp)].x-p[listWrap(i+1,Lp)].x)*(p[listWrap(i+0,Lp)].y+p[listWrap(i+1,Lp)].y)
    ]
  )  
  sign(sum(e));

function CentreN2PointsArc(p1,p2,cen,mode=0,fn)=
  /* This function plots an arc from p1 to p2 with fn increments using the cen as the centre of the arc.
  the mode determines how the arc is plotted
  mode==0, shortest arc possible 
  mode==1, longest arc possible
  mode==2, plotted clockwise
  mode==3, plotted counter clockwise
  */
	let(
    isCWorCCW=CWorCCW([cen,p1,p2]),//determine the direction of rotation
    //determine the arc angle depending on the mode
    p1p2Angle=cosineRuleAngle(p2,cen,p1),
    arcAngle=
      mode==0?p1p2Angle:
      mode==1?p1p2Angle-360:
      mode==2&&isCWorCCW==-1?p1p2Angle:
      mode==2&&isCWorCCW== 1?p1p2Angle-360:
      mode==3&&isCWorCCW== 1?p1p2Angle:
      mode==3&&isCWorCCW==-1?p1p2Angle-360:
      cosineRuleAngle(p2,cen,p1),
    r=pointDist(p1,cen),//determine the radius
	  p1Angle=getAngle(cen,p1) //angle of line 1
  )
  [for(i=[0:fn])
  let(angleIncrement=(arcAngle/fn)*i*isCWorCCW)
  [cos(p1Angle+angleIncrement)*r+cen.x,sin(p1Angle+angleIncrement)*r+cen.y]];

function translateRadiiPoints(radiiPoints,tran=[0,0],rot=0)=
	[for(i=radiiPoints) 
		let(
      a=getAngle([0,0],[i.x,i.y]),//get the angle of the this point
		  h=pointDist([0,0],[i.x,i.y]) //get the hypotenuse/radius
    )
		[h*cos(a+rot)+tran.x,h*sin(a+rot)+tran.y,i.z]//calculate the point's new position
	];

module round2d(OR=3,IR=1){
  offset(OR,$fn=100){
    offset(-IR-OR,$fn=100){
      offset(IR,$fn=100){
        children();
      }
    }
  }
}

module shell2d(offset1,offset2=0,minOR=0,minIR=0){
	difference(){
		round2d(minOR,minIR){
      offset(max(offset1,offset2)){
        children(0);//original 1st child forms the outside of the shell
      }
    }
		round2d(minIR,minOR){
      difference(){//round the inside cutout
        offset(min(offset1,offset2)){
          children(0);//shrink the 1st child to form the inside of the shell 
        }
        if($children>1){
          for(i=[1:$children-1]){
            children(i);//second child and onwards is used to add material to inside of the shell
          }
        }
      }
		}
	}
}

module internalSq(size,r,center=0){
    tran=center==1?[0,0]:size/2;
    translate(tran){
      square(size,true);
      offs=sin(45)*r;
      for(i=[-1,1],j=[-1,1]){
        translate([(size.x/2-offs)*i,(size.y/2-offs)*j])circle(r);
      }
    }
}

module extrudeWithRadius(length,r1=0,r2=0,fn=30){
  n1=sign(r1);n2=sign(r2);
  r1=abs(r1);r2=abs(r2);
  translate([0,0,r1]){
    linear_extrude(length-r1-r2){
      children();
    }
  }
  for(i=[0:fn-1]){
    translate([0,0,i/fn*r1]){
      linear_extrude(r1/fn+0.01){
        offset(n1*sqrt(sq(r1)-sq(r1-i/fn*r1))-n1*r1){
          children();
        }
      }
    }
    translate([0,0,length-r2+i/fn*r2]){
      linear_extrude(r2/fn+0.01){
        offset(n2*sqrt(sq(r2)-sq(i/fn*r2))-n2*r2){
          children();
        }
      }
    }
  }
}

function mirrorPoints(radiiPoints,rot=0,endAttenuation=[0,0])= //mirrors a list of points about Y, ignoring the first and last points and returning them in reverse order for use with polygon or polyRound
  let(
    a=translateRadiiPoints(radiiPoints,[0,0],-rot),
    temp3=[for(i=[0+endAttenuation[0]:len(a)-1-endAttenuation[1]])
      [a[i][0],-a[i][1],a[i][2]]
    ],
    temp=translateRadiiPoints(temp3,[0,0],rot),
    temp2=revList(temp3)
  )    
  concat(radiiPoints,temp2);

function processRadiiPoints(rp)=
  [for(i=[0:len(rp)-1])
    processRadiiPoints2(rp,i)
  ];

function processRadiiPoints2(list,end=0,idx=0,result=0)=
  idx>=end+1?result:
  processRadiiPoints2(list,end,idx+1,relationalRadiiPoints(result,list[idx]));

function cosineRuleBside(a,c,C)=c*cos(C)-sqrt(sq(a)+sq(c)+sq(cos(C))-sq(c));

function absArelR(po,pn)=
  let(
    th2=atan(po[1]/po[0]),
    r2=sqrt(sq(po[0])+sq(po[1])),
    r3=cosineRuleBside(r2,pn[1],th2-pn[0])
  )
  [cos(pn[0])*r3,sin(pn[0])*r3,pn[2]];

function relationalRadiiPoints(po,pi)=
  let(
    p0=pi[0],
    p1=pi[1],
    p2=pi[2],
    pv0=pi[3][0],
    pv1=pi[3][1],
    pt0=pi[3][2],
    pt1=pi[3][3],
    pn=
      (pv0=="y"&&pv1=="x")||(pv0=="r"&&pv1=="a")||(pv0=="y"&&pv1=="a")||(pv0=="x"&&pv1=="a")||(pv0=="y"&&pv1=="r")||(pv0=="x"&&pv1=="r")?
        [p1,p0,p2,concat(pv1,pv0,pt1,pt0)]:
        [p0,p1,p2,concat(pv0,pv1,pt0,pt1)],
    n0=pn[0],
    n1=pn[1],
    n2=pn[2],
    nv0=pn[3][0],
    nv1=pn[3][1],
    nt0=pn[3][2],
    nt1=pn[3][3],
    temp=
      pn[0]=="l"?
        [po[0],pn[1],pn[2]]
      :pn[1]=="l"?
        [pn[0],po[1],pn[2]]
      :nv0==undef?
        [pn[0],pn[1],pn[2]]//abs x, abs y as default when undefined
      :nv0=="a"?
        nv1=="r"?
          nt0=="a"?
            nt1=="a"||nt1==undef?
              [cos(n0)*n1,sin(n0)*n1,n2]//abs angle, abs radius
            :absArelR(po,pn)//abs angle rel radius
          :nt1=="r"||nt1==undef?
            [po[0]+cos(pn[0])*pn[1],po[1]+sin(pn[0])*pn[1],pn[2]]//rel angle, rel radius 
          :[pn[0],pn[1],pn[2]]//rel angle, abs radius
        :nv1=="x"?
          nt0=="a"?
            nt1=="a"||nt1==undef?
              [pn[1],pn[1]*tan(pn[0]),pn[2]]//abs angle, abs x
            :[po[0]+pn[1],(po[0]+pn[1])*tan(pn[0]),pn[2]]//abs angle rel x
            :nt1=="r"||nt1==undef?
              [po[0]+pn[1],po[1]+pn[1]*tan(pn[0]),pn[2]]//rel angle, rel x 
            :[pn[1],po[1]+(pn[1]-po[0])*tan(pn[0]),pn[2]]//rel angle, abs x
          :nt0=="a"?
            nt1=="a"||nt1==undef?
              [pn[1]/tan(pn[0]),pn[1],pn[2]]//abs angle, abs y
            :[(po[1]+pn[1])/tan(pn[0]),po[1]+pn[1],pn[2]]//abs angle rel y
          :nt1=="r"||nt1==undef?
            [po[0]+(pn[1]-po[0])/tan(90-pn[0]),po[1]+pn[1],pn[2]]//rel angle, rel y 
          :[po[0]+(pn[1]-po[1])/tan(pn[0]),pn[1],pn[2]]//rel angle, abs y
      :nv0=="r"?
        nv1=="x"?
          nt0=="a"?
            nt1=="a"||nt1==undef?
              [pn[1],sign(pn[0])*sqrt(sq(pn[0])-sq(pn[1])),pn[2]]//abs radius, abs x
            :[po[0]+pn[1],sign(pn[0])*sqrt(sq(pn[0])-sq(po[0]+pn[1])),pn[2]]//abs radius rel x
          :nt1=="r"||nt1==undef?
            [po[0]+pn[1],po[1]+sign(pn[0])*sqrt(sq(pn[0])-sq(pn[1])),pn[2]]//rel radius, rel x 
          :[pn[1],po[1]+sign(pn[0])*sqrt(sq(pn[0])-sq(pn[1]-po[0])),pn[2]]//rel radius, abs x
        :nt0=="a"?
          nt1=="a"||nt1==undef?
            [sign(pn[0])*sqrt(sq(pn[0])-sq(pn[1])),pn[1],pn[2]]//abs radius, abs y
          :[sign(pn[0])*sqrt(sq(pn[0])-sq(po[1]+pn[1])),po[1]+pn[1],pn[2]]//abs radius rel y
        :nt1=="r"||nt1==undef?
          [po[0]+sign(pn[0])*sqrt(sq(pn[0])-sq(pn[1])),po[1]+pn[1],pn[2]]//rel radius, rel y 
        :[po[0]+sign(pn[0])*sqrt(sq(pn[0])-sq(pn[1]-po[1])),pn[1],pn[2]]//rel radius, abs y
      :nt0=="a"?
        nt1=="a"||nt1==undef?
          [pn[0],pn[1],pn[2]]//abs x, abs y
        :[pn[0],po[1]+pn[1],pn[2]]//abs x rel y
      :nt1=="r"||nt1==undef?
        [po[0]+pn[0],po[1]+pn[1],pn[2]]//rel x, rel y 
      :[po[0]+pn[0],pn[1],pn[2]]//rel x, abs y
  )
  temp;

function invtan(run,rise)=
  let(a=abs(atan(rise/run)))
  rise==0&&run>0?
    0:rise>0&&run>0?
    a:rise>0&&run==0?
    90:rise>0&&run<0?
    180-a:rise==0&&run<0?
    180:rise<0&&run<0?
    a+180:rise<0&&run==0?
    270:rise<0&&run>0?
    360-a:"error";

function cosineRuleAngle(p1,p2,p3)=
  let(
    p12=abs(pointDist(p1,p2)),
    p13=abs(pointDist(p1,p3)),
    p23=abs(pointDist(p2,p3))
  )
  acos((sq(p23)+sq(p12)-sq(p13))/(2*p23*p12));

function sum(list, idx = 0, result = 0) = 
	idx >= len(list) ? result : sum(list, idx + 1, result + list[idx]);

function sq(x)=x*x;
function getGradient(p1,p2)=(p2.y-p1.y)/(p2.x-p1.x);
function getAngle(p1,p2)=p1==p2?0:invtan(p2[0]-p1[0],p2[1]-p1[1]);
function getMidpoint(p1,p2)=[(p1[0]+p2[0])/2,(p1[1]+p2[1])/2]; //returns the midpoint of two points
function pointDist(p1,p2)=sqrt(abs(sq(p1[0]-p2[0])+sq(p1[1]-p2[1]))); //returns the distance between two points
function isColinear(p1,p2,p3)=getGradient(p1,p2)==getGradient(p2,p3)?1:0;//return 1 if 3 points are colinear
module polyline(p, width=0.3) {
  for(i=[0:max(0,len(p)-1)]){
    color([i*1/len(p),1-i*1/len(p),0,0.5])line(p[i],p[listWrap(i+1,len(p) )],width);
  }
} // polyline plotter
module line(p1, p2 ,width=0.3) { // single line plotter
  hull() {
    translate(p1){
      circle(width);
    }
    translate(p2){
      circle(width);
    }
  }
}

function getpoints(p)=[for(i=[0:len(p)-1])[p[i].x,p[i].y]];// gets [x,y]list of[x,y,r]list
function listWrap(x,x_max=1,x_min=0) = (((x - x_min) % (x_max - x_min)) + (x_max - x_min)) % (x_max - x_min) + x_min; // wraps numbers inside boundaries
function rnd(a = 1, b = 0, s = []) = 
  s == [] ? 
    (rands(min(a, b), max(   a, b), 1)[0]):(rands(min(a, b), max(a, b), 1, s)[0]); // nice rands wrapper 

module rounded_square_shape(size, delta, progress, center = true) {
  offset(r=$corner_radius, $fa=360/$shape_facets){
    square_shape([size.x - $corner_radius*2, size.y - $corner_radius*2], delta, progress);
  }
}

// for skin
function skin_rounded_square(size, delta, progress, thickness_difference) =
  polyRound(add_rounding(rectangle_profile(size - (delta * progress)), $corner_radius), $shape_facets/4);
// a safe theoretical distance between two vertices such that they don't collapse. hard to use
SMALLEST_POSSIBLE = 1/128;
$fs=0.1;
$unit=19.05;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

function stem_height() = $total_depth - $dish_depth - $stem_inset;

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// cherry stabilizer stem dimensions
function outer_cherry_stabilizer_stem(slop) = [4.85 - slop * 2, 6.05 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.25 + slop / 3],
  // vertical tine
  [1.15 + slop / 3, 4.23 + extra_vertical + slop / 3 + SMALLEST_POSSIBLE],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

function side_tilt(column) = asin($unit * column / $double_sculpt_radius);
// tan of 0 is 0, division by 0 is nan, so we have to guard
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - ($unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// adds uniform rounding radius for round-anything polyRound
function add_rounding(p, radius)=[for(i=[0:len(p)-1])[p[i].x,p[i].y, radius]];
// computes millimeter length from unit length
function unit_length(length) = $unit * (length - 1) + 18.16;

// we do this weird key_shape_type check here because rounded_square uses
// square_shape, and we want flat sides to work for that too.
// could be refactored, idk
module square_shape(size, delta, progress){
  if ($key_shape_type == "flat_sided_square") {
    flat_sided_square_shape(size, delta,progress);
  } else {
    square(size - delta * progress, center = true);
  }
}
/*
[-size.x /2,-size.y / 2],
[size.x / 2,-size.y / 2],
[size.x / 2, size.y / 2],
[-size.x / 2, size.y / 2] */

// for side-printed keycaps. Any amount of top tilt (on a keycap with a smaller
// top than bottom) makes the left and right side of the keycap convex. This
// shape makes the sides flat by making the top a trapezoid.
// This obviously doesn't work with rounded sides at all
module flat_sided_square_shape(size, delta, progress) {
  polygon(skin_flat_sided_square_shape(size, delta, progress));
}

function skin_flat_sided_square_shape(size,delta,progress) = [
  [(-size.x + (delta.x + extra_keytop_length_for_flat_sides()) * progress)/2, (-size.y + delta.y * progress)/2],
  [(size.x - (delta.x + extra_keytop_length_for_flat_sides()) * progress)/2,(-size.y + delta.y * progress)/2],
  [(size.x - (delta.x - extra_keytop_length_for_flat_sides()) * progress)/2, (size.y - delta.y * progress)/2],
  [(-size.x + (delta.x - extra_keytop_length_for_flat_sides()) * progress)/2, (size.y - delta.y * progress)/2]
];

function rectangle_profile(size) = [
  [-size.x/2, -size.y/2],
  [size.x/2, -size.y/2],
  [size.x/2, size.y/2],
  [-size.x/2, size.y/2],
];

function skin_square_shape(size, delta, progress, thickness_difference) =
  let(
    width = size[0],
    height = size[1],

    width_difference = delta[0] * progress,
    height_difference = delta[1] * progress,

    square_size = [
      width - width_difference - thickness_difference,
      height - height_difference - thickness_difference
    ]
  ) $key_shape_type == "flat_sided_square" ? skin_flat_sided_square_shape(size, delta, progress) : rectangle_profile(square_size);
module oblong_shape(size, delta, progress) {
  // .05 is because of offset. if we set offset to be half the height of the shape, and then subtract height from the shape, the height of the shape will be zero (because the shape would be [width - height, height - height]). that doesn't play well with openSCAD (understandably), so we add this tiny fudge factor to make sure the shape we offset has a positive width
  height = size[1] - delta[1] * progress - .05;

  if (progress < 0.5) {
  } else {
    offset(r=height / 2) {
      square(size - [height, height] - delta * progress, center=true);
    }
  }
}
// we do this weird key_shape_type check here because rounded_square uses
// square_shape, and we want flat sides to work for that too.
// could be refactored, idk
module regular_polygon_shape(size, delta, progress, sides=6){
  // https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/undersized_circular_objects
  fudge = 1/cos(180/sides);
  diameter = (size.x - delta.x * progress - $corner_radius*2) * fudge;
  offset(r=$corner_radius) rotate([0,0,360/sides/2]) circle(d = diameter, $fn=sides);
}



// TODO not implemented
function skin_regular_polygon_shape(size, delta, progress, thickness_difference, sides=6) = echo("skin regular polygon not implemented");

// size: at progress 0, the shape is supposed to be this size
// delta: at progress 1, the keycap is supposed to be size - delta
// progress: how far along the transition you are.
// it's not always linear - specifically sculpted_square
module key_shape(size, delta, progress = 0) {
  if ($key_shape_type == "iso_enter") {
    ISO_enter_shape(size, delta, progress);
  } else if ($key_shape_type == "sculpted_square") {
    sculpted_square_shape(size, delta, progress);
  } else if ($key_shape_type == "rounded_square") {
    rounded_square_shape(size, delta, progress);
  } else if ($key_shape_type == "flat_sided_square") {
    // rounded_square_shape handles this
    rounded_square_shape(size, delta, progress);
  } else if ($key_shape_type == "square") {
    square_shape(size, delta, progress);
  } else if ($key_shape_type == "oblong") {
    oblong_shape(size, delta, progress);
  } else if ($key_shape_type == "hexagon") {
    regular_polygon_shape(size, delta, progress);
  } else if ($key_shape_type == "octagon") {
    regular_polygon_shape(size, delta, progress, sides=8);
  } else if ($key_shape_type == "circular") {
    regular_polygon_shape(size, delta, progress, sides=36);
  } else {
    echo("Warning: unsupported $key_shape_type");
  }
}

function skin_key_shape(size, delta, progress = 0, thickness_difference) =
  $key_shape_type == "rounded_square" ?
    skin_rounded_square(size, delta, progress, thickness_difference) :
    $key_shape_type == "sculpted_square" ?
      skin_sculpted_square_shape(size, delta, progress, thickness_difference) :
    $key_shape_type == "square" ?
      skin_square_shape(size, delta, progress, thickness_difference) :
    $key_shape_type == "iso_enter" ?
      skin_iso_enter_shape(size, delta, progress, thickness_difference) :
      echo("Warning: unsupported $key_shape_type for skin shape. disable skin_extrude_shape or pick a new shape");
// a safe theoretical distance between two vertices such that they don't collapse. hard to use
SMALLEST_POSSIBLE = 1/128;
$fs=0.1;
$unit=19.05;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

function stem_height() = $total_depth - $dish_depth - $stem_inset;

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// cherry stabilizer stem dimensions
function outer_cherry_stabilizer_stem(slop) = [4.85 - slop * 2, 6.05 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.25 + slop / 3],
  // vertical tine
  [1.15 + slop / 3, 4.23 + extra_vertical + slop / 3 + SMALLEST_POSSIBLE],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

function side_tilt(column) = asin($unit * column / $double_sculpt_radius);
// tan of 0 is 0, division by 0 is nan, so we have to guard
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - ($unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// adds uniform rounding radius for round-anything polyRound
function add_rounding(p, radius)=[for(i=[0:len(p)-1])[p[i].x,p[i].y, radius]];
// computes millimeter length from unit length
function unit_length(length) = $unit * (length - 1) + 18.16;

// extra length to the vertical tine of the inside cherry cross
// splits the stem into halves - allows easier fitment
extra_vertical = 100;

module inside_cherry_cross(slop) {
  // inside cross
  // translation purely for aesthetic purposes, to get rid of that awful lattice
  translate([0,0,-SMALLEST_POSSIBLE]) {
    linear_extrude(height = $stem_throw) {
      square(cherry_cross(slop, extra_vertical)[0], center=true);
      square(cherry_cross(slop, extra_vertical)[1], center=true);
    }
  }

  // Guides to assist insertion and mitigate first layer squishing
  if ($cherry_bevel){
    for (i = cherry_cross(slop, extra_vertical)) hull() {
      linear_extrude(height = 0.01, center = false) offset(delta = 0.4) square(i, center=true);
      translate([0, 0, 0.5]) linear_extrude(height = 0.01, center = false)  square(i, center=true);
    }
  }
}

module cherry_stem(depth, slop, throw) {
  difference(){
    // outside shape
    linear_extrude(height = depth) {
      offset(r=1){
        square(outer_cherry_stem(slop) - [2,2], center=true);
      }
    }

    inside_cherry_cross($stem_inner_slop);
  }
}
// a safe theoretical distance between two vertices such that they don't collapse. hard to use
SMALLEST_POSSIBLE = 1/128;
$fs=0.1;
$unit=19.05;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

function stem_height() = $total_depth - $dish_depth - $stem_inset;

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// cherry stabilizer stem dimensions
function outer_cherry_stabilizer_stem(slop) = [4.85 - slop * 2, 6.05 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.25 + slop / 3],
  // vertical tine
  [1.15 + slop / 3, 4.23 + extra_vertical + slop / 3 + SMALLEST_POSSIBLE],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

function side_tilt(column) = asin($unit * column / $double_sculpt_radius);
// tan of 0 is 0, division by 0 is nan, so we have to guard
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - ($unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// adds uniform rounding radius for round-anything polyRound
function add_rounding(p, radius)=[for(i=[0:len(p)-1])[p[i].x,p[i].y, radius]];
// computes millimeter length from unit length
function unit_length(length) = $unit * (length - 1) + 18.16;
// a safe theoretical distance between two vertices such that they don't collapse. hard to use
SMALLEST_POSSIBLE = 1/128;
$fs=0.1;
$unit=19.05;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

function stem_height() = $total_depth - $dish_depth - $stem_inset;

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// cherry stabilizer stem dimensions
function outer_cherry_stabilizer_stem(slop) = [4.85 - slop * 2, 6.05 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.25 + slop / 3],
  // vertical tine
  [1.15 + slop / 3, 4.23 + extra_vertical + slop / 3 + SMALLEST_POSSIBLE],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

function side_tilt(column) = asin($unit * column / $double_sculpt_radius);
// tan of 0 is 0, division by 0 is nan, so we have to guard
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - ($unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// adds uniform rounding radius for round-anything polyRound
function add_rounding(p, radius)=[for(i=[0:len(p)-1])[p[i].x,p[i].y, radius]];
// computes millimeter length from unit length
function unit_length(length) = $unit * (length - 1) + 18.16;

// extra length to the vertical tine of the inside cherry cross
// splits the stem into halves - allows easier fitment
extra_vertical = 100;

module inside_cherry_cross(slop) {
  // inside cross
  // translation purely for aesthetic purposes, to get rid of that awful lattice
  translate([0,0,-SMALLEST_POSSIBLE]) {
    linear_extrude(height = $stem_throw) {
      square(cherry_cross(slop, extra_vertical)[0], center=true);
      square(cherry_cross(slop, extra_vertical)[1], center=true);
    }
  }

  // Guides to assist insertion and mitigate first layer squishing
  if ($cherry_bevel){
    for (i = cherry_cross(slop, extra_vertical)) hull() {
      linear_extrude(height = 0.01, center = false) offset(delta = 0.4) square(i, center=true);
      translate([0, 0, 0.5]) linear_extrude(height = 0.01, center = false)  square(i, center=true);
    }
  }
}

module cherry_stem(depth, slop, throw) {
  difference(){
    // outside shape
    linear_extrude(height = depth) {
      offset(r=1){
        square(outer_cherry_stem(slop) - [2,2], center=true);
      }
    }

    inside_cherry_cross($stem_inner_slop);
  }
}

module rounded_cherry_stem(depth, slop, throw) {
  difference(){
    cylinder(d=$rounded_cherry_stem_d, h=depth);

    // inside cross
    // translation purely for aesthetic purposes, to get rid of that awful lattice
    inside_cherry_cross($stem_inner_slop);
  }
}
// a safe theoretical distance between two vertices such that they don't collapse. hard to use
SMALLEST_POSSIBLE = 1/128;
$fs=0.1;
$unit=19.05;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

function stem_height() = $total_depth - $dish_depth - $stem_inset;

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// cherry stabilizer stem dimensions
function outer_cherry_stabilizer_stem(slop) = [4.85 - slop * 2, 6.05 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.25 + slop / 3],
  // vertical tine
  [1.15 + slop / 3, 4.23 + extra_vertical + slop / 3 + SMALLEST_POSSIBLE],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

function side_tilt(column) = asin($unit * column / $double_sculpt_radius);
// tan of 0 is 0, division by 0 is nan, so we have to guard
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - ($unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// adds uniform rounding radius for round-anything polyRound
function add_rounding(p, radius)=[for(i=[0:len(p)-1])[p[i].x,p[i].y, radius]];
// computes millimeter length from unit length
function unit_length(length) = $unit * (length - 1) + 18.16;
// a safe theoretical distance between two vertices such that they don't collapse. hard to use
SMALLEST_POSSIBLE = 1/128;
$fs=0.1;
$unit=19.05;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

function stem_height() = $total_depth - $dish_depth - $stem_inset;

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// cherry stabilizer stem dimensions
function outer_cherry_stabilizer_stem(slop) = [4.85 - slop * 2, 6.05 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.25 + slop / 3],
  // vertical tine
  [1.15 + slop / 3, 4.23 + extra_vertical + slop / 3 + SMALLEST_POSSIBLE],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

function side_tilt(column) = asin($unit * column / $double_sculpt_radius);
// tan of 0 is 0, division by 0 is nan, so we have to guard
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - ($unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// adds uniform rounding radius for round-anything polyRound
function add_rounding(p, radius)=[for(i=[0:len(p)-1])[p[i].x,p[i].y, radius]];
// computes millimeter length from unit length
function unit_length(length) = $unit * (length - 1) + 18.16;

// extra length to the vertical tine of the inside cherry cross
// splits the stem into halves - allows easier fitment
extra_vertical = 100;

module inside_cherry_cross(slop) {
  // inside cross
  // translation purely for aesthetic purposes, to get rid of that awful lattice
  translate([0,0,-SMALLEST_POSSIBLE]) {
    linear_extrude(height = $stem_throw) {
      square(cherry_cross(slop, extra_vertical)[0], center=true);
      square(cherry_cross(slop, extra_vertical)[1], center=true);
    }
  }

  // Guides to assist insertion and mitigate first layer squishing
  if ($cherry_bevel){
    for (i = cherry_cross(slop, extra_vertical)) hull() {
      linear_extrude(height = 0.01, center = false) offset(delta = 0.4) square(i, center=true);
      translate([0, 0, 0.5]) linear_extrude(height = 0.01, center = false)  square(i, center=true);
    }
  }
}

module cherry_stem(depth, slop, throw) {
  difference(){
    // outside shape
    linear_extrude(height = depth) {
      offset(r=1){
        square(outer_cherry_stem(slop) - [2,2], center=true);
      }
    }

    inside_cherry_cross($stem_inner_slop);
  }
}

module box_cherry_stem(depth, slop, throw) {
  difference(){
    // outside shape
    linear_extrude(height = depth) {
      offset(r=1){
        square(outer_box_cherry_stem(slop) - [2,2], center=true);
      }
    }

    // inside cross
    inside_cherry_cross($stem_inner_slop);
  }
}
module alps_stem(depth, slop, throw){
  linear_extrude(height=depth) {
    square($alps_stem, center = true);
  }
}
module filled_stem(_depth, _slop, _throw) {
  // I broke the crap out of this stem type due to the changes I made around how stems are differenced
  // now that we just take the dish out of stems in order to support stuff like
  // bare stem keycaps (and buckling spring eventually) we can't just make a
  // cube. shape() works but means that you certainly couldn't render this
  // stem without the presence of the entire library

  shape($wall_thickness);
}
// a safe theoretical distance between two vertices such that they don't collapse. hard to use
SMALLEST_POSSIBLE = 1/128;
$fs=0.1;
$unit=19.05;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

function stem_height() = $total_depth - $dish_depth - $stem_inset;

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// cherry stabilizer stem dimensions
function outer_cherry_stabilizer_stem(slop) = [4.85 - slop * 2, 6.05 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.25 + slop / 3],
  // vertical tine
  [1.15 + slop / 3, 4.23 + extra_vertical + slop / 3 + SMALLEST_POSSIBLE],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

function side_tilt(column) = asin($unit * column / $double_sculpt_radius);
// tan of 0 is 0, division by 0 is nan, so we have to guard
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - ($unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// adds uniform rounding radius for round-anything polyRound
function add_rounding(p, radius)=[for(i=[0:len(p)-1])[p[i].x,p[i].y, radius]];
// computes millimeter length from unit length
function unit_length(length) = $unit * (length - 1) + 18.16;

// extra length to the vertical tine of the inside cherry cross
// splits the stem into halves - allows easier fitment
extra_vertical = 0.6;

module inside_cherry_stabilizer_cross(slop, throw) {
  // inside cross
  // translation purely for aesthetic purposes, to get rid of that awful lattice
  translate([0,0,-SMALLEST_POSSIBLE]) {
    linear_extrude(height = throw) {
      square(cherry_cross(slop, extra_vertical)[0], center=true);
      square(cherry_cross(slop, extra_vertical)[1], center=true);
    }
  }
}

module cherry_stabilizer_stem(depth, slop, throw) {
  difference(){
    // outside shape
    linear_extrude(height = depth) {
      offset(r=1){
        square(outer_cherry_stabilizer_stem(slop) - [2,2], center=true);
      }
    }

    inside_cherry_stabilizer_cross(slop, throw);
  }
}
separation = 5.7;

positions = [
  [separation/2, 0],
  [-separation/2, 0],
];

// TODO throw not used
module choc_stem(depth, slop, throw){ 
  for (position=positions) {
    translate([position.x,position.y, depth/2]) single_choc_stem(depth, slop);
  }
}

module single_choc_stem(depth, slop) {
  cube([$choc_stem.x - slop, $choc_stem.y - slop, depth], center=true);
}


//whole stem, alps or cherry, trimmed to fit
module stem(stem_type, depth, slop, throw){
    if (stem_type == "alps") {
      alps_stem(depth, slop, throw);
    } else if (stem_type == "cherry" || stem_type == "costar_stabilizer") {
      cherry_stem(depth, slop, throw);
    } else if (stem_type == "rounded_cherry") {
      rounded_cherry_stem(depth, slop, throw);
    } else if (stem_type == "box_cherry") {
      box_cherry_stem(depth, slop, throw);
    } else if (stem_type == "filled") {
      filled_stem();
    } else if (stem_type == "cherry_stabilizer") {
      cherry_stabilizer_stem(depth, slop, throw);
    } else if (stem_type == "choc") {
      choc_stem(depth, slop, throw);
    } else if (stem_type == "disable") {
      children();
    } else {
      echo("Warning: unsupported $stem_type: ");
      echo(stem_type);
    }
}
// a safe theoretical distance between two vertices such that they don't collapse. hard to use
SMALLEST_POSSIBLE = 1/128;
$fs=0.1;
$unit=19.05;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

function stem_height() = $total_depth - $dish_depth - $stem_inset;

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// cherry stabilizer stem dimensions
function outer_cherry_stabilizer_stem(slop) = [4.85 - slop * 2, 6.05 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.25 + slop / 3],
  // vertical tine
  [1.15 + slop / 3, 4.23 + extra_vertical + slop / 3 + SMALLEST_POSSIBLE],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

function side_tilt(column) = asin($unit * column / $double_sculpt_radius);
// tan of 0 is 0, division by 0 is nan, so we have to guard
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - ($unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// adds uniform rounding radius for round-anything polyRound
function add_rounding(p, radius)=[for(i=[0:len(p)-1])[p[i].x,p[i].y, radius]];
// computes millimeter length from unit length
function unit_length(length) = $unit * (length - 1) + 18.16;
// a safe theoretical distance between two vertices such that they don't collapse. hard to use
SMALLEST_POSSIBLE = 1/128;
$fs=0.1;
$unit=19.05;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

function stem_height() = $total_depth - $dish_depth - $stem_inset;

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// cherry stabilizer stem dimensions
function outer_cherry_stabilizer_stem(slop) = [4.85 - slop * 2, 6.05 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.25 + slop / 3],
  // vertical tine
  [1.15 + slop / 3, 4.23 + extra_vertical + slop / 3 + SMALLEST_POSSIBLE],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

function side_tilt(column) = asin($unit * column / $double_sculpt_radius);
// tan of 0 is 0, division by 0 is nan, so we have to guard
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - ($unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// adds uniform rounding radius for round-anything polyRound
function add_rounding(p, radius)=[for(i=[0:len(p)-1])[p[i].x,p[i].y, radius]];
// computes millimeter length from unit length
function unit_length(length) = $unit * (length - 1) + 18.16;

// extra length to the vertical tine of the inside cherry cross
// splits the stem into halves - allows easier fitment
extra_vertical = 100;

module inside_cherry_cross(slop) {
  // inside cross
  // translation purely for aesthetic purposes, to get rid of that awful lattice
  translate([0,0,-SMALLEST_POSSIBLE]) {
    linear_extrude(height = $stem_throw) {
      square(cherry_cross(slop, extra_vertical)[0], center=true);
      square(cherry_cross(slop, extra_vertical)[1], center=true);
    }
  }

  // Guides to assist insertion and mitigate first layer squishing
  if ($cherry_bevel){
    for (i = cherry_cross(slop, extra_vertical)) hull() {
      linear_extrude(height = 0.01, center = false) offset(delta = 0.4) square(i, center=true);
      translate([0, 0, 0.5]) linear_extrude(height = 0.01, center = false)  square(i, center=true);
    }
  }
}

module cherry_stem(depth, slop, throw) {
  difference(){
    // outside shape
    linear_extrude(height = depth) {
      offset(r=1){
        square(outer_cherry_stem(slop) - [2,2], center=true);
      }
    }

    inside_cherry_cross($stem_inner_slop);
  }
}

module brim_support(stem_type, stem_support_height, slop) {
  if(stem_type == "alps") {
    linear_extrude(height=stem_support_height) {
      offset(r=1){
        square($alps_stem + [2,2], center=true);
      }
    }
  } else if (stem_type == "cherry" || stem_type == "costar_stabilizer") {
    difference() {
      linear_extrude(height = stem_support_height){
        offset(r=1){
          square(outer_cherry_stem(slop) + [2,2], center=true);
        }
      }

      inside_cherry_cross($stem_inner_slop);
    }
  } else if (stem_type == "rounded_cherry") {
    difference() {
      cylinder(d=$rounded_cherry_stem_d * 2, h=stem_support_height);
      inside_cherry_cross($stem_inner_slop);
    }
  } else if (stem_type == "box_cherry") {
    difference() {
      linear_extrude(height = stem_support_height){
        offset(r=1){
          square(outer_box_cherry_stem(slop) + [2,2], center=true);
        }
      }

      inside_cherry_cross($stem_inner_slop);
    }
  } else if (stem_type == "cherry_stabilizer") {
    difference() {
      linear_extrude(height = stem_support_height){
        offset(r=1){
          square(outer_cherry_stabilizer_stem(slop) + [2,2], center=true);
        }
      }

      inside_cherry_cross($stem_inner_slop);
    }
  } else if(stem_type == "choc") {
    translate([-5.7/2,0,0]) linear_extrude(height=stem_support_height) {
      offset(r=1){
        square($choc_stem + [3,3], center=true);
      }
    }

    translate([5.7/2,0,0]) linear_extrude(height=stem_support_height) {
      offset(r=1){
        square($choc_stem + [3,3], center=true);
      }
    }
  }
}
// a safe theoretical distance between two vertices such that they don't collapse. hard to use
SMALLEST_POSSIBLE = 1/128;
$fs=0.1;
$unit=19.05;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

function stem_height() = $total_depth - $dish_depth - $stem_inset;

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// cherry stabilizer stem dimensions
function outer_cherry_stabilizer_stem(slop) = [4.85 - slop * 2, 6.05 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.25 + slop / 3],
  // vertical tine
  [1.15 + slop / 3, 4.23 + extra_vertical + slop / 3 + SMALLEST_POSSIBLE],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

function side_tilt(column) = asin($unit * column / $double_sculpt_radius);
// tan of 0 is 0, division by 0 is nan, so we have to guard
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - ($unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// adds uniform rounding radius for round-anything polyRound
function add_rounding(p, radius)=[for(i=[0:len(p)-1])[p[i].x,p[i].y, radius]];
// computes millimeter length from unit length
function unit_length(length) = $unit * (length - 1) + 18.16;
// a safe theoretical distance between two vertices such that they don't collapse. hard to use
SMALLEST_POSSIBLE = 1/128;
$fs=0.1;
$unit=19.05;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

function stem_height() = $total_depth - $dish_depth - $stem_inset;

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// cherry stabilizer stem dimensions
function outer_cherry_stabilizer_stem(slop) = [4.85 - slop * 2, 6.05 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.25 + slop / 3],
  // vertical tine
  [1.15 + slop / 3, 4.23 + extra_vertical + slop / 3 + SMALLEST_POSSIBLE],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

function side_tilt(column) = asin($unit * column / $double_sculpt_radius);
// tan of 0 is 0, division by 0 is nan, so we have to guard
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - ($unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// adds uniform rounding radius for round-anything polyRound
function add_rounding(p, radius)=[for(i=[0:len(p)-1])[p[i].x,p[i].y, radius]];
// computes millimeter length from unit length
function unit_length(length) = $unit * (length - 1) + 18.16;

// extra length to the vertical tine of the inside cherry cross
// splits the stem into halves - allows easier fitment
extra_vertical = 100;

module inside_cherry_cross(slop) {
  // inside cross
  // translation purely for aesthetic purposes, to get rid of that awful lattice
  translate([0,0,-SMALLEST_POSSIBLE]) {
    linear_extrude(height = $stem_throw) {
      square(cherry_cross(slop, extra_vertical)[0], center=true);
      square(cherry_cross(slop, extra_vertical)[1], center=true);
    }
  }

  // Guides to assist insertion and mitigate first layer squishing
  if ($cherry_bevel){
    for (i = cherry_cross(slop, extra_vertical)) hull() {
      linear_extrude(height = 0.01, center = false) offset(delta = 0.4) square(i, center=true);
      translate([0, 0, 0.5]) linear_extrude(height = 0.01, center = false)  square(i, center=true);
    }
  }
}

module cherry_stem(depth, slop, throw) {
  difference(){
    // outside shape
    linear_extrude(height = depth) {
      offset(r=1){
        square(outer_cherry_stem(slop) - [2,2], center=true);
      }
    }

    inside_cherry_cross($stem_inner_slop);
  }
}

/* NOTE: every reference to total_key_width and total_key_height
 * is multiplied by two in order to account for offset stems
 */ 
module centered_tines(stem_support_height) {
  if ($key_length < 2) {
    translate([0,0,$stem_support_height / 2]) {
      cube([total_key_width()*2, 0.5, $stem_support_height], center = true);
    }
  }

  translate([0,0,$stem_support_height / 2]) {
    cube([
      1,
      total_key_height()*2,
      $stem_support_height
    ],
    center = true);
  }
}

module tines_support(stem_type, stem_support_height, slop) {
  if (stem_type == "cherry" || stem_type == "costar_stabilizer") {
    difference () {
      union() {
        if ($key_length < 2) {
          translate([0,0,$stem_support_height / 2]) {
            cube([
              total_key_width()*2,
              0.5,
              $stem_support_height
            ], center = true);
          }
        }

        // 2 vertical tines holding either side of the cruciform
        for (x = [2, -2]) {
          translate([x,0,$stem_support_height / 2]) {
            cube([
              0.5,
              total_key_height()*2, // this is to extend past
              $stem_support_height
            ], center = true);
          }
        }
      }

      inside_cherry_cross($stem_inner_slop);
    }
  } else if (stem_type == "cherry_stabilizer") {
    difference () {
      for (x = [1.15, -1.15]) {
        translate([x,0,$stem_support_height / 2]) {
          cube([
            1,
            total_key_height()*2,
            $stem_support_height
          ], center = true);
        }
      }

      inside_cherry_stabilizer_cross(slop);
    }
  } else if (stem_type == "box_cherry") {
    difference () {
      centered_tines(stem_support_height);

      inside_cherry_cross($stem_inner_slop);
    }
  } else if (stem_type == "rounded_cherry") {
    difference () {
      centered_tines(stem_support_height);

      inside_cherry_cross($stem_inner_slop);
    }
  } else if (stem_type == "alps"){
    centered_tines(stem_support_height);
  } else if (stem_type == "choc"){
    if ($key_length < 2) translate([0,0,$stem_support_height / 2]) cube([total_key_width(), 0.42, $stem_support_height], center = true);
    /* translate([-5.7/2,0,$stem_support_height / 2]) cube([0.5, total_key_height(), $stem_support_height], center = true); */
    /* translate([5.7/2,0,$stem_support_height / 2]) cube([0.5, total_key_height(), $stem_support_height], center = true); */
  }
}


//whole stem, alps or cherry, trimmed to fit
module stem_support(support_type, stem_type, stem_support_height, slop){
    if (support_type == "brim") {
      brim_support(stem_type, stem_support_height, slop);
    } else if (support_type == "tines") {
      tines_support(stem_type, stem_support_height, slop);
    } else if (support_type == "disable") {
      children();
    } else {
      echo("Warning: unsupported $stem_support_type");
    }
}
// from https://www.thingiverse.com/thing:1484333
// public domain license
// same syntax and semantics as built-in sphere, so should be a drop-in replacement
// it's a bit slow for large numbers of facets
module geodesic_sphere(r=-1, d=-1) {
  // if neither parameter specified, radius is taken to be 1
  rad = r > 0 ? r : d > 0 ? d/2 : 1;

  pentside_pr = 2*sin(36);  // side length compared to radius of a pentagon
  pentheight_pr = sqrt(pentside_pr*pentside_pr - 1);
  // from center of sphere, icosahedron edge subtends this angle
  edge_subtend = 2*atan(pentheight_pr);

  // vertical rotation by 72 degrees
  c72 = cos(72);
  s72 = sin(72);
  function zrot(pt) = [ c72*pt[0]-s72*pt[1], s72*pt[0]+c72*pt[1], pt[2] ];

  // rotation from north to vertex along positive x
  ces = cos(edge_subtend);
  ses = sin(edge_subtend);
  function yrot(pt) = [ ces*pt[0] + ses*pt[2], pt[1], ces*pt[2]-ses*pt[0] ];

  // 12 icosahedron vertices generated from north, south, yrot and zrot
  ic1 = [ 0, 0, 1 ];  // north
  ic2 = yrot(ic1);    // north and +x
  ic3 = zrot(ic2);    // north and +x and +y
  ic4 = zrot(ic3);    // north and -x and +y
  ic5 = zrot(ic4);    // north and -x and -y
  ic6 = zrot(ic5);    // north and +x and -y
  ic12 = [ 0, 0, -1]; // south
  ic10 = yrot(ic12);  // south and -x
  ic11 = zrot(ic10);  // south and -x and -y
  ic7 = zrot(ic11);   // south and +x and -y
  ic8 = zrot(ic7);    // south and +x and +y
  ic9 = zrot(ic8);    // south and -x and +y

  // start with icosahedron, icos[0] is vertices and icos[1] is faces
  icos = [ [ic1, ic2, ic3, ic4, ic5, ic6, ic7, ic8, ic9, ic10, ic11, ic12 ],
    [ [0, 2, 1], [0, 3, 2], [0, 4, 3], [0, 5, 4], [0, 1, 5],
      [1, 2, 7], [2, 3, 8], [3, 4, 9], [4, 5, 10], [5, 1, 6],
      [7, 6, 1], [8, 7, 2], [9, 8, 3], [10, 9, 4], [6, 10, 5],
      [6, 7, 11], [7, 8, 11], [8, 9, 11], [9, 10, 11], [10, 6, 11]]];

  // now for polyhedron subdivision functions

  // given two 3D points on the unit sphere, find the half-way point on the great circle
  // (euclidean midpoint renormalized to be 1 unit away from origin)
  function midpt(p1, p2) =
    let (midx = (p1[0] + p2[0])/2, midy = (p1[1] + p2[1])/2, midz = (p1[2] + p2[2])/2)
    let (midlen = sqrt(midx*midx + midy*midy + midz*midz))
    [ midx/midlen, midy/midlen, midz/midlen ];

  // given a "struct" where pf[0] is vertices and pf[1] is faces, subdivide all faces into
  // 4 faces by dividing each edge in half along a great circle (midpt function)
  // and returns a struct of the same format, i.e. pf[0] is a (larger) list of vertices and
  // pf[1] is a larger list of faces.
  function subdivpf(pf) =
    let (p=pf[0], faces=pf[1])
    [ // for each face, barf out six points
      [ for (f=faces)
          let (p0 = p[f[0]], p1 = p[f[1]], p2=p[f[2]])
            // "identity" for-loop saves having to flatten
            for (outp=[ p0, p1, p2, midpt(p0, p1), midpt(p1, p2), midpt(p0, p2) ]) outp
      ],
      // now, again for each face, spit out four faces that connect those six points
      [ for (i=[0:len(faces)-1])
        let (base = 6*i)  // points generated in multiples of 6
          for (outf =
          [[ base, base+3, base+5],
          [base+3, base+1, base+4],
          [base+5, base+4, base+2],
          [base+3, base+4, base+5]]) outf  // "identity" for-loop saves having to flatten
      ]
    ];

  // recursive wrapper for subdivpf that subdivides "levels" times
  function multi_subdiv_pf(pf, levels) =
    levels == 0 ? pf :
    multi_subdiv_pf(subdivpf(pf), levels-1);

  // subdivision level based on $fa:
  // level 0 has edge angle of edge_subtend so subdivision factor should be edge_subtend/$fa
  // must round up to next power of 2.
  // Take log base 2 of angle ratio and round up to next integer
  ang_levels = ceil(log(edge_subtend/$fa)/log(2));

  // subdivision level based on $fs:
  // icosahedron edge length is rad*2*tan(edge_subtend/2)
  // actually a chord and not circumference but let's say it's close enough
  // subdivision factor should be rad*2*tan(edge_subtend/2)/$fs
  side_levels = ceil(log(rad*2*tan(edge_subtend/2)/$fs)/log(2));

  // subdivision level based on $fn: (fragments around circumference, not total facets)
  // icosahedron circumference around equator is about 5 (level 1 is exactly 10)
  // ratio of requested to equatorial segments is $fn/5
  // level of subdivison is log base 2 of $fn/5
  // round up to the next whole level so we get at least $fn
  facet_levels = ceil(log($fn/5)/log(2));

  // $fn takes precedence, otherwise facet_levels is NaN (-inf) but it's ok
  // because it falls back to $fa or $fs, whichever translates to fewer levels
  levels = $fn ? facet_levels : min(ang_levels, side_levels);

  // subdivide icosahedron by these levels
  subdiv_icos = multi_subdiv_pf(icos, levels);

  scale(rad)
  polyhedron(points=subdiv_icos[0], faces=subdiv_icos[1]);
}

module cylindrical_dish(width, height, depth, inverted){
  // .5 has problems starting around 3u
  $fa=.25;
  /* we do some funky math here
   * basically you want to have the dish "dig in" to the keycap x millimeters
   * in order to do that you have to solve a small (2d) system of equations
   * where the chord of the spherical cross section of the dish is
   * the width of the keycap.
   */
  // the distance you have to move the dish so it digs in depth millimeters
  chord_length = (pow(width, 2) - 4 * pow(depth, 2)) / (8 * depth);
  //the radius of the dish
  rad = (pow(width, 2) + 4 * pow(depth, 2)) / (8 * depth);
  direction = inverted ? -1 : 1;

  translate([0,0, chord_length * direction]){
    rotate([90, 0, 0]) cylinder(h=height + 20, r=rad, center=true);
  }
}
//the older, 'more accurate', and MUCH slower spherical dish.
// generates the largest sphere possible that still contains the chord we are looking for
// much more graduated curvature at an immense cost
module old_spherical_dish(width, height, depth, inverted){

  //same thing as the cylindrical dish here, but we need the corners to just touch - so we have to find the hypotenuse of the top
  chord = pow((pow(width,2) + pow(height, 2)),0.5); //getting diagonal of the top

  // the distance you have to move the dish up so it digs in depth millimeters
  chord_length = (pow(chord, 2) - 4 * pow(depth, 2)) / (8 * depth);
  //the radius of the dish
  rad = (pow(chord, 2) + 4 * pow(depth, 2)) / (8 * depth);
  direction = inverted ? -1 : 1;

  translate([0,0,chord_length * direction]){
    if (geodesic){
      $fa=7;
      geodesic_sphere(r=rad);
    } else {
      $fa=1;
      // rotate 1 because the bottom of the sphere looks like trash
      sphere(r=rad);
    }
  }
}
module sideways_cylindrical_dish(width, height, depth, inverted){
  $fa=1;
  chord_length = (pow(height, 2) - 4 * pow(depth, 2)) / (8 * depth);
  rad = (pow(height, 2) + 4 * pow(depth, 2)) / (8 * depth);

  direction = inverted ? -1 : 1;

  translate([0,0, chord_length * direction]){
    // cylinder is rendered facing up, so we rotate it on the y axis first
    rotate([0,90,0]) cylinder(h = width + 20,r=rad, center=true); // +20 for fudge factor
  }
}
module spherical_dish(width, height, depth, inverted){

  //same thing as the cylindrical dish here, but we need the corners to just touch - so we have to find the hypotenuse of the top
  chord = pow((pow(width,2) + pow(height, 2)),0.5); //getting diagonal of the top

  // the distance you have to move the dish up so it digs in depth millimeters
  chord_length = (pow(chord, 2) - 4 * pow(depth, 2)) / (8 * depth);
  //the radius of the dish
  rad = (pow(chord, 2) + 4 * pow(depth, 2)) / (8 * depth);
  direction = inverted ? -1 : 1;

  translate([0,0,0 * direction]){
    if (geodesic){
      $fa=20;
      scale([chord/2/depth, chord/2/depth]) {
        geodesic_sphere(r=depth);
      }
    } else {
      $fa=6.5;
      // rotate 1 because the bottom of the sphere looks like trash.
      scale([chord/2/depth, chord/2/depth]) {
        sphere(r=depth);
      }
    }
  }
}
module squared_spherical_dish(width, height, depth, inverted=false) {
    chord = pow(pow(height / 2, 2) + pow(width / 2, 2),0.5);
    direction = inverted ? -1 : 1;
    r=max(height,width,chord) / 5;
    // ^^^^^ Nothing special about this code to figure out r.
    // I just modeled up 1u, 1.25u, 1.5u, 2u, 2.25u, and 2.75u
    // keys and messed around until I came up with something that
    // looked reasonable for all key sizes.  This just seems to work
    // well for all sizes

    translate([-width / 2, -height / 2, 0 * direction]) {
      resize([width, height, depth])
        hull() {
          cube([chord,chord,0.001]);
          // Use something larger in this translate than -depth 
          // (like -chord) if you want more of a defined circle
          // in the keywell
          translate([chord/2, chord/2, -depth]) 
            sphere(r=r, $fn=128);
        }
    }
}
module squared_scoop_dish(height, width, depth, r=0.5, inverted=false, num=4, den=5){
  // changable numerator/denoninator on where to place the square's corners
  // for example, num=2, den=3 means the dish will happen at 1/3 and 2/3 the
  // width and the height.  Defaults to 4/5. Customizable when calling 
  // this module
  //
  // This was initially intended for the scoop on the HiPro, since that's what
  // it uses.  Use "hipro_row()" if that's what you'd like.  However, I do NOT
  // know how close the inner square is for the HiPro keycaps.  In fact, it could
  // just be a sphere, in which the "squared spherical" scoop is more appropriate.
  // If, however, it the "squared scoop" makes sense, you can adjust where the square
  // lands with the num (numerator) and den (denominator) variables.  For instance,
  // "3" and "4" mean 3/4 of the width/height is where the flat part starts.

  chord = pow(pow(height/2, 2) + pow(width/2, 2),0.5);
  direction = inverted ? -1 : 1;

  //This is the set of points to hull around for the scoop
  points=[
    [height/den - height/2, width/den - width/2, -chord],
    [num*height/den - height/2, width/den - width/2, -chord],
    [height/den - height/2, num*width/den - width/2, -chord],
    [num*height/den - height/2, num*width/den - width/2, -chord]
  ];

  resize([height,width,depth])
    hull() {
      shape_slice(1,0,0);
      for(i=[0:len(points)-1]) {
        translate(points[i])
          sphere(r=r,$fn=64);
      }
  }
}
module flat_dish(width, height, depth, inverted){
  cube([width + 100,height + 100, depth], center=true);
}
// thanks Paul https://github.com/openscad/list-comprehension-demos/

// a safe theoretical distance between two vertices such that they don't collapse. hard to use
SMALLEST_POSSIBLE = 1/128;
$fs=0.1;
$unit=19.05;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

function stem_height() = $total_depth - $dish_depth - $stem_inset;

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// cherry stabilizer stem dimensions
function outer_cherry_stabilizer_stem(slop) = [4.85 - slop * 2, 6.05 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.25 + slop / 3],
  // vertical tine
  [1.15 + slop / 3, 4.23 + extra_vertical + slop / 3 + SMALLEST_POSSIBLE],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

function side_tilt(column) = asin($unit * column / $double_sculpt_radius);
// tan of 0 is 0, division by 0 is nan, so we have to guard
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - ($unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// adds uniform rounding radius for round-anything polyRound
function add_rounding(p, radius)=[for(i=[0:len(p)-1])[p[i].x,p[i].y, radius]];
// computes millimeter length from unit length
function unit_length(length) = $unit * (length - 1) + 18.16;

module 3d_surface(size=$3d_surface_size, step=$3d_surface_step, bottom=-SMALLEST_POSSIBLE){
  function p(x, y) = [ x, y, max(0,$surface_function(x, y)) ];
  function p0(x, y) = [ x, y, bottom ];
  function rev(b, v) = b ? v : [ v[3], v[2], v[1], v[0] ];
  function face(x, y) = [ p(x, y + step), p(x + step, y + step), p(x + step, y), p(x + step, y), p(x, y), p(x, y + step) ];
  function fan(a, i) =
        a == 0 ? [ [ 0, 0, bottom ], [ i, -size, bottom ], [ i + step, -size, bottom ] ]
      : a == 1 ? [ [ 0, 0, bottom ], [ i + step,  size, bottom ], [ i,  size, bottom ] ]
      : a == 2 ? [ [ 0, 0, bottom ], [ -size, i + step, bottom ], [ -size, i, bottom ] ]
      :          [ [ 0, 0, bottom ], [  size, i, bottom ], [  size, i + step, bottom ] ];
  function sidex(x, y) = [ p0(x, y), p(x, y), p(x + step, y), p0(x + step, y) ];
  function sidey(x, y) = [ p0(x, y), p(x, y), p(x, y + step), p0(x, y + step) ];

  points = flatten(concat(
      // top surface
      [ for (x = [ -size : step : size - step ], y = [ -size : step : size - step ]) face(x, y) ],
      // bottom surface as triangle fan
      [ for (a = [ 0 : 3 ], i = [ -size : step : size - step ]) fan(a, i) ],
      // sides
      [ for (x = [ -size : step : size - step ], y = [ -size, size ]) rev(y < 0, sidex(x, y)) ],
      [ for (y = [ -size : step : size - step ], x = [ -size, size ]) rev(x > 0, sidey(x, y)) ]
  ));

  tcount = 2 * pow(2 * size / step, 2) + 8 * size / step;
  scount = 8 * size / step;

  tfaces = [ for (a = [ 0 : 3 : 3 * (tcount - 1) ] ) [ a, a + 1, a + 2 ] ];
  sfaces = [ for (a = [ 3 * tcount : 4 : 3 * tcount + 4 * scount ] ) [ a, a + 1, a + 2, a + 3 ] ];
  faces = concat(tfaces, sfaces);

  polyhedron(points, faces, convexity = 8);
}

module polar_3d_surface(size, step, bottom=-SMALLEST_POSSIBLE){
  function to_polar(q, size) = q * (90 / size);

  function p(x, y) = [
    $surface_distribution_function(to_polar(x, size), size),
    $surface_distribution_function(to_polar(y, size), size),
    max(0,$surface_function($surface_distribution_function(to_polar(x, size), size), $surface_distribution_function(to_polar(y, size), size)))
  ];
  function p0(x, y) = [ x, y, bottom ];
  function rev(b, v) = b ? v : [ v[3], v[2], v[1], v[0] ];
  function face(x, y) = [ p(x, y + step), p(x + step, y + step), p(x + step, y), p(x + step, y), p(x, y), p(x, y + step) ];
  function fan(a, i) =
        a == 0 ? [ [ 0, 0, bottom ], [ i, -size, bottom ], [ i + step, -size, bottom ] ]
      : a == 1 ? [ [ 0, 0, bottom ], [ i + step,  size, bottom ], [ i,  size, bottom ] ]
      : a == 2 ? [ [ 0, 0, bottom ], [ -size, i + step, bottom ], [ -size, i, bottom ] ]
      :          [ [ 0, 0, bottom ], [  size, i, bottom ], [  size, i + step, bottom ] ];
  function sidex(x, y) = [ p0(x, y), p(x, y), p(x + step, y), p0(x + step, y) ];
  function sidey(x, y) = [ p0(x, y), p(x, y), p(x, y + step), p0(x, y + step) ];

  points = flatten(concat(
      // top surface
      [ for (x = [ -size : step : size - step ], y = [ -size : step : size - step ]) face(x, y) ],
      // bottom surface as triangle fan
      [ for (a = [ 0 : 3 ], i = [ -size : step : size - step ]) fan(a, i) ],
      // sides
      [ for (x = [ -size : step : size - step ], y = [ -size, size ]) rev(y < 0, sidex(x, y)) ],
      [ for (y = [ -size : step : size - step ], x = [ -size, size ]) rev(x > 0, sidey(x, y)) ]
  ));

  tcount = 2 * pow(2 * size / step, 2) + 8 * size / step;
  scount = 8 * size / step;

  tfaces = [ for (a = [ 0 : 3 : 3 * (tcount - 1) ] ) [ a, a + 1, a + 2 ] ];
  sfaces = [ for (a = [ 3 * tcount : 4 : 3 * tcount + 4 * scount ] ) [ a, a + 1, a + 2, a + 3 ] ];
  faces = concat(tfaces, sfaces);

  polyhedron(points, faces, convexity = 8);
}

// defaults, overridden in functions.scad
// $surface_distribution_function = function(dim, size) sin(dim) * size;
// $surface_function = function(x,y) (sin(acos(x/$3d_surface_size))) * sin(acos(y/$3d_surface_size));

module 3d_surface_dish(width, height, depth, inverted) {
  echo(inverted ? "inverted" : "not inverted");
  // scale_factor is dead reckoning
  // it doesn't have to be dead reckoning for anything but sculpted sides
  // we know the angle of the sides from the width difference, height difference,
  // skew and tilt of the top. it's a pain to calculate though
  scale_factor = 1.11;
  // the edges on this behave differently than with the previous dish implementations
  scale([width*scale_factor/$3d_surface_size/2,height*scale_factor/$3d_surface_size/2,depth])
    rotate([inverted ? 0:180,0,180])
      polar_3d_surface(size=$3d_surface_size, step=$3d_surface_step, bottom=-10);
  /* %scale([width*scale_factor/$3d_surface_size/2,height*scale_factor/$3d_surface_size/2,depth]) rotate([180,0,0]) polar_3d_surface(bottom=-10); */

}

//geodesic looks much better, but runs very slow for anything above a 2u
geodesic=false;

//dish selector
module  dish(width, height, depth, inverted) {
    if($dish_type == "cylindrical"){
      cylindrical_dish(width, height, depth, inverted);
    } else if ($dish_type == "spherical") {
      spherical_dish(width, height, depth, inverted);
    } else if ($dish_type == "sideways cylindrical"){
      sideways_cylindrical_dish(width, height, depth, inverted);
    } else if ($dish_type == "old spherical") {
      old_spherical_dish(width, height, depth, inverted);
    } else if ($dish_type == "3d surface") {
      3d_surface_dish(width, height, depth, inverted);
    } else if ($dish_type == "flat") {
      flat_dish(width, height, depth, inverted);
    } else if ($dish_type == "disable") {
      // else no dish
    } else if ($dish_type == "squared spherical") {
      squared_spherical_dish(width, height, depth, inverted=inverted);
    } else if ($dish_type == "squared scoop") {
      squared_scoop_dish(width, height, depth, inverted=inverted);
    } else {
      echo("WARN: $dish_type unsupported");
    }
}
// a safe theoretical distance between two vertices such that they don't collapse. hard to use
SMALLEST_POSSIBLE = 1/128;
$fs=0.1;
$unit=19.05;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

function stem_height() = $total_depth - $dish_depth - $stem_inset;

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// cherry stabilizer stem dimensions
function outer_cherry_stabilizer_stem(slop) = [4.85 - slop * 2, 6.05 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.25 + slop / 3],
  // vertical tine
  [1.15 + slop / 3, 4.23 + extra_vertical + slop / 3 + SMALLEST_POSSIBLE],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

function side_tilt(column) = asin($unit * column / $double_sculpt_radius);
// tan of 0 is 0, division by 0 is nan, so we have to guard
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - ($unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// adds uniform rounding radius for round-anything polyRound
function add_rounding(p, radius)=[for(i=[0:len(p)-1])[p[i].x,p[i].y, radius]];
// computes millimeter length from unit length
function unit_length(length) = $unit * (length - 1) + 18.16;
// TODO this define doesn't do anything besides tell me I used flat() in this file
// is it better than not having it at all?
module flat(stem_type, loft, height) {
  translate([0,0,loft + 500]){
    cube(1000, center=true);
  }
}

// figures out the scale factor needed to make a 45 degree wall
function scale_for_45(height, starting_size) = (height * 2 + starting_size) / starting_size;

// complicated since we want the different stems to work well
// also kind of messy... oh well
module flared(stem_type, loft, height) {
  // flat support. straight flat support has a tendency to shear off; flared support
  // all the way to the top has a tendency to warp the outside of the keycap.
  // hopefully the compromise is both
  flat(stem_type, loft + height/4, height);

  translate([0,0,loft]){
    if (stem_type == "rounded_cherry") {
      linear_extrude(height=height, scale = scale_for_45(height, $rounded_cherry_stem_d)){
        circle(d=$rounded_cherry_stem_d);
      }
    } else if (stem_type == "alps") {
      alps_scale = [scale_for_45(height, $alps_stem[0]), scale_for_45(height, $alps_stem[1])];
      linear_extrude(height=height, scale = alps_scale){
        square($alps_stem, center=true);
      }
    } else if (stem_type == "box_cherry") {
      // always render cherry if no stem type. this includes stem_type = false!
      // this avoids a bug where the keycap is rendered filled when not desired
      cherry_scale = [scale_for_45(height, outer_box_cherry_stem($stem_slop)[0]), scale_for_45(height, outer_box_cherry_stem($stem_slop)[1])];
      linear_extrude(height=height, scale = cherry_scale){
        offset(r=1){
          square(outer_box_cherry_stem($stem_slop) - [2,2], center=true);
        }
      }
    } else if (stem_type == "cherry_stabilizer") {
      cherry_scale = [scale_for_45(height, outer_cherry_stabilizer_stem($stem_slop)[0]), scale_for_45(height, outer_cherry_stabilizer_stem($stem_slop)[1])];
      linear_extrude(height=height, scale = cherry_scale){
        offset(r=1){
          square(outer_cherry_stabilizer_stem($stem_slop) - [2,2], center=true);
        }
      }
    } else if (stem_type == "choc") {
      // single support, just the stem
      new_choc_scale = [scale_for_45(height, $choc_stem[0] + 5.7 - $stem_slop), scale_for_45(height, $choc_stem[1])];
      translate([0,0,0]) linear_extrude(height=height, scale = new_choc_scale){
        // TODO make a choc_stem() function so it can build in the slop
        square([$choc_stem[0] + 5.7 - $stem_slop, $choc_stem[1] - $stem_slop], center=true);
      }

    } else {
      // always render cherry if no stem type. this includes stem_type = false!
      // this avoids a bug where the keycap is rendered filled when not desired
      cherry_scale = [scale_for_45(height, outer_cherry_stem($stem_slop)[0]), scale_for_45(height, outer_cherry_stem($stem_slop)[1])];
      linear_extrude(height=height, scale = cherry_scale){
        offset(r=1){
          square(outer_cherry_stem($stem_slop) - [2,2], center=true);
        }
      }
    }
  }
}
module flat(stem_type, loft, height) {
  translate([0,0,loft + 500]){
    cube(1000, center=true);
  }
}
module bars(stem_type, loft, height) {
  translate([0,0,loft + height / 2]){
    cube([2, 100, height], center = true);
    cube([100, 2, height], center = true);
  }
}

module supports(type, stem_type, loft, height) {
  if (type == "flared") {
    flared(stem_type, loft, height);
  } else if (type == "flat") {
    flat(stem_type, loft, height);
  } else if (type == "bars") {
    bars(stem_type, loft, height);
  } else if (type == "disable") {
    children();
  } else {
    echo("Warning: unsupported $support_type");
  }
}
// features are any premade self-contained objects that go on top or inside

module keybump(depth = 0, edge_inset=0.4) {
  radius = 0.5;
  translate([0, -top_total_key_height()/2 + edge_inset, depth]){
        rotate([90,0,90]) cylinder($font_size, radius, radius, true);
        translate([0,0,-radius]) cube([$font_size, radius*2, radius*2], true);
  }
}
// a fake cherry keyswitch, abstracted out to maybe replace with a better one later
module cherry_keyswitch() {
  union() {
    hull() {
      cube([15.6, 15.6, 0.01], center=true);
      translate([0,1,5 - 0.01]) cube([10.5,9.5, 0.01], center=true);
    }
    hull() {
      cube([15.6, 15.6, 0.01], center=true);
      translate([0,0,-5.5]) cube([13.5,13.5,0.01], center=true);
    }
  }
}

//approximate (fully depressed) cherry key to check clearances
module clearance_check() {
  if($stem_type == "cherry" || $stem_type == "cherry_rounded"){
    color($warning_color){
      translate([0,0,3.6 + $stem_inset - 5]) {
        cherry_keyswitch();
      }
    }
  }
}
module keytext(text, position, font_size, depth) {
  woffset = (top_total_key_width()/3.5) * position[0];
  hoffset = (top_total_key_height()/3.5) * -position[1];
  translate([woffset, hoffset, -depth]){
    color($tertiary_color) linear_extrude(height=$dish_depth + depth){
      text(text=text, font=$font, size=font_size, halign="center", valign="center");
    }
  }
}

module legends(depth=0) {
  if (len($front_legends) > 0) {
    front_of_key() {
      for (i=[0:len($front_legends)-1]) {
        rotate([90,0,0]) keytext($front_legends[i][0], $front_legends[i][1], $front_legends[i][2], depth);
  	  }
    }
  }
  if (len($legends) > 0) {
    top_of_key() {
      for (i=[0:len($legends)-1]) {
        keytext($legends[i][0], $legends[i][1], $legends[i][2], depth);
      }
    }
  }
}
// use skin() instead of successive hulls. much more correct, and looks faster
// too, in most cases. successive hull relies on overlapping faces which are
// not good. But, skin works on vertex sets instead of shapes, which makes it
// a lot more difficult to use
module skin_extrude_shape_hull(thickness_difference, depth_difference, extra_slices = 0 ) {
  skin([
    for (index = [0:$height_slices + extra_slices])
      let(
        progress = (index / $height_slices),
        skew_this_slice = $top_skew * progress,
        x_skew_this_slice = $top_skew_x * progress,
        depth_this_slice = ($total_depth - depth_difference) * progress,
        tilt_this_slice = -$top_tilt / $key_height * progress,
        y_tilt_this_slice = $double_sculpted ? (-$top_tilt_y / $key_length * progress) : 0
      )
      skin_shape_slice(progress, thickness_difference, skew_this_slice, x_skew_this_slice, depth_this_slice, tilt_this_slice, y_tilt_this_slice)
  ]);
}

function skin_shape_slice(progress, thickness_difference, skew_this_slice, x_skew_this_slice, depth_this_slice, tilt_this_slice, y_tilt_this_slice) =
  transform(
    translation([x_skew_this_slice,skew_this_slice,depth_this_slice]),
    transform(
      rotation([tilt_this_slice,y_tilt_this_slice,0]),
        skin_key_shape([
          total_key_width(0) - thickness_difference,
          total_key_height(0) - thickness_difference,
          ],
          [$width_difference, $height_difference],
          progress,
          thickness_difference
        )
    )
  );
// corollary is hull_shape_hull
// extra_slices unused, only to match argument signatures
module linear_extrude_shape_hull(thickness_difference, depth_difference, extra_slices = 0){
  height = $total_depth - depth_difference;
  width_scale = top_total_key_width() / total_key_width();
  height_scale = top_total_key_height() / total_key_height();

  translate([0,$linear_extrude_height_adjustment,0]){
    linear_extrude(height = height, scale = [width_scale, height_scale]) {
        translate([0,-$linear_extrude_height_adjustment,0]){
        key_shape(
          [total_key_width(), total_key_height()],
          [thickness_difference, thickness_difference]
        );
      }
    }
  }
}
module hull_shape_hull(thickness_difference, depth_difference, extra_slices = 0) {
  for (index = [0:$height_slices - 1 + extra_slices]) {
    hull() {
      placed_shape_slice(index / $height_slices, thickness_difference, depth_difference);
      placed_shape_slice((index + 1) / $height_slices, thickness_difference, depth_difference);
    }
  }
}

module placed_shape_slice(progress, thickness_difference, depth_difference) {
  skew_this_slice = $top_skew * progress;
  x_skew_this_slice = $top_skew_x * progress;

  depth_this_slice = ($total_depth - depth_difference) * progress;

  tilt_this_slice = -$top_tilt / $key_height * progress;
  y_tilt_this_slice = $double_sculpted ? (-$top_tilt_y / $key_length * progress) : 0;

  translate([x_skew_this_slice, skew_this_slice, depth_this_slice]) {
    rotate([tilt_this_slice,y_tilt_this_slice,0]){
      shape_slice(progress, thickness_difference, depth_difference);
    }
  }
}

module shape_slice(progress, thickness_difference, depth_difference) {
  linear_extrude(height = SMALLEST_POSSIBLE, scale = 1){
    key_shape(
      [
        total_key_width(thickness_difference),
        total_key_height(thickness_difference)
      ],
      [$width_difference, $height_difference],
      progress
    );
  }
}

// basic key shape, no dish, no inside
// which is only used for dishing to cut the dish off correctly
// $height_difference used for keytop thickness
// extra_slices is a hack to make inverted dishes still work
module shape_hull(thickness_difference, depth_difference, extra_slices = 0){
  render() {
    if ($hull_shape_type == "skin") {
      skin_extrude_shape_hull(thickness_difference, depth_difference, extra_slices);
    } else if ($hull_shape_type == "linear extrude") {
      linear_extrude_shape_hull(thickness_difference, depth_difference, extra_slices);
    } else {
      hull_shape_hull(thickness_difference, depth_difference, extra_slices);
    }
  }
}

// from https://www.thingiverse.com/thing:1484333
// public domain license
// same syntax and semantics as built-in sphere, so should be a drop-in replacement
// it's a bit slow for large numbers of facets
module geodesic_sphere(r=-1, d=-1) {
  // if neither parameter specified, radius is taken to be 1
  rad = r > 0 ? r : d > 0 ? d/2 : 1;

  pentside_pr = 2*sin(36);  // side length compared to radius of a pentagon
  pentheight_pr = sqrt(pentside_pr*pentside_pr - 1);
  // from center of sphere, icosahedron edge subtends this angle
  edge_subtend = 2*atan(pentheight_pr);

  // vertical rotation by 72 degrees
  c72 = cos(72);
  s72 = sin(72);
  function zrot(pt) = [ c72*pt[0]-s72*pt[1], s72*pt[0]+c72*pt[1], pt[2] ];

  // rotation from north to vertex along positive x
  ces = cos(edge_subtend);
  ses = sin(edge_subtend);
  function yrot(pt) = [ ces*pt[0] + ses*pt[2], pt[1], ces*pt[2]-ses*pt[0] ];

  // 12 icosahedron vertices generated from north, south, yrot and zrot
  ic1 = [ 0, 0, 1 ];  // north
  ic2 = yrot(ic1);    // north and +x
  ic3 = zrot(ic2);    // north and +x and +y
  ic4 = zrot(ic3);    // north and -x and +y
  ic5 = zrot(ic4);    // north and -x and -y
  ic6 = zrot(ic5);    // north and +x and -y
  ic12 = [ 0, 0, -1]; // south
  ic10 = yrot(ic12);  // south and -x
  ic11 = zrot(ic10);  // south and -x and -y
  ic7 = zrot(ic11);   // south and +x and -y
  ic8 = zrot(ic7);    // south and +x and +y
  ic9 = zrot(ic8);    // south and -x and +y

  // start with icosahedron, icos[0] is vertices and icos[1] is faces
  icos = [ [ic1, ic2, ic3, ic4, ic5, ic6, ic7, ic8, ic9, ic10, ic11, ic12 ],
    [ [0, 2, 1], [0, 3, 2], [0, 4, 3], [0, 5, 4], [0, 1, 5],
      [1, 2, 7], [2, 3, 8], [3, 4, 9], [4, 5, 10], [5, 1, 6],
      [7, 6, 1], [8, 7, 2], [9, 8, 3], [10, 9, 4], [6, 10, 5],
      [6, 7, 11], [7, 8, 11], [8, 9, 11], [9, 10, 11], [10, 6, 11]]];

  // now for polyhedron subdivision functions

  // given two 3D points on the unit sphere, find the half-way point on the great circle
  // (euclidean midpoint renormalized to be 1 unit away from origin)
  function midpt(p1, p2) =
    let (midx = (p1[0] + p2[0])/2, midy = (p1[1] + p2[1])/2, midz = (p1[2] + p2[2])/2)
    let (midlen = sqrt(midx*midx + midy*midy + midz*midz))
    [ midx/midlen, midy/midlen, midz/midlen ];

  // given a "struct" where pf[0] is vertices and pf[1] is faces, subdivide all faces into
  // 4 faces by dividing each edge in half along a great circle (midpt function)
  // and returns a struct of the same format, i.e. pf[0] is a (larger) list of vertices and
  // pf[1] is a larger list of faces.
  function subdivpf(pf) =
    let (p=pf[0], faces=pf[1])
    [ // for each face, barf out six points
      [ for (f=faces)
          let (p0 = p[f[0]], p1 = p[f[1]], p2=p[f[2]])
            // "identity" for-loop saves having to flatten
            for (outp=[ p0, p1, p2, midpt(p0, p1), midpt(p1, p2), midpt(p0, p2) ]) outp
      ],
      // now, again for each face, spit out four faces that connect those six points
      [ for (i=[0:len(faces)-1])
        let (base = 6*i)  // points generated in multiples of 6
          for (outf =
          [[ base, base+3, base+5],
          [base+3, base+1, base+4],
          [base+5, base+4, base+2],
          [base+3, base+4, base+5]]) outf  // "identity" for-loop saves having to flatten
      ]
    ];

  // recursive wrapper for subdivpf that subdivides "levels" times
  function multi_subdiv_pf(pf, levels) =
    levels == 0 ? pf :
    multi_subdiv_pf(subdivpf(pf), levels-1);

  // subdivision level based on $fa:
  // level 0 has edge angle of edge_subtend so subdivision factor should be edge_subtend/$fa
  // must round up to next power of 2.
  // Take log base 2 of angle ratio and round up to next integer
  ang_levels = ceil(log(edge_subtend/$fa)/log(2));

  // subdivision level based on $fs:
  // icosahedron edge length is rad*2*tan(edge_subtend/2)
  // actually a chord and not circumference but let's say it's close enough
  // subdivision factor should be rad*2*tan(edge_subtend/2)/$fs
  side_levels = ceil(log(rad*2*tan(edge_subtend/2)/$fs)/log(2));

  // subdivision level based on $fn: (fragments around circumference, not total facets)
  // icosahedron circumference around equator is about 5 (level 1 is exactly 10)
  // ratio of requested to equatorial segments is $fn/5
  // level of subdivison is log base 2 of $fn/5
  // round up to the next whole level so we get at least $fn
  facet_levels = ceil(log($fn/5)/log(2));

  // $fn takes precedence, otherwise facet_levels is NaN (-inf) but it's ok
  // because it falls back to $fa or $fs, whichever translates to fewer levels
  levels = $fn ? facet_levels : min(ang_levels, side_levels);

  // subdivide icosahedron by these levels
  subdiv_icos = multi_subdiv_pf(icos, levels);

  scale(rad)
  polyhedron(points=subdiv_icos[0], faces=subdiv_icos[1]);
}

// for skin hulls
// very minimal set of linalg functions needed by so3, se3 etc.

// cross and norm are builtins
//function cross(x,y) = [x[1]*y[2]-x[2]*y[1], x[2]*y[0]-x[0]*y[2], x[0]*y[1]-x[1]*y[0]];
//function norm(v) = sqrt(v*v);

function vec3(p) = len(p) < 3 ? concat(p,0) : p;
function vec4(p) = let (v3=vec3(p)) len(v3) < 4 ? concat(v3,1) : v3;
function unit(v) = v/norm(v);

function identity3()=[[1,0,0],[0,1,0],[0,0,1]];
function identity4()=[[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]];


function take3(v) = [v[0],v[1],v[2]];
function tail3(v) = [v[3],v[4],v[5]];
function rotation_part(m) = [take3(m[0]),take3(m[1]),take3(m[2])];
function rot_trace(m) = m[0][0] + m[1][1] + m[2][2];
function rot_cos_angle(m) = (rot_trace(m)-1)/2;

function rotation_part(m) = [take3(m[0]),take3(m[1]),take3(m[2])];
function translation_part(m) = [m[0][3],m[1][3],m[2][3]];
function transpose_3(m) = [[m[0][0],m[1][0],m[2][0]],[m[0][1],m[1][1],m[2][1]],[m[0][2],m[1][2],m[2][2]]];
function transpose_4(m) = [[m[0][0],m[1][0],m[2][0],m[3][0]],
                           [m[0][1],m[1][1],m[2][1],m[3][1]],
                           [m[0][2],m[1][2],m[2][2],m[3][2]],
                           [m[0][3],m[1][3],m[2][3],m[3][3]]];
function invert_rt(m) = construct_Rt(transpose_3(rotation_part(m)), -(transpose_3(rotation_part(m)) * translation_part(m)));
function construct_Rt(R,t) = [concat(R[0],t[0]),concat(R[1],t[1]),concat(R[2],t[2]),[0,0,0,1]];

// Hadamard product of n-dimensional arrays
function hadamard(a,b) = !(len(a)>0) ? a*b : [ for(i = [0:len(a)-1]) hadamard(a[i],b[i]) ];
// so3

// very minimal set of linalg functions needed by so3, se3 etc.

// cross and norm are builtins
//function cross(x,y) = [x[1]*y[2]-x[2]*y[1], x[2]*y[0]-x[0]*y[2], x[0]*y[1]-x[1]*y[0]];
//function norm(v) = sqrt(v*v);

function vec3(p) = len(p) < 3 ? concat(p,0) : p;
function vec4(p) = let (v3=vec3(p)) len(v3) < 4 ? concat(v3,1) : v3;
function unit(v) = v/norm(v);

function identity3()=[[1,0,0],[0,1,0],[0,0,1]];
function identity4()=[[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]];


function take3(v) = [v[0],v[1],v[2]];
function tail3(v) = [v[3],v[4],v[5]];
function rotation_part(m) = [take3(m[0]),take3(m[1]),take3(m[2])];
function rot_trace(m) = m[0][0] + m[1][1] + m[2][2];
function rot_cos_angle(m) = (rot_trace(m)-1)/2;

function rotation_part(m) = [take3(m[0]),take3(m[1]),take3(m[2])];
function translation_part(m) = [m[0][3],m[1][3],m[2][3]];
function transpose_3(m) = [[m[0][0],m[1][0],m[2][0]],[m[0][1],m[1][1],m[2][1]],[m[0][2],m[1][2],m[2][2]]];
function transpose_4(m) = [[m[0][0],m[1][0],m[2][0],m[3][0]],
                           [m[0][1],m[1][1],m[2][1],m[3][1]],
                           [m[0][2],m[1][2],m[2][2],m[3][2]],
                           [m[0][3],m[1][3],m[2][3],m[3][3]]];
function invert_rt(m) = construct_Rt(transpose_3(rotation_part(m)), -(transpose_3(rotation_part(m)) * translation_part(m)));
function construct_Rt(R,t) = [concat(R[0],t[0]),concat(R[1],t[1]),concat(R[2],t[2]),[0,0,0,1]];

// Hadamard product of n-dimensional arrays
function hadamard(a,b) = !(len(a)>0) ? a*b : [ for(i = [0:len(a)-1]) hadamard(a[i],b[i]) ];

function rodrigues_so3_exp(w, A, B) = [
[1.0 - B*(w[1]*w[1] + w[2]*w[2]), B*(w[0]*w[1]) - A*w[2],          B*(w[0]*w[2]) + A*w[1]],
[B*(w[0]*w[1]) + A*w[2],          1.0 - B*(w[0]*w[0] + w[2]*w[2]), B*(w[1]*w[2]) - A*w[0]],
[B*(w[0]*w[2]) - A*w[1],          B*(w[1]*w[2]) + A*w[0],          1.0 - B*(w[0]*w[0] + w[1]*w[1])]
];

function so3_exp(w) = so3_exp_rad(w/180*PI);
function so3_exp_rad(w) =
combine_so3_exp(w,
  w*w < 1e-8
  ? so3_exp_1(w*w)
  : w*w < 1e-6
    ? so3_exp_2(w*w)
    : so3_exp_3(w*w));

function combine_so3_exp(w,AB) = rodrigues_so3_exp(w,AB[0],AB[1]);

// Taylor series expansions close to 0
function so3_exp_1(theta_sq) = [
  1 - 1/6*theta_sq,
  0.5
];

function so3_exp_2(theta_sq) = [
  1.0 - theta_sq * (1.0 - theta_sq/20) / 6,
  0.5 - 0.25/6 * theta_sq
];

function so3_exp_3_0(theta_deg, inv_theta) = [
  sin(theta_deg) * inv_theta,
  (1 - cos(theta_deg)) * (inv_theta * inv_theta)
];

function so3_exp_3(theta_sq) = so3_exp_3_0(sqrt(theta_sq)*180/PI, 1/sqrt(theta_sq));


function rot_axis_part(m) = [m[2][1] - m[1][2], m[0][2] - m[2][0], m[1][0] - m[0][1]]*0.5;

function so3_ln(m) = 180/PI*so3_ln_rad(m);
function so3_ln_rad(m) = so3_ln_0(m,
  cos_angle = rot_cos_angle(m),
  preliminary_result = rot_axis_part(m));

function so3_ln_0(m, cos_angle, preliminary_result) =
so3_ln_1(m, cos_angle, preliminary_result,
  sin_angle_abs = sqrt(preliminary_result*preliminary_result));

function so3_ln_1(m, cos_angle, preliminary_result, sin_angle_abs) =
  cos_angle > sqrt(1/2)
  ? sin_angle_abs > 0
    ? preliminary_result * asin(sin_angle_abs)*PI/180 / sin_angle_abs
    : preliminary_result
  : cos_angle > -sqrt(1/2)
    ? preliminary_result * acos(cos_angle)*PI/180 / sin_angle_abs
    : so3_get_symmetric_part_rotation(
        preliminary_result,
        m,
        angle = PI - asin(sin_angle_abs)*PI/180,
        d0 = m[0][0] - cos_angle,
        d1 = m[1][1] - cos_angle,
        d2 = m[2][2] - cos_angle
      );

function so3_get_symmetric_part_rotation(preliminary_result, m, angle, d0, d1, d2) =
so3_get_symmetric_part_rotation_0(preliminary_result,angle,so3_largest_column(m, d0, d1, d2));

function so3_get_symmetric_part_rotation_0(preliminary_result, angle, c_max) =
  angle * unit(c_max * preliminary_result < 0 ? -c_max : c_max);

function so3_largest_column(m, d0, d1, d2) =
    d0*d0 > d1*d1 && d0*d0 > d2*d2
    ?  [d0, (m[1][0]+m[0][1])/2, (m[0][2]+m[2][0])/2]
    : d1*d1 > d2*d2
      ? [(m[1][0]+m[0][1])/2, d1, (m[2][1]+m[1][2])/2]
      : [(m[0][2]+m[2][0])/2, (m[2][1]+m[1][2])/2, d2];

__so3_test = [12,-125,110];
echo(UNITTEST_so3=norm(__so3_test-so3_ln(so3_exp(__so3_test))) < 1e-8);

function combine_se3_exp(w, ABt) = construct_Rt(rodrigues_so3_exp(w, ABt[0], ABt[1]), ABt[2]);

// [A,B,t]
function se3_exp_1(t,w) = concat(
  so3_exp_1(w*w),
  [t + 0.5 * cross(w,t)]
);

function se3_exp_2(t,w) = se3_exp_2_0(t,w,w*w);
function se3_exp_2_0(t,w,theta_sq) =
se3_exp_23(
  so3_exp_2(theta_sq),
  C = (1.0 - theta_sq/20) / 6,
  t=t,w=w);

function se3_exp_3(t,w) = se3_exp_3_0(t,w,sqrt(w*w)*180/PI,1/sqrt(w*w));

function se3_exp_3_0(t,w,theta_deg,inv_theta) =
se3_exp_23(
  so3_exp_3_0(theta_deg = theta_deg, inv_theta = inv_theta),
  C = (1 - sin(theta_deg) * inv_theta) * (inv_theta * inv_theta),
  t=t,w=w);

function se3_exp_23(AB,C,t,w) =
[AB[0], AB[1], t + AB[1] * cross(w,t) + C * cross(w,cross(w,t)) ];

function se3_exp(mu) = se3_exp_0(t=take3(mu),w=tail3(mu)/180*PI);

function se3_exp_0(t,w) =
combine_se3_exp(w,
// Evaluate by Taylor expansion when near 0
  w*w < 1e-8
  ? se3_exp_1(t,w)
  : w*w < 1e-6
    ? se3_exp_2(t,w)
    : se3_exp_3(t,w)
);

function se3_ln(m) = se3_ln_to_deg(se3_ln_rad(m));
function se3_ln_to_deg(v) = concat(take3(v),tail3(v)*180/PI);

function se3_ln_rad(m) = se3_ln_0(m,
  rot = so3_ln_rad(rotation_part(m)));
function se3_ln_0(m,rot) = se3_ln_1(m,rot,
  theta = sqrt(rot*rot));
function se3_ln_1(m,rot,theta) = se3_ln_2(m,rot,theta,
  shtot = theta > 0.00001 ? sin(theta/2*180/PI)/theta : 0.5,
  halfrotator = so3_exp_rad(rot * -.5));
function se3_ln_2(m,rot,theta,shtot,halfrotator) =
concat( (halfrotator * translation_part(m) -
  (theta > 0.001
  ? rot * ((translation_part(m) * rot) * (1-2*shtot) / (rot*rot))
  : rot * ((translation_part(m) * rot)/24)
  )) / (2 * shtot), rot);

__se3_test = [20,-40,60,-80,100,-120];
echo(UNITTEST_se3=norm(__se3_test-se3_ln(se3_exp(__se3_test))) < 1e-8);
// very minimal set of linalg functions needed by so3, se3 etc.

// cross and norm are builtins
//function cross(x,y) = [x[1]*y[2]-x[2]*y[1], x[2]*y[0]-x[0]*y[2], x[0]*y[1]-x[1]*y[0]];
//function norm(v) = sqrt(v*v);

function vec3(p) = len(p) < 3 ? concat(p,0) : p;
function vec4(p) = let (v3=vec3(p)) len(v3) < 4 ? concat(v3,1) : v3;
function unit(v) = v/norm(v);

function identity3()=[[1,0,0],[0,1,0],[0,0,1]];
function identity4()=[[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]];


function take3(v) = [v[0],v[1],v[2]];
function tail3(v) = [v[3],v[4],v[5]];
function rotation_part(m) = [take3(m[0]),take3(m[1]),take3(m[2])];
function rot_trace(m) = m[0][0] + m[1][1] + m[2][2];
function rot_cos_angle(m) = (rot_trace(m)-1)/2;

function rotation_part(m) = [take3(m[0]),take3(m[1]),take3(m[2])];
function translation_part(m) = [m[0][3],m[1][3],m[2][3]];
function transpose_3(m) = [[m[0][0],m[1][0],m[2][0]],[m[0][1],m[1][1],m[2][1]],[m[0][2],m[1][2],m[2][2]]];
function transpose_4(m) = [[m[0][0],m[1][0],m[2][0],m[3][0]],
                           [m[0][1],m[1][1],m[2][1],m[3][1]],
                           [m[0][2],m[1][2],m[2][2],m[3][2]],
                           [m[0][3],m[1][3],m[2][3],m[3][3]]];
function invert_rt(m) = construct_Rt(transpose_3(rotation_part(m)), -(transpose_3(rotation_part(m)) * translation_part(m)));
function construct_Rt(R,t) = [concat(R[0],t[0]),concat(R[1],t[1]),concat(R[2],t[2]),[0,0,0,1]];

// Hadamard product of n-dimensional arrays
function hadamard(a,b) = !(len(a)>0) ? a*b : [ for(i = [0:len(a)-1]) hadamard(a[i],b[i]) ];
// List helpers

/*!
  Flattens a list one level:

  flatten([[0,1],[2,3]]) => [0,1,2,3]
*/
function flatten(list) = [ for (i = list, v = i) v ];


/*!
  Creates a list from a range:

  range([0:2:6]) => [0,2,4,6]
*/
function range(r) = [ for(x=r) x ];

/*!
  Reverses a list:

  reverse([1,2,3]) => [3,2,1]
*/
function reverse(list) = [for (i = [len(list)-1:-1:0]) list[i]];

/*!
  Extracts a subarray from index begin (inclusive) to end (exclusive)
  FIXME: Change name to use list instead of array?

  subarray([1,2,3,4], 1, 2) => [2,3]
*/
function subarray(list,begin=0,end=-1) = [
    let(end = end < 0 ? len(list) : end)
      for (i = [begin : 1 : end-1])
        list[i]
];

/*!
  Returns a copy of a list with the element at index i set to x

  set([1,2,3,4], 2, 5) => [1,2,5,4]
*/
function set(list, i, x) = [for (i_=[0:len(list)-1]) i == i_ ? x : list[i_]];

/*!
  Remove element from the list by index.
  remove([4,3,2,1],1) => [4,2,1]
*/
function remove(list, i) = [for (i_=[0:1:len(list)-2]) list[i_ < i ? i_ : i_ + 1]];

/*!
  Creates a rotation matrix

  xyz = euler angles = rz * ry * rx
  axis = rotation_axis * rotation_angle
*/
function rotation(xyz=undef, axis=undef) =
  xyz != undef && axis != undef ? undef :
  xyz == undef  ? se3_exp([0,0,0,axis[0],axis[1],axis[2]]) :
  len(xyz) == undef ? rotation(axis=[0,0,xyz]) :
  (len(xyz) >= 3 ? rotation(axis=[0,0,xyz[2]]) : identity4()) *
  (len(xyz) >= 2 ? rotation(axis=[0,xyz[1],0]) : identity4()) *
  (len(xyz) >= 1 ? rotation(axis=[xyz[0],0,0]) : identity4());

/*!
  Creates a scaling matrix
*/
function scaling(v) = [
  [v[0],0,0,0],
  [0,v[1],0,0],
  [0,0,v[2],0],
  [0,0,0,1],
];

/*!
  Creates a translation matrix
*/
function translation(v) = [
  [1,0,0,v[0]],
  [0,1,0,v[1]],
  [0,0,1,v[2]],
  [0,0,0,1],
];

// Convert between cartesian and homogenous coordinates
function project(x) = subarray(x,end=len(x)-1) / x[len(x)-1];

function transform(m, list) = [for (p=list) project(m * vec4(p))];
function to_3d(list) = [ for(v = list) vec3(v) ];
// List helpers

/*!
  Flattens a list one level:

  flatten([[0,1],[2,3]]) => [0,1,2,3]
*/
function flatten(list) = [ for (i = list, v = i) v ];


/*!
  Creates a list from a range:

  range([0:2:6]) => [0,2,4,6]
*/
function range(r) = [ for(x=r) x ];

/*!
  Reverses a list:

  reverse([1,2,3]) => [3,2,1]
*/
function reverse(list) = [for (i = [len(list)-1:-1:0]) list[i]];

/*!
  Extracts a subarray from index begin (inclusive) to end (exclusive)
  FIXME: Change name to use list instead of array?

  subarray([1,2,3,4], 1, 2) => [2,3]
*/
function subarray(list,begin=0,end=-1) = [
    let(end = end < 0 ? len(list) : end)
      for (i = [begin : 1 : end-1])
        list[i]
];

/*!
  Returns a copy of a list with the element at index i set to x

  set([1,2,3,4], 2, 5) => [1,2,5,4]
*/
function set(list, i, x) = [for (i_=[0:len(list)-1]) i == i_ ? x : list[i_]];

/*!
  Remove element from the list by index.
  remove([4,3,2,1],1) => [4,2,1]
*/
function remove(list, i) = [for (i_=[0:1:len(list)-2]) list[i_ < i ? i_ : i_ + 1]];
function square(size) = [[-size,-size], [-size,size], [size,size], [size,-size]] / 2;

function circle(r) = [for (i=[0:$fn-1]) let (a=i*360/$fn) r * [cos(a), sin(a)]];

function regular(r, n) = circle(r, $fn=n);

function rectangle_profile(size=[1,1]) = [
  // The first point is the anchor point, put it on the point corresponding to [cos(0),sin(0)]
  [ size[0]/2,  0],
  [ size[0]/2,  size[1]/2],
  [-size[0]/2,  size[1]/2],
  [-size[0]/2, -size[1]/2],
  [ size[0]/2, -size[1]/2],
];

// FIXME: Move rectangle and rounded rectangle from extrusion
// very minimal set of linalg functions needed by so3, se3 etc.

// cross and norm are builtins
//function cross(x,y) = [x[1]*y[2]-x[2]*y[1], x[2]*y[0]-x[0]*y[2], x[0]*y[1]-x[1]*y[0]];
//function norm(v) = sqrt(v*v);

function vec3(p) = len(p) < 3 ? concat(p,0) : p;
function vec4(p) = let (v3=vec3(p)) len(v3) < 4 ? concat(v3,1) : v3;
function unit(v) = v/norm(v);

function identity3()=[[1,0,0],[0,1,0],[0,0,1]];
function identity4()=[[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]];


function take3(v) = [v[0],v[1],v[2]];
function tail3(v) = [v[3],v[4],v[5]];
function rotation_part(m) = [take3(m[0]),take3(m[1]),take3(m[2])];
function rot_trace(m) = m[0][0] + m[1][1] + m[2][2];
function rot_cos_angle(m) = (rot_trace(m)-1)/2;

function rotation_part(m) = [take3(m[0]),take3(m[1]),take3(m[2])];
function translation_part(m) = [m[0][3],m[1][3],m[2][3]];
function transpose_3(m) = [[m[0][0],m[1][0],m[2][0]],[m[0][1],m[1][1],m[2][1]],[m[0][2],m[1][2],m[2][2]]];
function transpose_4(m) = [[m[0][0],m[1][0],m[2][0],m[3][0]],
                           [m[0][1],m[1][1],m[2][1],m[3][1]],
                           [m[0][2],m[1][2],m[2][2],m[3][2]],
                           [m[0][3],m[1][3],m[2][3],m[3][3]]];
function invert_rt(m) = construct_Rt(transpose_3(rotation_part(m)), -(transpose_3(rotation_part(m)) * translation_part(m)));
function construct_Rt(R,t) = [concat(R[0],t[0]),concat(R[1],t[1]),concat(R[2],t[2]),[0,0,0,1]];

// Hadamard product of n-dimensional arrays
function hadamard(a,b) = !(len(a)>0) ? a*b : [ for(i = [0:len(a)-1]) hadamard(a[i],b[i]) ];
// so3

// very minimal set of linalg functions needed by so3, se3 etc.

// cross and norm are builtins
//function cross(x,y) = [x[1]*y[2]-x[2]*y[1], x[2]*y[0]-x[0]*y[2], x[0]*y[1]-x[1]*y[0]];
//function norm(v) = sqrt(v*v);

function vec3(p) = len(p) < 3 ? concat(p,0) : p;
function vec4(p) = let (v3=vec3(p)) len(v3) < 4 ? concat(v3,1) : v3;
function unit(v) = v/norm(v);

function identity3()=[[1,0,0],[0,1,0],[0,0,1]];
function identity4()=[[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]];


function take3(v) = [v[0],v[1],v[2]];
function tail3(v) = [v[3],v[4],v[5]];
function rotation_part(m) = [take3(m[0]),take3(m[1]),take3(m[2])];
function rot_trace(m) = m[0][0] + m[1][1] + m[2][2];
function rot_cos_angle(m) = (rot_trace(m)-1)/2;

function rotation_part(m) = [take3(m[0]),take3(m[1]),take3(m[2])];
function translation_part(m) = [m[0][3],m[1][3],m[2][3]];
function transpose_3(m) = [[m[0][0],m[1][0],m[2][0]],[m[0][1],m[1][1],m[2][1]],[m[0][2],m[1][2],m[2][2]]];
function transpose_4(m) = [[m[0][0],m[1][0],m[2][0],m[3][0]],
                           [m[0][1],m[1][1],m[2][1],m[3][1]],
                           [m[0][2],m[1][2],m[2][2],m[3][2]],
                           [m[0][3],m[1][3],m[2][3],m[3][3]]];
function invert_rt(m) = construct_Rt(transpose_3(rotation_part(m)), -(transpose_3(rotation_part(m)) * translation_part(m)));
function construct_Rt(R,t) = [concat(R[0],t[0]),concat(R[1],t[1]),concat(R[2],t[2]),[0,0,0,1]];

// Hadamard product of n-dimensional arrays
function hadamard(a,b) = !(len(a)>0) ? a*b : [ for(i = [0:len(a)-1]) hadamard(a[i],b[i]) ];

function rodrigues_so3_exp(w, A, B) = [
[1.0 - B*(w[1]*w[1] + w[2]*w[2]), B*(w[0]*w[1]) - A*w[2],          B*(w[0]*w[2]) + A*w[1]],
[B*(w[0]*w[1]) + A*w[2],          1.0 - B*(w[0]*w[0] + w[2]*w[2]), B*(w[1]*w[2]) - A*w[0]],
[B*(w[0]*w[2]) - A*w[1],          B*(w[1]*w[2]) + A*w[0],          1.0 - B*(w[0]*w[0] + w[1]*w[1])]
];

function so3_exp(w) = so3_exp_rad(w/180*PI);
function so3_exp_rad(w) =
combine_so3_exp(w,
  w*w < 1e-8
  ? so3_exp_1(w*w)
  : w*w < 1e-6
    ? so3_exp_2(w*w)
    : so3_exp_3(w*w));

function combine_so3_exp(w,AB) = rodrigues_so3_exp(w,AB[0],AB[1]);

// Taylor series expansions close to 0
function so3_exp_1(theta_sq) = [
  1 - 1/6*theta_sq,
  0.5
];

function so3_exp_2(theta_sq) = [
  1.0 - theta_sq * (1.0 - theta_sq/20) / 6,
  0.5 - 0.25/6 * theta_sq
];

function so3_exp_3_0(theta_deg, inv_theta) = [
  sin(theta_deg) * inv_theta,
  (1 - cos(theta_deg)) * (inv_theta * inv_theta)
];

function so3_exp_3(theta_sq) = so3_exp_3_0(sqrt(theta_sq)*180/PI, 1/sqrt(theta_sq));


function rot_axis_part(m) = [m[2][1] - m[1][2], m[0][2] - m[2][0], m[1][0] - m[0][1]]*0.5;

function so3_ln(m) = 180/PI*so3_ln_rad(m);
function so3_ln_rad(m) = so3_ln_0(m,
  cos_angle = rot_cos_angle(m),
  preliminary_result = rot_axis_part(m));

function so3_ln_0(m, cos_angle, preliminary_result) =
so3_ln_1(m, cos_angle, preliminary_result,
  sin_angle_abs = sqrt(preliminary_result*preliminary_result));

function so3_ln_1(m, cos_angle, preliminary_result, sin_angle_abs) =
  cos_angle > sqrt(1/2)
  ? sin_angle_abs > 0
    ? preliminary_result * asin(sin_angle_abs)*PI/180 / sin_angle_abs
    : preliminary_result
  : cos_angle > -sqrt(1/2)
    ? preliminary_result * acos(cos_angle)*PI/180 / sin_angle_abs
    : so3_get_symmetric_part_rotation(
        preliminary_result,
        m,
        angle = PI - asin(sin_angle_abs)*PI/180,
        d0 = m[0][0] - cos_angle,
        d1 = m[1][1] - cos_angle,
        d2 = m[2][2] - cos_angle
      );

function so3_get_symmetric_part_rotation(preliminary_result, m, angle, d0, d1, d2) =
so3_get_symmetric_part_rotation_0(preliminary_result,angle,so3_largest_column(m, d0, d1, d2));

function so3_get_symmetric_part_rotation_0(preliminary_result, angle, c_max) =
  angle * unit(c_max * preliminary_result < 0 ? -c_max : c_max);

function so3_largest_column(m, d0, d1, d2) =
    d0*d0 > d1*d1 && d0*d0 > d2*d2
    ?  [d0, (m[1][0]+m[0][1])/2, (m[0][2]+m[2][0])/2]
    : d1*d1 > d2*d2
      ? [(m[1][0]+m[0][1])/2, d1, (m[2][1]+m[1][2])/2]
      : [(m[0][2]+m[2][0])/2, (m[2][1]+m[1][2])/2, d2];

__so3_test = [12,-125,110];
echo(UNITTEST_so3=norm(__so3_test-so3_ln(so3_exp(__so3_test))) < 1e-8);

function combine_se3_exp(w, ABt) = construct_Rt(rodrigues_so3_exp(w, ABt[0], ABt[1]), ABt[2]);

// [A,B,t]
function se3_exp_1(t,w) = concat(
  so3_exp_1(w*w),
  [t + 0.5 * cross(w,t)]
);

function se3_exp_2(t,w) = se3_exp_2_0(t,w,w*w);
function se3_exp_2_0(t,w,theta_sq) =
se3_exp_23(
  so3_exp_2(theta_sq),
  C = (1.0 - theta_sq/20) / 6,
  t=t,w=w);

function se3_exp_3(t,w) = se3_exp_3_0(t,w,sqrt(w*w)*180/PI,1/sqrt(w*w));

function se3_exp_3_0(t,w,theta_deg,inv_theta) =
se3_exp_23(
  so3_exp_3_0(theta_deg = theta_deg, inv_theta = inv_theta),
  C = (1 - sin(theta_deg) * inv_theta) * (inv_theta * inv_theta),
  t=t,w=w);

function se3_exp_23(AB,C,t,w) =
[AB[0], AB[1], t + AB[1] * cross(w,t) + C * cross(w,cross(w,t)) ];

function se3_exp(mu) = se3_exp_0(t=take3(mu),w=tail3(mu)/180*PI);

function se3_exp_0(t,w) =
combine_se3_exp(w,
// Evaluate by Taylor expansion when near 0
  w*w < 1e-8
  ? se3_exp_1(t,w)
  : w*w < 1e-6
    ? se3_exp_2(t,w)
    : se3_exp_3(t,w)
);

function se3_ln(m) = se3_ln_to_deg(se3_ln_rad(m));
function se3_ln_to_deg(v) = concat(take3(v),tail3(v)*180/PI);

function se3_ln_rad(m) = se3_ln_0(m,
  rot = so3_ln_rad(rotation_part(m)));
function se3_ln_0(m,rot) = se3_ln_1(m,rot,
  theta = sqrt(rot*rot));
function se3_ln_1(m,rot,theta) = se3_ln_2(m,rot,theta,
  shtot = theta > 0.00001 ? sin(theta/2*180/PI)/theta : 0.5,
  halfrotator = so3_exp_rad(rot * -.5));
function se3_ln_2(m,rot,theta,shtot,halfrotator) =
concat( (halfrotator * translation_part(m) -
  (theta > 0.001
  ? rot * ((translation_part(m) * rot) * (1-2*shtot) / (rot*rot))
  : rot * ((translation_part(m) * rot)/24)
  )) / (2 * shtot), rot);

__se3_test = [20,-40,60,-80,100,-120];
echo(UNITTEST_se3=norm(__se3_test-se3_ln(se3_exp(__se3_test))) < 1e-8);
// very minimal set of linalg functions needed by so3, se3 etc.

// cross and norm are builtins
//function cross(x,y) = [x[1]*y[2]-x[2]*y[1], x[2]*y[0]-x[0]*y[2], x[0]*y[1]-x[1]*y[0]];
//function norm(v) = sqrt(v*v);

function vec3(p) = len(p) < 3 ? concat(p,0) : p;
function vec4(p) = let (v3=vec3(p)) len(v3) < 4 ? concat(v3,1) : v3;
function unit(v) = v/norm(v);

function identity3()=[[1,0,0],[0,1,0],[0,0,1]];
function identity4()=[[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]];


function take3(v) = [v[0],v[1],v[2]];
function tail3(v) = [v[3],v[4],v[5]];
function rotation_part(m) = [take3(m[0]),take3(m[1]),take3(m[2])];
function rot_trace(m) = m[0][0] + m[1][1] + m[2][2];
function rot_cos_angle(m) = (rot_trace(m)-1)/2;

function rotation_part(m) = [take3(m[0]),take3(m[1]),take3(m[2])];
function translation_part(m) = [m[0][3],m[1][3],m[2][3]];
function transpose_3(m) = [[m[0][0],m[1][0],m[2][0]],[m[0][1],m[1][1],m[2][1]],[m[0][2],m[1][2],m[2][2]]];
function transpose_4(m) = [[m[0][0],m[1][0],m[2][0],m[3][0]],
                           [m[0][1],m[1][1],m[2][1],m[3][1]],
                           [m[0][2],m[1][2],m[2][2],m[3][2]],
                           [m[0][3],m[1][3],m[2][3],m[3][3]]];
function invert_rt(m) = construct_Rt(transpose_3(rotation_part(m)), -(transpose_3(rotation_part(m)) * translation_part(m)));
function construct_Rt(R,t) = [concat(R[0],t[0]),concat(R[1],t[1]),concat(R[2],t[2]),[0,0,0,1]];

// Hadamard product of n-dimensional arrays
function hadamard(a,b) = !(len(a)>0) ? a*b : [ for(i = [0:len(a)-1]) hadamard(a[i],b[i]) ];
// List helpers

/*!
  Flattens a list one level:

  flatten([[0,1],[2,3]]) => [0,1,2,3]
*/
function flatten(list) = [ for (i = list, v = i) v ];


/*!
  Creates a list from a range:

  range([0:2:6]) => [0,2,4,6]
*/
function range(r) = [ for(x=r) x ];

/*!
  Reverses a list:

  reverse([1,2,3]) => [3,2,1]
*/
function reverse(list) = [for (i = [len(list)-1:-1:0]) list[i]];

/*!
  Extracts a subarray from index begin (inclusive) to end (exclusive)
  FIXME: Change name to use list instead of array?

  subarray([1,2,3,4], 1, 2) => [2,3]
*/
function subarray(list,begin=0,end=-1) = [
    let(end = end < 0 ? len(list) : end)
      for (i = [begin : 1 : end-1])
        list[i]
];

/*!
  Returns a copy of a list with the element at index i set to x

  set([1,2,3,4], 2, 5) => [1,2,5,4]
*/
function set(list, i, x) = [for (i_=[0:len(list)-1]) i == i_ ? x : list[i_]];

/*!
  Remove element from the list by index.
  remove([4,3,2,1],1) => [4,2,1]
*/
function remove(list, i) = [for (i_=[0:1:len(list)-2]) list[i_ < i ? i_ : i_ + 1]];

/*!
  Creates a rotation matrix

  xyz = euler angles = rz * ry * rx
  axis = rotation_axis * rotation_angle
*/
function rotation(xyz=undef, axis=undef) =
  xyz != undef && axis != undef ? undef :
  xyz == undef  ? se3_exp([0,0,0,axis[0],axis[1],axis[2]]) :
  len(xyz) == undef ? rotation(axis=[0,0,xyz]) :
  (len(xyz) >= 3 ? rotation(axis=[0,0,xyz[2]]) : identity4()) *
  (len(xyz) >= 2 ? rotation(axis=[0,xyz[1],0]) : identity4()) *
  (len(xyz) >= 1 ? rotation(axis=[xyz[0],0,0]) : identity4());

/*!
  Creates a scaling matrix
*/
function scaling(v) = [
  [v[0],0,0,0],
  [0,v[1],0,0],
  [0,0,v[2],0],
  [0,0,0,1],
];

/*!
  Creates a translation matrix
*/
function translation(v) = [
  [1,0,0,v[0]],
  [0,1,0,v[1]],
  [0,0,1,v[2]],
  [0,0,0,1],
];

// Convert between cartesian and homogenous coordinates
function project(x) = subarray(x,end=len(x)-1) / x[len(x)-1];

function transform(m, list) = [for (p=list) project(m * vec4(p))];
function to_3d(list) = [ for(v = list) vec3(v) ];
// List helpers

/*!
  Flattens a list one level:

  flatten([[0,1],[2,3]]) => [0,1,2,3]
*/
function flatten(list) = [ for (i = list, v = i) v ];


/*!
  Creates a list from a range:

  range([0:2:6]) => [0,2,4,6]
*/
function range(r) = [ for(x=r) x ];

/*!
  Reverses a list:

  reverse([1,2,3]) => [3,2,1]
*/
function reverse(list) = [for (i = [len(list)-1:-1:0]) list[i]];

/*!
  Extracts a subarray from index begin (inclusive) to end (exclusive)
  FIXME: Change name to use list instead of array?

  subarray([1,2,3,4], 1, 2) => [2,3]
*/
function subarray(list,begin=0,end=-1) = [
    let(end = end < 0 ? len(list) : end)
      for (i = [begin : 1 : end-1])
        list[i]
];

/*!
  Returns a copy of a list with the element at index i set to x

  set([1,2,3,4], 2, 5) => [1,2,5,4]
*/
function set(list, i, x) = [for (i_=[0:len(list)-1]) i == i_ ? x : list[i_]];

/*!
  Remove element from the list by index.
  remove([4,3,2,1],1) => [4,2,1]
*/
function remove(list, i) = [for (i_=[0:1:len(list)-2]) list[i_ < i ? i_ : i_ + 1]];

// Skin a set of profiles with a polyhedral mesh
module skin(profiles, loop=false /* unimplemented */) {
  P = max_len(profiles);
  N = len(profiles);

  profiles = [
    for (p = profiles)
      for (pp = augment_profile(to_3d(p),P))
        pp
  ];

  function quad(i,P,o) = [[o+i, o+i+P, o+i%P+P+1], [o+i, o+i%P+P+1, o+i%P+1]];

  function profile_triangles(tindex) = [
    for (index = [0:P-1])
      let (qs = quad(index+1, P, P*(tindex-1)-1))
        for (q = qs) q
  ];

    triangles = [
    for(index = [1:N-1])
          for(t = profile_triangles(index))
        t
  ];

  start_cap = [range([0:P-1])];
  end_cap   = [range([P*N-1 : -1 : P*(N-1)])];

  polyhedron(convexity=2, points=profiles, faces=concat(start_cap, triangles, end_cap));
}

// Augments the profile with steiner points making the total number of vertices n
function augment_profile(profile, n) =
  subdivide(profile,insert_extra_vertices_0([profile_lengths(profile),dup(0,len(profile))],n-len(profile))[1]);

function subdivide(profile,subdivisions) = let (N=len(profile)) [
  for (i = [0:N-1])
    let(n = len(subdivisions)>0 ? subdivisions[i] : subdivisions)
      for (p = interpolate(profile[i],profile[(i+1)%N],n+1))
        p
];

function interpolate(a,b,subdivisions) = [
  for (index = [0:subdivisions-1])
    let(t = index/subdivisions)
      a*(1-t)+b*t
];

function distribute_extra_vertex(lengths_count,ma_=-1) = ma_<0 ? distribute_extra_vertex(lengths_count, max_element(lengths_count[0])) :
  concat([set(lengths_count[0],ma_,lengths_count[0][ma_] * (lengths_count[1][ma_]+1) / (lengths_count[1][ma_]+2))], [increment(lengths_count[1],max_element(lengths_count[0]),1)]);

function insert_extra_vertices_0(lengths_count,n_extra) = n_extra <= 0 ? lengths_count :
  insert_extra_vertices_0(distribute_extra_vertex(lengths_count),n_extra-1);

// Find the index of the maximum element of arr
function max_element(arr,ma_,ma_i_=-1,i_=0) = i_ >= len(arr) ? ma_i_ :
  i_ == 0 || arr[i_] > ma_ ? max_element(arr,arr[i_],i_,i_+1) : max_element(arr,ma_,ma_i_,i_+1);

function max_len(arr) = max([for (i=arr) len(i)]);

function increment(arr,i,x=1) = set(arr,i,arr[i]+x);

function profile_lengths(profile) = [
  for (i = [0:len(profile)-1])
    profile_segment_length(profile,i)
];

function profile_segment_length(profile,i) = norm(profile[(i+1)%len(profile)] - profile[i]);

// Generates an array with n copies of value (default 0)
function dup(value=0,n) = [for (i = [1:n]) value];

// key shape including dish. used as the ouside and inside shape in hollow_key(). allows for itself to be shrunk in depth and width / height
module shape(thickness_difference, depth_difference=0){
  dished(depth_difference, $inverted_dish) {
    color($primary_color) shape_hull(thickness_difference, depth_difference, $inverted_dish ? 200 : 0);
  }
}

module rounded_shape() {
  color($primary_color) minkowski(){
    // half minkowski in the z direction
    shape($minkowski_radius * 2, $minkowski_radius/2);
    minkowski_object();
  }
}

// minkowski places this object at every vertex of the other object then mashes
// it all together
module minkowski_object() {
  // alternative minkowski shape that needs the bottom of the keycap to be trimmed
  /* sphere(1); */

  difference(){
    sphere(r=$minkowski_radius, $fa=360/$minkowski_facets);
    translate([0,0,-$minkowski_radius]){
      cube($minkowski_radius * 2, center=true);
    }
  }
}

module envelope(depth_difference=0) {
  s = 1.5;
  hull(){
    cube([total_key_width() * s, total_key_height() * s, 0.01], center = true);
    top_placement(SMALLEST_POSSIBLE + depth_difference){
      cube([top_total_key_width() * s, top_total_key_height() * s, 0.01], center = true);
    }
  }
}

// for when you want to take the dish out of things
// used for adding the dish to the key shape and making sure stems don't stick out the top
// creates a bounding box 1.5 times larger in width and height than the keycap.
module dished(depth_difference = 0, inverted = false) {
  intersection() {
    children();
    difference(){
      union() {
        // envelope is needed to "fill in" the rest of the keycap
        envelope(depth_difference);
        if (inverted) top_placement(depth_difference) color($secondary_color) _dish(inverted);
      }
      if (!inverted) top_placement(depth_difference) color($secondary_color) _dish(inverted);
      /* %top_placement(depth_difference) _dish(); */
    }
  }
}

// just to DRY up the code
// TODO is putting special vars in function signatures legal
module _dish(inverted=$inverted_dish) {
  translate([$dish_offset_x,0,0]) color($secondary_color) 
  dish(top_total_key_width() + $dish_overdraw_width, top_total_key_height() + $dish_overdraw_height, $dish_depth, inverted);
}

// puts its children at each keystem position provided
module keystem_positions(positions) {
  for (connector_pos = positions) {
    translate(connector_pos) {
      rotate([0, 0, $stem_rotation]){
        children();
      }
    }
  }
}

module support_for(positions, stem_type) {
  keystem_positions(positions) {
    color($tertiary_color) supports($support_type, stem_type, $stem_throw, $total_depth - $stem_throw);
  }
}

module stems_for(positions, stem_type) {
  keystem_positions(positions) {
    color($tertiary_color) stem(stem_type, stem_height(), $stem_slop, $stem_throw);
    if ($stem_support_type != "disable") {
      color($quaternary_color) stem_support($stem_support_type, stem_type, $stem_support_height, $stem_slop);
    }
  }
}

// put something at the top of the key, with no adjustments for dishing
module top_placement(depth_difference=0) {
  top_tilt_by_height = -$top_tilt / $key_height;
  top_tilt_y_by_length = $double_sculpted ? (-$top_tilt_y / $key_length) : 0;

  // minkowski_height = $rounded_key ? $minkowski_radius : 0;

  translate([$top_skew_x + $dish_skew_x, $top_skew + $dish_skew_y, $total_depth - depth_difference]){
    rotate([top_tilt_by_height, top_tilt_y_by_length,0]){
      children();
    }
  }
}

// puts its children at the center of the dishing on the key, including dish height
// more user-friendly than top_placement
module top_of_key(){
  // if there is a dish, we need to account for how much it digs into the top
  dish_depth = ($dish_type == "disable") ? 0 : $dish_depth;
  // if the dish is inverted, we need to account for that too. in this case we do half, otherwise the children would be floating on top of the dish
  corrected_dish_depth = ($inverted_dish) ? -dish_depth / 2 : dish_depth;

  top_placement(corrected_dish_depth) {
    children();
  }
}

module front_of_key() {
  // all this math is to take top skew and tilt into account
  // we need to find the new effective height and depth of the top, front lip
  // of the keycap to find the angle so we can rotate things correctly into place
  total_depth_difference = sin(-$top_tilt) * (top_total_key_height()/2);
  total_height_difference = $top_skew + (1 - cos(-$top_tilt)) * (top_total_key_height()/2);

  angle = atan2(($total_depth - total_depth_difference), ($height_difference/2 + total_height_difference));
  hypotenuse = ($total_depth -total_depth_difference) / sin(angle);

  translate([0,-total_key_height()/2,0]) {
    rotate([-(90-angle), 0, 0]) {
      translate([0,0,hypotenuse/2]){
        children();
      }
    }
  }
}

module outer_shape() {
  if ($rounded_key == true) {
    rounded_shape();
  } else {
    shape(0, 0);
  }
}

module inner_shape(extra_wall_thickness = 0, extra_keytop_thickness = 0) {
  if ($inner_shape_type == "flat") {
    /* $key_shape_type="square"; */
    $height_slices = 1;
    // if inner_shape is flat, keytop_thickness will be dish_depth less than it should be, since the dish digs in that far.
    // so, we add dish_depth here
    color($primary_color) shape_hull($wall_thickness + extra_wall_thickness, $keytop_thickness + extra_keytop_thickness + $dish_depth, 0);
  } else {
    shape($wall_thickness + extra_wall_thickness, $keytop_thickness + extra_keytop_thickness);
  }
}

// additive objects at the top of the key
module additive_features(inset) {
  top_of_key() {
    if($key_bump) keybump($key_bump_depth, $key_bump_edge);
    if(!inset && $children > 0) color($secondary_color) children();
  }
  if($outset_legends) legends(0);
  // render the clearance check if it's enabled, but don't have it intersect with anything
  if ($clearance_check) %clearance_check();
}

// subtractive objects at the top of the key
module subtractive_features(inset) {
  top_of_key() {
    if (inset && $children > 0) color($secondary_color) children();
  }
  if(!$outset_legends) legends($inset_legend_depth);
  // subtract the clearance check if it's enabled, letting the user see the
  // parts of the keycap that will hit the cherry switch
  // this is a little confusing as it eats the stem too
  /* if ($clearance_check) clearance_check(); */
}

// features inside the key itself (stem, supports, etc)
module inside_features() {
  // Stems and stabilizers are not "inside features" unless they are fully
  // contained inside the cap. otherwise they'd be cut off when they are
  // differenced with the outside shape. this only matters if $stem_inset
  // is negative
  if ($stem_inset >= 0) stems_and_stabilizers();
  if ($support_type != "disable") translate([0, 0, $stem_inset]) support_for($stem_positions, $stem_type);
  if ($stabilizer_type != "disable") translate([0, 0, $stem_inset]) support_for($stabilizers, $stabilizer_type);
}

// all stems and stabilizers
module stems_and_stabilizers() {
  translate([0, 0, $stem_inset]) {
    if ($stabilizer_type != "disable") stems_for($stabilizers, $stabilizer_type);
    if ($stem_type != "disable") stems_for($stem_positions, $stem_type);
  }
}

// helpers for doubleshot keycaps for now
module inner_total_shape() {
  difference() {
    inner_shape();
    inside_features();
  }
}

module outer_total_shape(inset=false) {
  outer_shape();
  additive_features(inset) {
    children();
  };
}

// The final, penultimate key generation function.
// takes all the bits and glues them together. requires configuration with special variables.
module key(inset=false) {
  difference(){
    outer_total_shape(inset) {
      children();
    };

    if ($inner_shape_type != "disable") {
      translate([0,0,-SMALLEST_POSSIBLE]) {
        inner_total_shape();
      }
    }

    subtractive_features(inset) {
      children();
    };
  }

  // if $stem_inset is less than zero, we add the
  if ($stem_inset < 0) {
    stems_and_stabilizers();
  }
}

// actual full key with space carved out and keystem/stabilizer connectors
// this is an example key with all the fixins from settings.scad
module example_key(){
/* [Basic-Settings] */

// Length in units of key. A regular key is 1 unit; spacebar is usually 6.25
$key_length = 1.0; // Range not working in thingiverse customizer atm [1:0.25:16]

// What type of stem you want. Most people want Cherry.
$stem_type = "cherry";  // [cherry, alps, rounded_cherry, box_cherry, filled, disable]

// The stem is the hardest part to print, so this variable controls how much 'slop' there is in the stem
// if your keycaps stick in the switch raise this value
$stem_slop = 0.35; // Not working in thingiverse customizer atm [0:0.01:1]
// broke this out. if your keycaps are falling off lower this value. only works for cherry stems rn
$stem_inner_slop = 0.2;

// Font size used for text
$font_size = 6;

// Set this to true if you're making a spacebar!
$inverted_dish = false;

// change aggressiveness of double sculpting
// this is the radius of the cylinder the keytops are placed on
$double_sculpt_radius = 200;


// Support type. default is "flared" for easy FDM printing; bars are more realistic, and flat could be for artisans
$support_type = "flared"; // [flared, bars, flat, disable]

// Supports for the stem, as it often comes off during printing. Reccommended for most machines
$stem_support_type = "tines"; // [tines, brim, disabled]

// make legends outset instead of inset.
// broken off from artisan support since who wants outset legends?
$outset_legends = false;

/* [Key] */
// Height in units of key. should remain 1 for most uses
$key_height = 1.0;
// Keytop thickness, aka how many millimeters between the inside and outside of the top surface of the key
$keytop_thickness = 1;
// Wall thickness, aka the thickness of the sides of the keycap. note this is the total thickness, aka 3 = 1.5mm walls
$wall_thickness = 3;
// Radius of corners of keycap
$corner_radius = 1;
// Width of the very bottom of the key
$bottom_key_width = 18.16;
// Height (from the front) of the very bottom of the key
$bottom_key_height = 18.16;
// How much less width there is on the top. eg top_key_width = bottom_key_width - width_difference
$width_difference = 6;
// How much less height there is on the top
$height_difference = 4;
// How deep the key is, before adding a dish
$total_depth = 11.5;
// The tilt of the dish in degrees. divided by key height
$top_tilt = -6;
// the y tilt of the dish in degrees. divided by key width.
// for double axis sculpted keycaps and probably not much else
$top_tilt_y = 0;
// How skewed towards the back the top is (0 for center)
$top_skew = 1.7;

// how skewed towards the right the top is. unused, but implemented.
// for double axis sculpted keycaps and probably not much else
$top_skew_x = 0;

/* [Stem] */

// How far the throw distance of the switch is. determines how far the 'cross' in the cherry switch digs into the stem, and how long the keystem needs to be before supports can start. luckily, alps and cherries have a pretty similar throw. can modify to have stouter keycaps for low profile switches, etc
$stem_throw = 4;
// Diameter of the outside of the rounded cherry stem
$rounded_cherry_stem_d = 5.5;


// How much higher the stem is than the bottom of the keycap.
// Inset stem requires support but is more accurate in some profiles
// can be negative to make outset stems!
$stem_inset = 0;
// How many degrees to rotate the stems. useful for sideways keycaps, maybe
$stem_rotation = 0;

/* [Shape] */

// Key shape type, determines the shape of the key. default is 'rounded square'
$key_shape_type = "rounded_square";
// ISO enter needs to be linear extruded NOT from the center when not using skin. this tells the program how far up 'not from the center' is
$linear_extrude_height_adjustment = 0;
// How many slices will be made, to approximate curves on corners. Leave at 1 if you are not curving corners
// If you're doing fancy bowed keycap sides, this controls how many slices you take
$height_slices = 1;

/* [Dish] */

// What type of dish the key has. note that unlike stems and supports a dish ALWAYS gets rendered.
$dish_type = "cylindrical"; // [cylindrical, spherical, sideways cylindrical, old spherical, disable]
// How deep the dish 'digs' into the top of the keycap. this is max depth, so you can't find the height from total_depth - dish_depth. besides the top is skewed anyways
$dish_depth = 1;
// How skewed in the x direction the dish is
$dish_skew_x = 0;
// How skewed in the y direction (height) the dish is
$dish_skew_y = 0;


$dish_offset_x = 0;

// If you need the dish to extend further, you can 'overdraw' the rectangle it will hit. this was mostly for iso enter and should be deprecated
$dish_overdraw_width = 0;
// Same as width but for height
$dish_overdraw_height = 0;

/* [Misc] */
// There's a bevel on the cherry stems to aid insertion / guard against first layer squishing making a hard-to-fit stem.
$cherry_bevel = true;

// How tall in mm the stem support is, if there is any. stem support sits around the keystem and helps to secure it while printing.
$stem_support_height = .8;
// Font used for text
$font="DejaVu Sans Mono:style=Book";
// Whether or not to render fake keyswitches to check clearances
$clearance_check = false;
// Should be faster, also required for concave shapes

// what kind of extrusion we use to create the keycap. "hull" is standard, "linear extrude" is legacy, "skin" is new and not well supported.
$hull_shape_type = "hull"; // ["hull", "linear extrude", "skin"]

// This doesn't work very well, but you can try
$rounded_key = false;
//minkowski radius. radius of sphere used in minkowski sum for minkowski_key function. 1.75 for G20
$minkowski_radius = .33;

/* [Features] */

//insert locating bump
$key_bump = false;
//height of the location bump from the top surface of the key
$key_bump_depth = 0.5;
//distance to move the bump from the front edge of the key
$key_bump_edge = 0.4;

/* [Hidden] */

// set this to true if you are making double sculpted keycaps
$double_sculpted = false;

//list of legends to place on a key format: [text, halign, valign, size]
//halign = "left" or "center" or "right"
//valign = "top" or "center" or "bottom"
// Currently does not work with thingiverse customizer, and actually breaks it
$legends = [];

//list of front legends to place on a key format: [text, halign, valign, size]
//halign = "left" or "center" or "right"
//valign = "top" or "center" or "bottom"
// Currently does not work with thingiverse customizer, and actually breaks it
$front_legends = [];

// print legends on the front of the key instead of the top
$front_print_legends = false;

// how recessed inset legends / artisans are from the top of the key
$inset_legend_depth = 0.2;

// Dimensions of alps stem
$alps_stem = [4.45, 2.25];

// Dimensions of choc stem
$choc_stem = [1.2, 3];

// Enable stabilizer stems, to hold onto your cherry or costar stabilizers
$stabilizer_type = "costar_stabilizer"; // [costar_stabilizer, cherry_stabilizer, disable]

// Ternaries are ONLY for customizer. they will NOT work if you're using this in
// OpenSCAD. you should use stabilized(), openSCAD customizer,
// or set $stabilizers directly
// Array of positions of stabilizers
$stabilizers = $key_length >= 6 ? [[-50, 0], [50, 0]] : $key_length >= 2 ? [[-12,0],[12,0]] : [];

// Where the stems are in relation to the center of the keycap, in units. default is one in the center
// Shouldn't work in thingiverse customizer, though it has been...
$stem_positions = [[0,0]];

// colors
$primary_color = [.2667,.5882,1];
$secondary_color = [.4412, .7, .3784];
$tertiary_color = [1, .6941, .2];
$quaternary_color = [.4078, .3569, .749];
$warning_color = [1,0,0, 0.15];

// how many facets circles will have when used in these features
$minkowski_facets = 30;
$shape_facets =30;



// "flat" / "dished" / "disable"
$inner_shape_type = "flat";

// When sculpting sides using sculpted_square, how much in should the tops come
$side_sculpting_factor = 4.5;
// When sculpting corners, how much extra radius should be added
$corner_sculpting_factor = 1;
// When doing more side sculpting corners, how much extra radius should be added
$more_side_sculpting_factor = 0.4;

// 3d surface functions (still in beta)

// 3d surface settings
// unused for now
$3d_surface_size = 20;
// resolution in each axis. 10 = 10 divisions per x/y = 100 points total. 
// 5 = 20 divisions per x/y
$3d_surface_step = 1;

// monotonically increasing function that distributes the points of the surface mesh
// only for polar_3d_surface right now
// if it's linear it's a grid. sin(dim) * size concentrates detail around the edges
sinusoidal_surface_distribution = function(dim,size) sin(dim) * size;
linear_surface_distribution = function(dim,size) sin(dim) * size;

$surface_distribution_function = linear_surface_distribution;

// the function that actually determines what the surface is.
// feel free to override, the last one wins

// debug
// $surface_function = function(x,y) 1;
cylindrical_surface = function(x,y) (sin(acos(x/$3d_surface_size)));
spherical_surface = function(x,y) (1 - (x/$3d_surface_size)^2)^0.5 * (1 - (y/$3d_surface_size)^2)^0.5;
// looks a lot like mt3
quartic_surface = function(x,y) (1 - (x/$3d_surface_size)^4)^0.5 * (1 - (y/$3d_surface_size)^4)^0.5;
ripple_surface = function(x,y) cos((x^2+y^2)^0.5 * 50)/4 + 0.75; 
rosenbrocks_banana_surface = function(x,y) (pow(1-(x/$3d_surface_size))^2 + 100 * pow((y/$3d_surface_size)-(x/$3d_surface_size)^2)^2)/200 + 0.1;
spike_surface = function(x,y) 1/(((x/$3d_surface_size)^2+(y/$3d_surface_size)^2)^0.5) + .01;
random_surface = function(x,y) sin(rands(0,90,1,x+y)[0]);
bumps_surface = function(x,y) sin(20*x)*cos(20*y)/3+1;

$surface_function = bumps_surface; // bumps_surface;

// ripples
/* 
// Rosenbrock's banana
/* $
// y=x revolved around the y axis
/* $surface_function =  */
/* $surface_function =  */  key();
}

if (!$using_customizer) {
  example_key();
}

key_profile(key_profile, row) legend(legend) {
  key();
}
