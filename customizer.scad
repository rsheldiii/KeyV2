// entry point for customizer script. This probably isn't useful to most people,
// as it's just a wrapper that helps generate customizer.scad for thingiverse.

/* [Basic-Settings] */

// what preset profile do you wish to use? disable if you are going to set paramters below
key_profile = "dcs"; // [dcs, oem, dsa, sa, g20, disable]
// what key profile row is this keycap on? 0 for disable
row = 1; // [5,1,2,3,4,0]

// What does the top of your key say?
legend = "";

/* [Basic-Settings] */

// Length in units of key. A regular key is 1 unit; spacebar is usually 6.25
$key_length = 1.0; // Range not working in thingiverse customizer atm [1:0.25:16]

// What type of stem you want. Most people want Cherry.
$stem_type = "cherry";  // [cherry, alps, rounded_cherry, box_cherry, filled, disable]

// The stem is the hardest part to print, so this variable controls how much 'slop' there is in the stem
$stem_slop = 0.3; // Not working in thingiverse customizer atm [0:0.01:1]

// Font size used for text
$font_size = 6;

// Set this to true if you're making a spacebar!
$inverted_dish = false;


// Support type. default is "flared" for easy FDM printing; bars are more realistic, and flat could be for artisans
$support_type = "flared"; // [flared, bars, flat, disable]

// Supports for the stem, as it often comes off during printing. disabled by default, but highly reccommended.
$stem_support_type = "disable"; // [tines, brim, disabled]

/* [Advanced] */

/* Key */
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
// How skewed towards the back the top is (0 for center)
$top_skew = 1.7;

/* Stem */

// How far the throw distance of the switch is. determines how far the 'cross' in the cherry switch digs into the stem, and how long the keystem needs to be before supports can start. luckily, alps and cherries have a pretty similar throw. can modify to have stouter keycaps for low profile switches, etc
$stem_throw = 4;
// Diameter of the outside of the rounded cherry stem
$rounded_cherry_stem_d = 5.5;


// How much higher the stem is than the bottom of the keycap.
// Inset stem requires support but is more accurate in some profiles
$stem_inset = 0;
// How many degrees to rotate the stems. useful for sideways keycaps, maybe
$stem_rotation = 0;

/* Shape */

// Key shape type, determines the shape of the key. default is 'rounded square'
$key_shape_type = "rounded_square";
// ISO enter needs to be linear extruded NOT from the center. this tells the program how far up 'not from the center' is
$linear_extrude_height_adjustment = 0;
// How many slices will be made, to approximate curves on corners. Leave at 1 if you are not curving corners
// If you're doing fancy bowed keycap sides, this controls how many slices you take
$height_slices = 1;

/* Dish */

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

/* Misc */
// There's a bevel on the cherry stems to aid insertion / guard against first layer squishing making a hard-to-fit stem.
$cherry_bevel = true;

// How tall in mm the stem support is, if there is any. stem support sits around the keystem and helps to secure it while printing.
$stem_support_height = 0.4;
// Font used for text
$font="DejaVu Sans Mono:style=Book";
// Whether or not to render fake keyswitches to check clearances
$clearance_check = false;
// Use linear_extrude instead of hull slices to make the shape of the key
// Should be faster, also required for concave shapes
$linear_extrude_shape = false;
//should the key be rounded? unnecessary for most printers, and very slow
$rounded_key = false;
//minkowski radius. radius of sphere used in minkowski sum for minkowski_key function. 1.75 for G20
$minkowski_radius = .33;

/* Features */

//insert locating bump
$key_bump = false;
//height of the location bump from the top surface of the key
$key_bump_depth = 0.5;
//distance to move the bump from the front edge of the key
$key_bump_edge = 0.4;

/* [Hidden] */

//list of legends to place on a key format: [text, halign, valign, size]
//halign = "left" or "center" or "right"
//valign = "top" or "center" or "bottom"
// Currently does not work with thingiverse customizer, and actually breaks it
$legends = [];

// Dimensions of alps stem
$alps_stem = [4.45, 2.25];

// Enable stabilizers. If you don't want stabilizers use disable; most other keycaps use Cherry stabilizers
$stabilizer_type = "cherry"; // [cherry, rounded_cherry, alps, disable]

// Ternaries are ONLY for customizer. they will NOT work if you're using this in
// OpenSCAD. you should use stabilized(), openSCAD customizer,
// or set $stabilizers directly
// Array of positions of stabilizers
$stabilizers = $key_length >= 6 ? [[-50, 0], [50, 0]] : $key_length >= 2 ? [[-12,0],[12,0]] : [];

// Where the stems are in relation to the center of the keycap, in units. default is one in the center
// Shouldn't work in thingiverse customizer, though it has been...
$stem_positions = [[0,0]];

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
module dcs_row(n=1) {
  // names, so I don't go crazy
  $bottom_key_width = 18.16;
  $bottom_key_height = 18.16;
  $width_difference = 6;
  $height_difference = 4;
  $dish_type = "cylindrical";
  $dish_depth = 1;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 1.75;

  if (n == 5) {
    $total_depth = 11.5;
    $top_tilt = -6;
    children();
  } else if (n == 1) {
    $total_depth = 8.5;
    $top_tilt = -1;
    children();
  } else if (n == 2) {
    $total_depth = 7.5;
    $top_tilt = 3;
    children();
  } else if (n == 3) {
    $total_depth = 6;
    $top_tilt = 7;
    children();
  } else if (n == 4) {
    $total_depth = 6;
    $top_tilt = 16;
    children();
  } else {
    children();
  }
}
module oem_row(n=1) {
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

  if (n == 5) {
    $total_depth = 11.2;
    $top_tilt = -3;
    children();
  } else if (n == 1) {
    $total_depth = 9.45;
    $top_tilt = 1;
    children();
  } else if (n == 2) {
    $total_depth = 9;
    $top_tilt = 6;
    children();
  } else if (n == 3) {
    $total_depth = 9.25;
    $top_tilt = 9;
    children();
  } else if (n == 4) {
    $total_depth = 9.25;
    $top_tilt = 10;
    children();
  } else {
    children();
  }
}
module dsa_row(n=3) {
  $key_shape_type = "sculpted_square";
  $bottom_key_width = 18.24; // 18.4;
  $bottom_key_height = 18.24; // 18.4;
  $width_difference = 6; // 5.7;
  $height_difference = 6; // 5.7;
  $top_tilt = n == 5 ? -21 : (n-3) * 7;
  $top_skew = 0;
  $dish_type = "spherical";
  $dish_depth = 1.2;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $height_slices = 10;
  $enable_side_sculpting = true;
  // might wanna change this if you don't minkowski
  // do you even minkowski bro
  $corner_radius = 0.25;

  depth_raisers = [0, 3.5, 1, 0, 1, 3];
  if (n == 5) {
    $total_depth = 8.1 + depth_raisers[n];
    children();
  } else if (n == 1) {
    $total_depth = 8.1 + depth_raisers[n];
    children();
  } else if (n == 2) {
    $total_depth = 8.1 + depth_raisers[n];
    children();
  } else if (n == 3) {
    $total_depth = 8.1 + depth_raisers[n];
    children();
  } else if (n == 4) {
    $total_depth = 8.1 + depth_raisers[n];
    children();
  } else {
    children();
  }
}
module sa_row(n=1) {
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
  // 5th row is usually unsculpted or the same as the row below it
  // making a super-sculpted top row (or bottom row!) would be real easy
  // bottom row would just be 13 tilt and 14.89 total depth
  // top row would be something new entirely - 18 tilt maybe?
  if (n == 1 || n == 5){
    $total_depth = 14.89;
    $top_tilt = -13;
    children();
  } else if (n == 2) {
    $total_depth = 12.925;
    $top_tilt = -7;
    children();
  } else if (n == 3 || n == 5) {
    $total_depth = 12.5;
    $top_tilt = 0;
    children();
  } else if (n == 4){
    $total_depth = 12.925;
    $top_tilt = 7;
    children();
  } else {
    children();
  }
}
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

// man, wouldn't it be so cool if functions were first order
module key_profile(key_profile_type, row) {
  if (key_profile_type == "dcs") {
    dcs_row(row) children();
  } else if (key_profile_type == "oem") {
    oem_row(row) children();
  } else if (key_profile_type == "dsa") {
    dsa_row(row) children();
  } else if (key_profile_type == "sa") {
    sa_row(row) children();
  } else if (key_profile_type == "g20") {
    g20_row(row) children();
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
  $key_shape_type = "iso_enter";
  $linear_extrude_shape = true;
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

module stabilized(mm=12, vertical = false, type="cherry") {
  if (vertical) {
    $stabilizer_type = type;
    $stabilizers = [
    [0,  mm],
    [0, -mm]
    ];

    children();
  } else {
    $stabilizer_type = type;
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

module bump(depth=undef) {
    $key_bump = true;
    $key_bump_depth = depth == undef ? $key_bump_depth : depth;
    children();
}

module row_profile(profile, unsculpted = false) {
  rows = [5, 1, 2, 3, 4];
  for(row = [0:len(rows)-1]) {
    translate_u(0, -row) key_profile(profile, unsculpted ? 3 : rows[row]);
  }
}

// files
// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.15 + slop / 3],
  // vertical tine
  [1.25 + slop / 3, 4.23 + extra_vertical + slop / 3 + .005],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;
$fs=.1;
unit = 19.05;

// corollary is rounded_square
// NOT 3D
module ISO_enter_shape(size, delta, progress){
  width = size[0];
  height = size[1];
  function unit_length(length) = unit * (length - 1) + 18.16;


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

  offset(r = extra_corner_radius_this_slice) {
    offset(r = -extra_corner_radius_this_slice) {
      side_rounded_square(square_size, r = $more_side_sculpting_factor * progress);
    }
  }
}

module side_rounded_square(size, r) {
    iw = size.x - 2 * r;
    ih = size.y - 2 * r;
    resolution = 100;
    sr = r / resolution * 2;
    sh = ih / resolution;
    sw = iw / resolution;
    union() {
        translate([-iw/2, 0]) scale([sr, sh]) circle(d = resolution);
        translate([iw/2, 0]) scale([sr, sh]) circle(d = resolution);
        translate([0, -ih/2]) scale([sw, sr]) circle(d = resolution);
        translate([0, ih/2]) scale([sw, sr]) circle(d = resolution);
        square([iw, ih], center=true);
    }
}
module rounded_square_shape(size, delta, progress, center = true) {
    width = size[0];
    height = size[1];

    width_difference = delta[0];
    height_difference = delta[1];

    // computed values for this slice
    extra_width_this_slice = (width_difference) * progress;
    extra_height_this_slice = (height_difference) * progress;
    extra_corner_radius_this_slice = ($corner_radius);

    offset(r=extra_corner_radius_this_slice){
      square(
        [
          width - extra_width_this_slice - extra_corner_radius_this_slice * 2,
          height - extra_height_this_slice - extra_corner_radius_this_slice * 2
        ],
        center=center
      );
    }
}
module square_shape(size, delta, progress){
  square(size - delta * progress, center = true);
}
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

module key_shape(size, delta, progress = 0) {
  if ($key_shape_type == "iso_enter") {
    ISO_enter_shape(size, delta, progress);
  } else if ($key_shape_type == "sculpted_square") {
    sculpted_square_shape(size, delta, progress);
  } else if ($key_shape_type == "rounded_square") {
    rounded_square_shape(size, delta, progress);
  } else if ($key_shape_type == "square") {
    square_shape(size, delta, progress);
  } else if ($key_shape_type == "oblong") {
    oblong_shape(size, delta, progress);
  } else {
    echo("Warning: unsupported $key_shape_type");
  }
}
// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.15 + slop / 3],
  // vertical tine
  [1.25 + slop / 3, 4.23 + extra_vertical + slop / 3 + .005],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

// extra length to the vertical tine of the inside cherry cross
// splits the stem into halves - allows easier fitment
extra_vertical = 0.6;

module inside_cherry_cross(slop) {
  // inside cross
  // translation purely for aesthetic purposes, to get rid of that awful lattice
  translate([0,0,-0.005]) {
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

    inside_cherry_cross(slop);
  }
}
// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.15 + slop / 3],
  // vertical tine
  [1.25 + slop / 3, 4.23 + extra_vertical + slop / 3 + .005],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;
// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.15 + slop / 3],
  // vertical tine
  [1.25 + slop / 3, 4.23 + extra_vertical + slop / 3 + .005],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

// extra length to the vertical tine of the inside cherry cross
// splits the stem into halves - allows easier fitment
extra_vertical = 0.6;

module inside_cherry_cross(slop) {
  // inside cross
  // translation purely for aesthetic purposes, to get rid of that awful lattice
  translate([0,0,-0.005]) {
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

    inside_cherry_cross(slop);
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
// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.15 + slop / 3],
  // vertical tine
  [1.25 + slop / 3, 4.23 + extra_vertical + slop / 3 + .005],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;
// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.15 + slop / 3],
  // vertical tine
  [1.25 + slop / 3, 4.23 + extra_vertical + slop / 3 + .005],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

// extra length to the vertical tine of the inside cherry cross
// splits the stem into halves - allows easier fitment
extra_vertical = 0.6;

module inside_cherry_cross(slop) {
  // inside cross
  // translation purely for aesthetic purposes, to get rid of that awful lattice
  translate([0,0,-0.005]) {
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

    inside_cherry_cross(slop);
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


//whole stem, alps or cherry, trimmed to fit
module stem(stem_type, depth, slop){
    if (stem_type == "alps") {
      alps_stem(depth, slop);
    } else if (stem_type == "cherry") {
      cherry_stem(depth, slop);
    } else if (stem_type == "rounded_cherry") {
      rounded_cherry_stem(depth, slop);
    } else if (stem_type == "box_cherry") {
      box_cherry_stem(depth, slop);
    } else if (stem_type == "filled") {
      filled_stem();
    } else if (stem_type == "disable") {
      children();
    } else {
      echo("Warning: unsupported $stem_type");
    }
}
// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.15 + slop / 3],
  // vertical tine
  [1.25 + slop / 3, 4.23 + extra_vertical + slop / 3 + .005],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;
// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.15 + slop / 3],
  // vertical tine
  [1.25 + slop / 3, 4.23 + extra_vertical + slop / 3 + .005],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

// extra length to the vertical tine of the inside cherry cross
// splits the stem into halves - allows easier fitment
extra_vertical = 0.6;

module inside_cherry_cross(slop) {
  // inside cross
  // translation purely for aesthetic purposes, to get rid of that awful lattice
  translate([0,0,-0.005]) {
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

    inside_cherry_cross(slop);
  }
}

module brim_support(stem_type, stem_support_height, slop) {
  if(stem_type == "alps") {
    linear_extrude(height=stem_support_height) {
      offset(r=1){
        square($alps_stem + [2,2], center=true);
      }
    }
  } else if (stem_type == "cherry") {
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
  }
}
// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.15 + slop / 3],
  // vertical tine
  [1.25 + slop / 3, 4.23 + extra_vertical + slop / 3 + .005],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;
// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.15 + slop / 3],
  // vertical tine
  [1.25 + slop / 3, 4.23 + extra_vertical + slop / 3 + .005],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

// extra length to the vertical tine of the inside cherry cross
// splits the stem into halves - allows easier fitment
extra_vertical = 0.6;

module inside_cherry_cross(slop) {
  // inside cross
  // translation purely for aesthetic purposes, to get rid of that awful lattice
  translate([0,0,-0.005]) {
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

    inside_cherry_cross(slop);
  }
}

module centered_tines(stem_support_height) {
  translate([0,0,$stem_support_height / 2]) cube([total_key_width($wall_thickness), 1, $stem_support_height], center = true);
  translate([0,0,$stem_support_height / 2]) cube([1, total_key_height($wall_thickness), $stem_support_height], center = true);
}

module tines_support(stem_type, stem_support_height, slop) {
  if (stem_type == "cherry") {
    difference () {
      union() {
        translate([0,0,$stem_support_height / 2]) cube([total_key_width($wall_thickness), 1, $stem_support_height], center = true);
        translate([2,0,$stem_support_height / 2]) cube([1, total_key_height($wall_thickness), $stem_support_height], center = true);
        translate([-2,0,$stem_support_height / 2]) cube([1, total_key_height($wall_thickness), $stem_support_height], center = true);
      }

      inside_cherry_cross(slop);
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
    } else if ($dish_type == "disable") {
      // else no dish
    } else {
      echo("WARN: $dish_type unsupported");
    }
}
// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.15 + slop / 3],
  // vertical tine
  [1.25 + slop / 3, 4.23 + extra_vertical + slop / 3 + .005],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

// figures out the scale factor needed to make a 45 degree wall
function scale_for_45(height, starting_size) = (height * 2 + starting_size) / starting_size;

// complicated since we want the different stems to work well
// also kind of messy... oh well
module flared(stem_type, loft, height) {
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


/* [Hidden] */
$fs = .1;
$unit = 19.05;
blue = [.2667,.5882,1];
color2 = [.5412, .4784, 1];
purple = [.4078, .3569, .749];
yellow = [1, .6941, .2];
transparent_red = [1,0,0, 0.15];

// key shape including dish. used as the ouside and inside shape in keytop(). allows for itself to be shrunk in depth and width / height
module shape(thickness_difference, depth_difference){
  dished(depth_difference, $inverted_dish) {
    color(blue) shape_hull(thickness_difference, depth_difference, 2);
  }
}

// shape of the key but with soft, rounded edges. much more realistic, MUCH more complex. orders of magnitude more complex
module rounded_shape() {
  color(blue) minkowski(){
    // half minkowski in the z direction
    shape($minkowski_radius * 2, $minkowski_radius/2);
    difference(){
      sphere(r=$minkowski_radius, $fn=20);
      translate([0,0,-$minkowski_radius]){
        cube($minkowski_radius * 2, center=true);
      }
    }
  }
}


// basic key shape, no dish, no inside
// which is only used for dishing to cut the dish off correctly
// $height_difference used for keytop thickness
// extra_slices is a hack to make inverted dishes still work
module shape_hull(thickness_difference, depth_difference, extra_slices = 0){
  render() {
    if ($linear_extrude_shape) {
      linear_extrude_shape_hull(thickness_difference, depth_difference, extra_slices);
    } else {
      hull_shape_hull(thickness_difference, depth_difference, extra_slices);
    }
  }
}

// corollary is hull_shape_hull
// extra_slices unused, only to match argument signatures
module linear_extrude_shape_hull(thickness_difference, depth_difference, extra_slices = 0){
  height = $total_depth - depth_difference;
  width_scale = top_total_key_width() / total_key_width();
  height_scale = top_total_key_height() / total_key_height();

  translate([0,$linear_extrude_height_adjustment,0]){
    linear_extrude(height = height, scale = [width_scale, height_scale]) {
        translate([0,-$linear_extrude_height_adjustment,0]){
        key_shape(total_key_width(thickness_difference), total_key_height(thickness_difference));
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
  depth_this_slice = ($total_depth - depth_difference) * progress;
  tilt_this_slice = -$top_tilt / $key_height * progress;

  translate([0, skew_this_slice, depth_this_slice]) {
    rotate([tilt_this_slice,0,0]){
      linear_extrude(height = 0.001){
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

// put something at the top of the key, with no adjustments for dishing
module top_placement(depth_difference) {
  translate([$dish_skew_x, $top_skew + $dish_skew_y, $total_depth - depth_difference]){
    rotate([-$top_tilt / $key_height,0,0]){
      children();
    }
  }
}

// just to DRY up the code
module _dish() {
  dish(top_total_key_width() + $dish_overdraw_width, top_total_key_height() + $dish_overdraw_height, $dish_depth, $inverted_dish);
}

module envelope(depth_difference) {
  s = 1.5;
  hull(){
    cube([total_key_width() * s, total_key_height() * s, 0.01], center = true);
    top_placement(0.005 + depth_difference){
      cube([top_total_key_width() * s, top_total_key_height() * s, 0.01], center = true);
    }
  }
}

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
module dished(depth_difference, inverted = false) {
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
    linear_extrude(height=$dish_depth){
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
    color(yellow) supports($support_type, stem_type, $stem_throw, $total_depth - $stem_throw);
  }
}

module stems_for(positions, stem_type) {
  keystem_positions(positions) {
    color(yellow) stem(stem_type, $total_depth, $stem_slop);
    if ($stem_support_type != "disable") {
      color(color2) stem_support($stem_support_type, stem_type, $stem_support_height, $stem_slop);
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
    color(transparent_red){
      translate([0,0,3.6 + $stem_inset - 5]) {
        cherry_keyswitch();
      }
    }
  }
}

// legends / artisan support
module artisan(depth) {
  top_of_key() {
    // outset legend
    for (i=[0:len($legends)-1]) {
        keytext($legends[i][0], $legends[i][1], $legends[i][2], depth);
    }
    // artisan objects / outset shape legends
    children();
  }
}

// key with hollowed inside but no stem
module keytop() {
  difference(){
    if ($rounded_key) {
      rounded_shape();
    } else {
      shape(0, 0);
    }
    // translation purely for aesthetic purposes, to get rid of that awful lattice
    translate([0,0,-0.005]) {
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
      keytop();
      if($key_bump) top_of_key() keybump($key_bump_depth, $key_bump_edge);
      // additive objects at the top of the key
      if(!inset) artisan() children();
      // render the clearance check if it's enabled, but don't have it intersect with anything
      if ($clearance_check) %clearance_check();
    }

    // subtractive objects at the top of the key
    if (inset) artisan(0.3) children();
    // subtract the clearance check if it's enabled, letting the user see the
    // parts of the keycap that will hit the cherry switch
    if ($clearance_check) clearance_check();
  }

  // both stem and support are optional
  if ($stem_type != "disable" || $stabilizer_type != "disable") {
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
$stem_slop = 0.3; // Not working in thingiverse customizer atm [0:0.01:1]

// Font size used for text
$font_size = 6;

// Set this to true if you're making a spacebar!
$inverted_dish = false;


// Support type. default is "flared" for easy FDM printing; bars are more realistic, and flat could be for artisans
$support_type = "flared"; // [flared, bars, flat, disable]

// Supports for the stem, as it often comes off during printing. disabled by default, but highly reccommended.
$stem_support_type = "disable"; // [tines, brim, disabled]

/* [Advanced] */

/* Key */
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
// How skewed towards the back the top is (0 for center)
$top_skew = 1.7;

/* Stem */

// How far the throw distance of the switch is. determines how far the 'cross' in the cherry switch digs into the stem, and how long the keystem needs to be before supports can start. luckily, alps and cherries have a pretty similar throw. can modify to have stouter keycaps for low profile switches, etc
$stem_throw = 4;
// Diameter of the outside of the rounded cherry stem
$rounded_cherry_stem_d = 5.5;


// How much higher the stem is than the bottom of the keycap.
// Inset stem requires support but is more accurate in some profiles
$stem_inset = 0;
// How many degrees to rotate the stems. useful for sideways keycaps, maybe
$stem_rotation = 0;

/* Shape */

// Key shape type, determines the shape of the key. default is 'rounded square'
$key_shape_type = "rounded_square";
// ISO enter needs to be linear extruded NOT from the center. this tells the program how far up 'not from the center' is
$linear_extrude_height_adjustment = 0;
// How many slices will be made, to approximate curves on corners. Leave at 1 if you are not curving corners
// If you're doing fancy bowed keycap sides, this controls how many slices you take
$height_slices = 1;

/* Dish */

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

/* Misc */
// There's a bevel on the cherry stems to aid insertion / guard against first layer squishing making a hard-to-fit stem.
$cherry_bevel = true;

// How tall in mm the stem support is, if there is any. stem support sits around the keystem and helps to secure it while printing.
$stem_support_height = 0.4;
// Font used for text
$font="DejaVu Sans Mono:style=Book";
// Whether or not to render fake keyswitches to check clearances
$clearance_check = false;
// Use linear_extrude instead of hull slices to make the shape of the key
// Should be faster, also required for concave shapes
$linear_extrude_shape = false;
//should the key be rounded? unnecessary for most printers, and very slow
$rounded_key = false;
//minkowski radius. radius of sphere used in minkowski sum for minkowski_key function. 1.75 for G20
$minkowski_radius = .33;

/* Features */

//insert locating bump
$key_bump = false;
//height of the location bump from the top surface of the key
$key_bump_depth = 0.5;
//distance to move the bump from the front edge of the key
$key_bump_edge = 0.4;

/* [Hidden] */

//list of legends to place on a key format: [text, halign, valign, size]
//halign = "left" or "center" or "right"
//valign = "top" or "center" or "bottom"
// Currently does not work with thingiverse customizer, and actually breaks it
$legends = [];

// Dimensions of alps stem
$alps_stem = [4.45, 2.25];

// Enable stabilizers. If you don't want stabilizers use disable; most other keycaps use Cherry stabilizers
$stabilizer_type = "cherry"; // [cherry, rounded_cherry, alps, disable]

// Ternaries are ONLY for customizer. they will NOT work if you're using this in
// OpenSCAD. you should use stabilized(), openSCAD customizer,
// or set $stabilizers directly
// Array of positions of stabilizers
$stabilizers = $key_length >= 6 ? [[-50, 0], [50, 0]] : $key_length >= 2 ? [[-12,0],[12,0]] : [];

// Where the stems are in relation to the center of the keycap, in units. default is one in the center
// Shouldn't work in thingiverse customizer, though it has been...
$stem_positions = [[0,0]];
  key();
}


key_profile(key_profile, row) legend(legend) {
  key();
}
