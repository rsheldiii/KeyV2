/* TODO:
 * can now measure keycaps very accurately. need to redo measurements
 * sideways cylindrical dish needs to be used for some spacebars but not others. currently none of them use it
 * Add inset stem to all profiles that need it
 * Pregenerated keysets
 * Full experimental ISO enter
* customizer version where everything is copy/pasted in
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

// key profile definitions

module dcs_row(n=1) {
	// names, so I don't go crazy
	$bottom_key_width = 18.16;
	$bottom_key_height = 18.16;
	$width_difference = 6;
	$height_difference = 4;
  $dish_type = 2;
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

module dsa_row(n=3) {
	$bottom_key_width = 18.4;
	$bottom_key_height = 18.4;
	$width_difference = 5.7;
	$height_difference = 5.7;
	$total_depth = 7.4;
	$top_tilt = (n-1) * 7 - 14;
	$top_skew = 0;
	$dish_type = 1;
	$dish_depth = 1.2;
	$dish_skew_x = 0;
	$dish_skew_y = 0;

  children();
}

module sa_row(n=1) {
	$bottom_key_width = 18.4;
	$bottom_key_height = 18.4;
	$width_difference = 5.7;
	$height_difference = 5.7;
  $dish_type = 1;
  $dish_depth = 0.85;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 0;

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
	$dish_type = 3;
	$dish_depth = 0;
	$dish_skew_x = 0;
	$dish_skew_y = 0;

  //also,
  $rounded_key = true;
}

module fake_iso_enter() {
	$bottom_key_width = 18.16 * 1.5;
	$bottom_key_height = 18.16 * 2;
	$width_difference = 4;
	$height_difference = 4;
	$total_depth = 7;
	$top_tilt = 0;
	$top_skew = 1.75;
	$dish_type = 0;
	$dish_depth = 1;
	$dish_skew_x = 0;
	$dish_skew_y = 0;

  children();
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
  $dish_type = 3;
  children();
}

module spacebar() {
  $inverted_dish = true;
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

module blank() {
  $stem_profile = "blank";
  children();
}

module cherry() {
  $stem_profile = "cherry";
  children();
}

module alps() {
  $stem_profile = "alps";
  children();
}

module rounded_cherry() {
  $stem_profile = "cherry_rounded";
  children();
}

module legend(text, inset=false) {
  $text=text;
  $inset_text = inset;
}

translate([0,0,0]){
  for (x = [1:4]){
    translate_u(0,(x-1)){
      sa_row(5-x) blank() key();
    }
  }
  translate([-10,-10,-2]) cube([40,80,2]);
}
