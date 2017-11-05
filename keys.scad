// the point of this file is to be a sort of DSL for constructing keycaps.
// when you create a method chain you are just changing the parameters
// key.scad uses, it doesn't generate anything itself until the end. This
// lets it remain easy to use key.scad like before (except without key profiles)
// without having to rely on this file. Unfortunately that means setting tons of
// special variables, but that's a limitation of SCAD we have to work around

/* TODO:
 * add keys.scad function for fudge factor in stem
 * pull out side sculpting options to let people tweak them?
 * can now measure keycaps very accurately. need to redo measurements: [x] SA [ ] DCS [X] DSA [X] OEM?
 * Add inset stem to all profiles that need it. [x] OEM [ ] DCS?
 * customizer version where everything is copy/pasted in. needs to be last.
 * generate dishes via math? kind of hard, maybe later
 */

use <key.scad>
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
$dish_type = "cylindrical";
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
$slop = 0.3;

// key profile definitions

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
  }
}

module dsa_row(n=3) {
	$bottom_key_width = 18.24; // 18.4;
	$bottom_key_height = 18.24; // 18.4;
	$width_difference = 6; // 5.7;
	$height_difference = 6; // 5.7;
	$total_depth = 8.1;
	$top_tilt = (n-1) * 7 - 14;
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

  children();
}

module sa_row(n=1) {
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
	$enable_side_sculpting = true;
	// might wanna change this if you don't minkowski
	// do you even minkowski bro
	$corner_radius = 0.25;

  if (n == 1){
    $total_depth = 14.89;
    $top_tilt = -13;
    children();
  } else if (n == 2) {
    $total_depth = 12.925;
    $top_tilt = -7;
    children();
  } else if (n == 3) {
    $total_depth = 12.5;
    $top_tilt = 0;
    children();
  } else if (n == 4){
    $total_depth = 12.925;
    $top_tilt = 7;
    children();
  }
}

module g20() {
	$bottom_key_width = 18.16;
	$bottom_key_height = 18.16;
	$width_difference = 2;
	$height_difference = 2;
	$total_depth = 6;
	$top_tilt = 2.5;
	$top_skew = 0.75;
	$dish_type = "no dish";
	$dish_depth = 0;
	$dish_skew_x = 0;
	$dish_skew_y = 0;
	$minkowski_radius = 1.75;


	children();
  //also,
  /*$rounded_key = true;*/
}

module fake_iso_enter() {
	$bottom_key_width = 18.16 * 1.9;
	$bottom_key_height = 18.16 * 2;
	$width_difference = 4;
	$height_difference = 4;
	$total_depth = 7;
	$top_tilt = 0;
	$top_skew = 1.75;
	$dish_type = "cylindrical";
	$dish_depth = 1;
	$dish_skew_x = 0;
	$dish_skew_y = 0;
	$ISOEnter = true;

  stabilized(vertical=true) {
		children();
	}
}

module brimmed() {
  $has_brim = true;
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

module stabilized(mm=12, vertical = false) {
  if (vertical) {
    $connectors = [
    [0,   0],
    [0,  mm],
    [0, -mm]
    ];

    children();
  } else {
    $connectors = [
      [0,   0],
      [mm,  0],
      [-mm, 0]
    ];

    children();
  }
}

module dishless() {
  $dish_type = "no dish";
  children();
}

module inset(val=1) {
	$stem_inset = val;
	children();
}

module spacebar() {
  $inverted_dish = true;
	if ($dish_type == "cylindrical") {
		$dish_type = "sideways cylindrical";
		6_25u() stabilized(mm=50) children();
	} else {
		6_25u() stabilized(mm=50) children();
	}
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
    $connectors = [
      [-5, 0]
    ];
    children();
  }
}

module translate_u(x=0, y=0, z=0){
  translate([x * unit, y*unit, z*unit]) children();
}

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

module filled() {
	$stem_profile = "filled";
	children();
}
module blank() {
  $stem_profile = "blank";
  children();
}

module cherry(slop = 0.3) {
	$slop = slop;
  $stem_profile = "cherry";
  children();
}

module alps(slop = 0.3) {
	$slop = slop;
  $stem_profile = "alps";
  children();
}

module rounded_cherry(slop = 0.3) {
	$slop = slop;
  $stem_profile = "cherry_rounded";
  children();
}

module legend(text, inset=false) {
  $text=text;
  $inset_text = inset;
	children();
}

translate_u(0, 0) oem_row(1) cherry() key();
