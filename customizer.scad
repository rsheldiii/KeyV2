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
$keytop_thickness = 2;
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
$stem_inset = 0;
// How many degrees to rotate the stems. useful for sideways keycaps, maybe
$stem_rotation = 0;

// enable to have stem support extend past the keycap bottom, to (hopefully) the next
// keycap. only works on tines right now
$extra_long_stem_support = false;

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
// If you need the dish to extend further, you can 'overdraw' the rectangle it will hit
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
// Use linear_extrude instead of hull slices to make the shape of the key
$linear_extrude_shape = false;

// warns in trajectory.scad but it looks benign
// brand new, more correct, hopefully faster, lots more work
$skin_extrude_shape = false;
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

// 3d surface variables
// see functions.scad for the surface function
$3d_surface_size = 10;
$3d_surface_step = 1;
// normally the bottom of the keytop looks like the top - curved, at least
// underneath the support structure. This ensures there's a minimum thickness for the
// underside of the keycap, but it's a fair bit of geometry
$flat_keytop_bottom = true;

// how many facets circles will have when used in these features
$minkowski_facets = 30;
$shape_facets =30;

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

module 2u() {
  u(2) children();
}

module 2_25u() {
  u(2.25) children();
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
  $corner_radius = 0.25;

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
  // might wanna change this if you don't minkowski
  // do you even minkowski bro
  $corner_radius = 0.25;

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
// my own measurements
module hipro_row(row=3, column=0) {
  $key_shape_type = "sculpted_square";

  $bottom_key_width = 18.35;
  $bottom_key_height = 18.17;

  $width_difference = ($bottom_key_width - 12.3);
  $height_difference = ($bottom_key_height - 12.65);
  $dish_type = "spherical";
  $dish_depth = 0.75;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 0;
  $height_slices = 10;
  // might wanna change this if you don't minkowski
  // do you even minkowski bro
  $corner_radius = 0.25;

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
module grid_row(row=3, column = 0) {
  $bottom_key_width = 18.16;
  $bottom_key_height = 18.16;
  $width_difference = 0.2;
  $height_difference = 0.2;
  $top_tilt = 0;
  $top_skew = 0;
  $dish_type = "old spherical";
  // something weird is going on with this and legends - can't put it below 1.2 or they won't show
  $dish_depth = 1;
  $dish_skew_x = 0;
  $dish_skew_y = 0;

  $linear_extrude_shape = true;


  $dish_overdraw_width = -8;
  $dish_overdraw_height = -8;

  $minkowski_radius = 0.5;
  //also,
  /* $rounded_key = true; */

  $top_tilt_y = side_tilt(column);
  extra_height =  $double_sculpted ? extra_side_tilt_height(column) : 0;

  $total_depth = 6 + abs((row-3) * 0.5) + extra_height;

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

// man, wouldn't it be so cool if functions were first order
module key_profile(key_profile_type, row, column=0) {
  if (key_profile_type == "dcs") {
    dcs_row(row, column) children();
  } else if (key_profile_type == "oem") {
    oem_row(row, column) children();
  } else if (key_profile_type == "dsa") {
    dsa_row(row, column) children();
  } else if (key_profile_type == "sa") {
    sa_row(row, column) children();
  } else if (key_profile_type == "g20") {
    g20_row(row, column) children();
  } else if (key_profile_type == "hipro") {
    hipro_row(row, column) children();
  } else if (key_profile_type == "grid") {
    grid_row(row, column) children();
  } else if (key_profile_type == "disable") {
    children();
  } else {
    echo("Warning: unsupported key_profile_type");
  }
}
module spacebar() {
  $inverted_dish = true;
  $dish_type = "sideways cylindrical";
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

  $top_tilt = 0;
  $stem_support_type = "disable";
  $key_shape_type = "iso_enter";
  /* $linear_extrude_shape = true; */
  $linear_extrude_height_adjustment = 19.05 * 0.5;
  // this equals (unit_length(1.5) - unit_length(1.25)) / 2
  $dish_overdraw_width = 2.38125;


  stabilized(vertical=true) {
    children();
  }
}
// kind of a catch-all at this point for any directive that doesn't fit in the other files

//TODO duplicate def to not make this a special var. maybe not worth it
unit = 19.05;

module translate_u(x=0, y=0, z=0){
  translate([x * unit, y*unit, z*unit]) children();
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

module cherry(slop) {
  $stem_slop = slop ? slop : $stem_slop;
  $stem_type = "cherry";
  children();
}

module alps(slop) {
  $stem_slop = slop ? slop : $stem_slop;
  $stem_type = "alps";
  children();
}

module rounded_cherry(slop) {
  $stem_slop = slop ? slop : $stem_slop;
  $stem_type = "rounded_cherry";
  children();
}

module box_cherry(slop) {
  $stem_slop = slop ? slop : $stem_slop;
  $stem_type = "box_cherry";
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
  $key_shape_type = "flat_sided_square";
  $dish_overdraw_width = abs(extra_keytop_length_for_flat_sides());
  extra_y_rotation = atan2($width_difference/2,$total_depth);
  translate([0,0,cos(extra_y_rotation) * total_key_width()/2])
  rotate([0,90 + extra_y_rotation ,0]) children();
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
module arrows(profile, rows = [4,4,4,3]) {
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
SMALLEST_POSSIBLE = 1/128;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

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
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - (unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);
$fs=.1;
unit = 19.05;

// corollary is rounded_square
// NOT 3D
function unit_length(length) = unit * (length - 1) + 18.16;

module ISO_enter_shape(size, delta, progress){
  width = size[0];
  height = size[1];


  // in order to make the ISO keycap shape generic, we are going to express the
  // 'elbow point' in terms of ratios. an ISO enter is just a 1.5u key stuck on
  // top of a 1.25u key, but since our key_shape function doesnt understand that
  // and wants to pass just width and height, we make these ratios to know where
  // to put the elbow joint

  width_ratio = unit_length(1.25) / unit_length(1.5);
  height_ratio = unit_length(1) / unit_length(2);

  pointArray = [
      [                   0,                     0], // top right
      [                   0,               -height], // bottom right
      [-width * width_ratio,               -height], // bottom left
      [-width * width_ratio,-height * height_ratio], // inner middle point
      [              -width,-height * height_ratio], // outer middle point
      [              -width,                     0]  // top left
  ];

  minkowski(){
    circle(r=corner_size);
    // gives us rounded inner corner
    offset(r=-corner_size*2) {
      translate([(width * width_ratio)/2, height/2]) polygon(points=pointArray);
    }
  }
}

function iso_enter_vertices(width, height, width_ratio, height_ratio, wd, hd) = [
  [                   0-wd,                     0-hd], // top right
  [                   0-wd,               -height+hd], // bottom right
  [-width * width_ratio+wd,               -height+hd], // bottom left
  [-width * width_ratio+wd,-height * height_ratio+hd], // inner middle point
  [              -width+wd,-height * height_ratio+hd], // outer middle point
  [              -width+wd,                     0-hd]  // top left
] + [
  [(width * width_ratio)/2, height/2 ],
  [(width * width_ratio)/2, height/2 ],
  [(width * width_ratio)/2, height/2 ],
  [(width * width_ratio)/2, height/2 ],
  [(width * width_ratio)/2, height/2 ],
  [(width * width_ratio)/2, height/2 ]
];

// no rounding on the corners at all
function skin_iso_enter_shape(size, delta, progress, thickness_difference) =
  iso_enter_vertices(size.x, size.y, unit_length(1.25) / unit_length(1.5), unit_length(1) / unit_length(2), thickness_difference/2 + delta.x * progress/2, thickness_difference/2 + delta.y * progress/2);
function sign_x(i,n) =
	i < n/4 || i > n*3/4  ?  1 :
	i > n/4 && i < n*3/4  ? -1 :
	0;

function sign_y(i,n) =
	i > 0 && i < n/2  ?  1 :
	i > n/2 ? -1 :
	0;


function rectangle_profile(size=[1,1],fn=32) = [
	for (index = [0:fn-1])
		let(a = index/fn*360)
			sign_x(index, fn) * [size[0]/2,0]
			+ sign_y(index, fn) * [0,size[1]/2]
];

function rounded_rectangle_profile(size=[1,1],r=1,fn=32) = [
	let(max_fn = max(fn,8))
		for (index = [0:max_fn-1])
			let(a = index/max_fn*360)
				r * [cos(a), sin(a)]
				+ sign_x(index, max_fn) * [size[0]/2-r,0]
				+ sign_y(index, max_fn) * [0,size[1]/2-r]
];

function double_rounded_rectangle_profile(size=[1,1], r=1, fn=32) = [
	let(max_fn = max(fn,8))
		for (index = [0:max_fn-1])
			let(a = index/max_fn*360)
				r * [cos(a), sin(a)]
				+ sign_x(index, max_fn) * [size[0]/2-r,0]
				+ sign_y(index, max_fn) * [0,size[1]/2-r]
];

// rounded square shape with additional sculpting functions to better approximate

// When sculpting sides, how much in should the tops come
$side_sculpting_factor = 4.5;
// When sculpting corners, how much extra radius should be added
$corner_sculpting_factor = 1;
// When doing more side sculpting corners, how much extra radius should be added
$more_side_sculpting_factor = 0.4;


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

// fudging the hell out of this, I don't remember what the negative-offset-positive-offset was doing in the module above
// also no 'bowed' square shape for now
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
  ) double_rounded_rectangle_profile(square_size - [extra_corner_radius_this_slice, extra_corner_radius_this_slice]/4, fn=$shape_facets, r=extra_corner_radius_this_slice/1.5 + $more_side_sculpting_factor * progress);

  /* offset(r = extra_corner_radius_this_slice) {
    offset(r = -extra_corner_radius_this_slice) {
      side_rounded_square(square_size, r = $more_side_sculpting_factor * progress);
    }
  } */


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
function sign_x(i,n) =
	i < n/4 || i > n*3/4  ?  1 :
	i > n/4 && i < n*3/4  ? -1 :
	0;

function sign_y(i,n) =
	i > 0 && i < n/2  ?  1 :
	i > n/2 ? -1 :
	0;


function rectangle_profile(size=[1,1],fn=32) = [
	for (index = [0:fn-1])
		let(a = index/fn*360)
			sign_x(index, fn) * [size[0]/2,0]
			+ sign_y(index, fn) * [0,size[1]/2]
];

function rounded_rectangle_profile(size=[1,1],r=1,fn=32) = [
	let(max_fn = max(fn,8))
		for (index = [0:max_fn-1])
			let(a = index/max_fn*360)
				r * [cos(a), sin(a)]
				+ sign_x(index, max_fn) * [size[0]/2-r,0]
				+ sign_y(index, max_fn) * [0,size[1]/2-r]
];

function double_rounded_rectangle_profile(size=[1,1], r=1, fn=32) = [
	let(max_fn = max(fn,8))
		for (index = [0:max_fn-1])
			let(a = index/max_fn*360)
				r * [cos(a), sin(a)]
				+ sign_x(index, max_fn) * [size[0]/2-r,0]
				+ sign_y(index, max_fn) * [0,size[1]/2-r]
];

module rounded_square_shape(size, delta, progress, center = true) {
  offset(r=$corner_radius, $fa=360/$shape_facets){
    square_shape([size.x - $corner_radius*2, size.y - $corner_radius*2], delta, progress);
  }
}

// for skin

function skin_rounded_square(size, delta, progress, thickness_difference) =
  rounded_rectangle_profile(size - (delta * progress), fn=$shape_facets, r=$corner_radius);
SMALLEST_POSSIBLE = 1/128;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

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
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - (unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);
function sign_x(i,n) =
	i < n/4 || i > n*3/4  ?  1 :
	i > n/4 && i < n*3/4  ? -1 :
	0;

function sign_y(i,n) =
	i > 0 && i < n/2  ?  1 :
	i > n/2 ? -1 :
	0;


function rectangle_profile(size=[1,1],fn=32) = [
	for (index = [0:fn-1])
		let(a = index/fn*360)
			sign_x(index, fn) * [size[0]/2,0]
			+ sign_y(index, fn) * [0,size[1]/2]
];

function rounded_rectangle_profile(size=[1,1],r=1,fn=32) = [
	let(max_fn = max(fn,8))
		for (index = [0:max_fn-1])
			let(a = index/max_fn*360)
				r * [cos(a), sin(a)]
				+ sign_x(index, max_fn) * [size[0]/2-r,0]
				+ sign_y(index, max_fn) * [0,size[1]/2-r]
];

function double_rounded_rectangle_profile(size=[1,1], r=1, fn=32) = [
	let(max_fn = max(fn,8))
		for (index = [0:max_fn-1])
			let(a = index/max_fn*360)
				r * [cos(a), sin(a)]
				+ sign_x(index, max_fn) * [size[0]/2-r,0]
				+ sign_y(index, max_fn) * [0,size[1]/2-r]
];


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
  polygon(points=[
    [(-size.x + (delta.x + extra_keytop_length_for_flat_sides()) * progress)/2, (-size.y + delta.y * progress)/2],
    [(size.x - (delta.x + extra_keytop_length_for_flat_sides()) * progress)/2,(-size.y + delta.y * progress)/2],
    [(size.x - (delta.x - extra_keytop_length_for_flat_sides()) * progress)/2, (size.y - delta.y * progress)/2],
    [(-size.x + (delta.x - extra_keytop_length_for_flat_sides()) * progress)/2, (size.y - delta.y * progress)/2]
  ]);
}

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
  ) rectangle_profile(square_size, fn=36);
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
SMALLEST_POSSIBLE = 1/128;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

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
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - (unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// extra length to the vertical tine of the inside cherry cross
// splits the stem into halves - allows easier fitment
extra_vertical = 0.6;

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

module cherry_stem(depth, slop) {
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
SMALLEST_POSSIBLE = 1/128;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

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
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - (unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);
SMALLEST_POSSIBLE = 1/128;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

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
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - (unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// extra length to the vertical tine of the inside cherry cross
// splits the stem into halves - allows easier fitment
extra_vertical = 0.6;

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

module cherry_stem(depth, slop) {
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

module rounded_cherry_stem(depth, slop) {
  difference(){
    cylinder(d=$rounded_cherry_stem_d, h=depth);

    // inside cross
    // translation purely for aesthetic purposes, to get rid of that awful lattice
    inside_cherry_cross(slop);
  }
}
SMALLEST_POSSIBLE = 1/128;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

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
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - (unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);
SMALLEST_POSSIBLE = 1/128;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

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
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - (unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// extra length to the vertical tine of the inside cherry cross
// splits the stem into halves - allows easier fitment
extra_vertical = 0.6;

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

module cherry_stem(depth, slop) {
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

module box_cherry_stem(depth, slop) {
  difference(){
    // outside shape
    linear_extrude(height = depth) {
      offset(r=1){
        square(outer_box_cherry_stem(slop) - [2,2], center=true);
      }
    }

    // inside cross
    inside_cherry_cross(slop);
  }
}
module alps_stem(depth, has_brim, slop){
  linear_extrude(height=depth) {
    square($alps_stem, center = true);
  }
}
module filled_stem() {
  // I broke the crap out of this stem type due to the changes I made around how stems are differenced
  // now that we just take the dish out of stems in order to support stuff like
  // bare stem keycaps (and buckling spring eventually) we can't just make a
  // cube. shape() works but means that you certainly couldn't render this
  // stem without the presence of the entire library

  shape($wall_thickness);
}
SMALLEST_POSSIBLE = 1/128;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

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
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - (unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// extra length to the vertical tine of the inside cherry cross
// splits the stem into halves - allows easier fitment
extra_vertical = 0.6;

module inside_cherry_stabilizer_cross(slop) {
  // inside cross
  // translation purely for aesthetic purposes, to get rid of that awful lattice
  translate([0,0,-SMALLEST_POSSIBLE]) {
    linear_extrude(height = $stem_throw) {
      square(cherry_cross(slop, extra_vertical)[0], center=true);
      square(cherry_cross(slop, extra_vertical)[1], center=true);
    }
  }
}

module cherry_stabilizer_stem(depth, slop) {
  difference(){
    // outside shape
    linear_extrude(height = depth) {
      offset(r=1){
        square(outer_cherry_stabilizer_stem(slop) - [2,2], center=true);
      }
    }

    inside_cherry_stabilizer_cross(slop);
  }
}


//whole stem, alps or cherry, trimmed to fit
module stem(stem_type, depth, slop){
    if (stem_type == "alps") {
      alps_stem(depth, slop);
    } else if (stem_type == "cherry" || stem_type == "costar_stabilizer") {
      cherry_stem(depth, slop);
    } else if (stem_type == "rounded_cherry") {
      rounded_cherry_stem(depth, slop);
    } else if (stem_type == "box_cherry") {
      box_cherry_stem(depth, slop);
    } else if (stem_type == "filled") {
      filled_stem();
    } else if (stem_type == "cherry_stabilizer") {
      cherry_stabilizer_stem(depth, slop);
    } else if (stem_type == "disable") {
      children();
    } else {
      echo("Warning: unsupported $stem_type: ");
      echo(stem_type);
    }
}
SMALLEST_POSSIBLE = 1/128;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

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
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - (unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);
SMALLEST_POSSIBLE = 1/128;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

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
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - (unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// extra length to the vertical tine of the inside cherry cross
// splits the stem into halves - allows easier fitment
extra_vertical = 0.6;

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

module cherry_stem(depth, slop) {
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

      inside_cherry_cross(slop);
    }
  } else if (stem_type == "rounded_cherry") {
    difference() {
      cylinder(d=$rounded_cherry_stem_d * 2, h=stem_support_height);
      inside_cherry_cross(slop);
    }
  } else if (stem_type == "box_cherry") {
    difference() {
      linear_extrude(height = stem_support_height){
        offset(r=1){
          square(outer_box_cherry_stem(slop) + [2,2], center=true);
        }
      }

      inside_cherry_cross(slop);
    }
  } else if (stem_type == "cherry_stabilizer") {
    difference() {
      linear_extrude(height = stem_support_height){
        offset(r=1){
          square(outer_cherry_stabilizer_stem(slop) + [2,2], center=true);
        }
      }

      inside_cherry_cross(slop);
    }
  }
}
SMALLEST_POSSIBLE = 1/128;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

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
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - (unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);
SMALLEST_POSSIBLE = 1/128;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

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
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - (unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// extra length to the vertical tine of the inside cherry cross
// splits the stem into halves - allows easier fitment
extra_vertical = 0.6;

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

module cherry_stem(depth, slop) {
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

module centered_tines(stem_support_height) {
  if ($key_length < 2) {
    translate([0,0,$stem_support_height / 2]) {
      cube([total_key_width(), 0.5, $stem_support_height], center = true);
    }
  }

  translate([0,0,$stem_support_height / 2]) {
    cube([
      1,
      total_key_height(),
      $stem_support_height
    ],
    center = true);
  }
}

module tines_support(stem_type, stem_support_height, slop) {
  extra_height = $extra_long_stem_support ? ($unit - total_key_height()) + 0.1 : -$wall_thickness/4; // fudge
  extra_width = $extra_long_stem_support ? ($unit - total_key_width()) + 0.1 : -$wall_thickness/4;

  if (stem_type == "cherry" || stem_type == "costar_stabilizer") {
    difference () {
      union() {
        if ($key_length < 2) {
          translate([0,0,$stem_support_height / 2]) {
            cube([
              total_key_width() + extra_width*2,
              0.5,
              $stem_support_height
            ], center = true);
          }
        }

        // 2 vertical tines holding either side of the cruciform
        for (x = [1.15, -1.15]) {
          translate([x,0,$stem_support_height / 2]) {
            cube([
              0.5,
              total_key_height() + extra_height*2, // this is to extend past
              $stem_support_height
            ], center = true);
          }
        }
      }

      inside_cherry_cross(slop);
    }
  } else if (stem_type == "cherry_stabilizer") {
    difference () {
      for (x = [1.15, -1.15]) {
        translate([x,0,$stem_support_height / 2]) {
          cube([
            1,
            total_key_height($wall_thickness),
            $stem_support_height
          ], center = true);
        }
      }

      inside_cherry_stabilizer_cross(slop);
    }
  } else if (stem_type == "box_cherry") {
    difference () {
      centered_tines(stem_support_height);

      inside_cherry_cross(slop);
    }
  } else if (stem_type == "rounded_cherry") {
    difference () {
      centered_tines(stem_support_height);

      inside_cherry_cross(slop);
    }
  } else if (stem_type == "alps"){
    centered_tines(stem_support_height);
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
module flat_dish(width, height, depth, inverted){
  cube([width + 100,height + 100, depth], center=true);
}

//geodesic looks much better, but runs very slow for anything above a 2u
geodesic=false;

//dish selector
module  dish(width, height, depth, inverted) {
    if($dish_type == "cylindrical"){
      cylindrical_dish(width, height, depth, inverted);
    }
    else if ($dish_type == "spherical") {
      spherical_dish(width, height, depth, inverted);
    }
    else if ($dish_type == "sideways cylindrical"){
      sideways_cylindrical_dish(width, height, depth, inverted);
    }
    else if ($dish_type == "old spherical") {
      old_spherical_dish(width, height, depth, inverted);
    } else if ($dish_type == "flat") {
      flat_dish(width, height, depth, inverted);
    } else if ($dish_type == "disable") {
      // else no dish
    } else {
      echo("WARN: $dish_type unsupported");
    }
}
SMALLEST_POSSIBLE = 1/128;

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

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
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - (unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);
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
module keybump(depth = 0, edge_inset=0.4) {
  radius = 0.5;
  translate([0, -top_total_key_height()/2 + edge_inset, depth]){
        rotate([90,0,90]) cylinder($font_size, radius, radius, true);
        translate([0,0,-radius]) cube([$font_size, radius*2, radius*2], true);
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


/* [Hidden] */
SMALLEST_POSSIBLE = 1/128;
$fs = .1;
$unit = 19.05;

// key shape including dish. used as the ouside and inside shape in hollow_key(). allows for itself to be shrunk in depth and width / height
module shape(thickness_difference, depth_difference=0){
  dished(depth_difference, $inverted_dish) {
    color($primary_color) shape_hull(thickness_difference, depth_difference, $inverted_dish ? 2 : 0);
  }
}

// shape of the key but with soft, rounded edges. no longer includes dish
// randomly doesnt work sometimes
// the dish doesn't _quite_ reach as far as it should
module rounded_shape() {
  dished(-$minkowski_radius, $inverted_dish) {
    color($primary_color) minkowski(){
      // half minkowski in the z direction
      color($primary_color) shape_hull($minkowski_radius * 2, $minkowski_radius/2, $inverted_dish ? 2 : 0);
      /* cube($minkowski_radius); */
      sphere(r=$minkowski_radius, $fn=48);
    }
  }
  /* %envelope(); */
}

// this function is more correct, but takes _forever_
// the main difference is minkowski happens after dishing, meaning the dish is
// also minkowski'd
/* module rounded_shape() {
  color($primary_color) minkowski(){
    // half minkowski in the z direction
    shape($minkowski_radius * 2, $minkowski_radius/2);
    difference(){
      sphere(r=$minkowski_radius, $fn=20);
      translate([0,0,-$minkowski_radius]){
        cube($minkowski_radius * 2, center=true);
      }
    }
  }
} */



// basic key shape, no dish, no inside
// which is only used for dishing to cut the dish off correctly
// $height_difference used for keytop thickness
// extra_slices is a hack to make inverted dishes still work
module shape_hull(thickness_difference, depth_difference, extra_slices = 0){
  render() {
    if ($skin_extrude_shape) {
      skin_extrude_shape_hull(thickness_difference, depth_difference, extra_slices);
    } else if ($linear_extrude_shape) {
      linear_extrude_shape_hull(thickness_difference, depth_difference, extra_slices);
    } else {
      hull_shape_hull(thickness_difference, depth_difference, extra_slices);
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
          total_key_width(0),
          total_key_height(0),
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
          [total_key_width(thickness_difference), total_key_height(thickness_difference)],
          [$width_difference, $height_difference]
        );
      }
    }
  }
}

module hull_shape_hull(thickness_difference, depth_difference, extra_slices = 0) {
  for (index = [0:$height_slices - 1 + extra_slices]) {
    hull() {
      shape_slice(index / $height_slices, thickness_difference, depth_difference);
      shape_slice((index + 1) / $height_slices, thickness_difference, depth_difference);
    }
  }
}

module shape_slice(progress, thickness_difference, depth_difference) {
  skew_this_slice = $top_skew * progress;
  x_skew_this_slice = $top_skew_x * progress;

  depth_this_slice = ($total_depth - depth_difference) * progress;

  tilt_this_slice = -$top_tilt / $key_height * progress;
  y_tilt_this_slice = $double_sculpted ? (-$top_tilt_y / $key_length * progress) : 0;

  translate([x_skew_this_slice, skew_this_slice, depth_this_slice]) {
    rotate([tilt_this_slice,y_tilt_this_slice,0]){
      linear_extrude(height = SMALLEST_POSSIBLE){
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
  }
}

// for when you want something to only exist inside the keycap.
// used for the support structure
module inside() {
  intersection() {
    shape($wall_thickness, $keytop_thickness);
    children();
  }
}

// for when you want something to only exist outside the keycap
module outside() {
  difference() {
    children();
    shape($wall_thickness, $keytop_thickness);
  }
}

// put something at the top of the key, with no adjustments for dishing
module top_placement(depth_difference=0) {
  top_tilt_by_height = -$top_tilt / $key_height;
  top_tilt_y_by_length = $double_sculpted ? (-$top_tilt_y / $key_length) : 0;

  minkowski_height = $rounded_key ? $minkowski_radius : 0;

  translate([$top_skew_x + $dish_skew_x, $top_skew + $dish_skew_y, $total_depth - depth_difference + minkowski_height/2]){
    rotate([top_tilt_by_height, top_tilt_y_by_length,0]){
      children();
    }
  }
}

module front_placement() {
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

// just to DRY up the code
module _dish() {
  color($secondary_color) dish(top_total_key_width() + $dish_overdraw_width, top_total_key_height() + $dish_overdraw_height, $dish_depth, $inverted_dish);
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

// I think this is unused
module dished_for_show() {
  difference(){
    union() {
      envelope();
      if ($inverted_dish) top_placement(0) _dish();
    }
    if (!$inverted_dish) top_placement(0) _dish();
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
        envelope(depth_difference);
        if (inverted) top_placement(depth_difference) _dish();
      }
      if (!inverted) top_placement(depth_difference) _dish();
    }
  }
}

// puts it's children at the center of the dishing on the key, including dish height
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

module keytext(text, position, font_size, depth) {
  woffset = (top_total_key_width()/3.5) * position[0];
  hoffset = (top_total_key_height()/3.5) * -position[1];
  translate([woffset, hoffset, -depth]){
    color($tertiary_color) linear_extrude(height=$dish_depth){
      text(text=text, font=$font, size=font_size, halign="center", valign="center");
    }
  }
}

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
    color($tertiary_color) stem(stem_type, $total_depth, $stem_slop);
    if ($stem_support_type != "disable") {
      color($quaternary_color) stem_support($stem_support_type, stem_type, $stem_support_height, $stem_slop);
    }
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

module legends(depth=0) {
  if (len($front_legends) > 0) {
    front_placement() {
      if (len($front_legends) > 0) {
        for (i=[0:len($front_legends)-1]) {
          rotate([90,0,0]) keytext($front_legends[i][0], $front_legends[i][1], $front_legends[i][2], depth);
  		  }
	    }
    }
  }
  if (len($legends) > 0) {
    top_of_key() {
      // outset legend
      if (len($legends) > 0) {
        for (i=[0:len($legends)-1]) {
          keytext($legends[i][0], $legends[i][1], $legends[i][2], depth);
        }
      }
    }
  }
}

// legends / artisan support
module artisan(depth) {
  top_of_key() {
    // artisan objects / outset shape legends
    color($secondary_color) children();
  }
}

// key with hollowed inside but no stem
module hollow_key() {
  difference(){
    if ($rounded_key) {
      rounded_shape();
    } else {
      shape(0, 0);
    }
    // translation purely for aesthetic purposes, to get rid of that awful lattice
    translate([0,0,-SMALLEST_POSSIBLE]) {
      shape($wall_thickness, $keytop_thickness);
    }
  }
}


// The final, penultimate key generation function.
// takes all the bits and glues them together. requires configuration with special variables.
module key(inset = false) {
  difference() {
    union(){
      // the shape of the key, inside and out
      hollow_key();
      if($key_bump) top_of_key() keybump($key_bump_depth, $key_bump_edge);
      // additive objects at the top of the key
      // outside() makes them stay out of the inside. it's a bad name
      if(!inset && $children > 0) outside() artisan(0) children();
      if($outset_legends) legends(0);
      // render the clearance check if it's enabled, but don't have it intersect with anything
      if ($clearance_check) %clearance_check();
    }

    // subtractive objects at the top of the key
    // no outside() - I can't think of a use for it. will save render time
    if (inset && $children > 0) artisan($inset_legend_depth) children();
    if(!$outset_legends) legends($inset_legend_depth);
    // subtract the clearance check if it's enabled, letting the user see the
    // parts of the keycap that will hit the cherry switch
    if ($clearance_check) %clearance_check();
  }

  // both stem and support are optional
  if ($stem_type != "disable" || ($stabilizers != [] && $stabilizer_type != "disable")) {
    dished($keytop_thickness, $inverted_dish) {
      translate([0, 0, $stem_inset]) {
        if ($stabilizer_type != "disable") stems_for($stabilizers, $stabilizer_type);

        if ($stem_type != "disable") stems_for($stem_positions, $stem_type);
      }
    }
  }

  if ($support_type != "disable"){
    inside() {
      translate([0, 0, $stem_inset]) {
        if ($stabilizer_type != "disable") support_for($stabilizers, $stabilizer_type);

        // always render stem support even if there isn't a stem.
        // rendering flat support w/no stem is much more common than a hollow keycap
        // so if you want a hollow keycap you'll have to turn support off entirely
        support_for($stem_positions, $stem_type);
      }
    }
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
$keytop_thickness = 2;
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
$stem_inset = 0;
// How many degrees to rotate the stems. useful for sideways keycaps, maybe
$stem_rotation = 0;

// enable to have stem support extend past the keycap bottom, to (hopefully) the next
// keycap. only works on tines right now
$extra_long_stem_support = false;

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
// If you need the dish to extend further, you can 'overdraw' the rectangle it will hit
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
// Use linear_extrude instead of hull slices to make the shape of the key
$linear_extrude_shape = false;

// warns in trajectory.scad but it looks benign
// brand new, more correct, hopefully faster, lots more work
$skin_extrude_shape = false;
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

// 3d surface variables
// see functions.scad for the surface function
$3d_surface_size = 10;
$3d_surface_step = 1;
// normally the bottom of the keytop looks like the top - curved, at least
// underneath the support structure. This ensures there's a minimum thickness for the
// underside of the keycap, but it's a fair bit of geometry
$flat_keytop_bottom = true;

// how many facets circles will have when used in these features
$minkowski_facets = 30;
$shape_facets =30;
  key();
}

if (!$using_customizer) {
  example_key();
}

key_profile(key_profile, row) legend(legend) {
  key();
}
