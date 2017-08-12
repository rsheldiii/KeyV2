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


// key profile definitions

module dcs_row(n=1) {
  echo(n);
	// names, so I don't go crazy
	$bottom_key_width = 18.16;
	$bottom_key_height = 18.16;
	$width_difference = 6;
	$height_difference = 4;
  $dish_type = 0;
  $dish_depth = 1;
  $dish_skew_x = 0;
  $dish_skew_y = 0;

  if (n == 5) {
    $total_depth = 11.5;
    $top_tilt = -6;
    $top_skew = 1.7;
    children();
  } else if (n == 1) {
    $total_depth = 8.5;
    $top_tilt = -1;
    $top_skew = 1.75;
    children();
  } else if (n == 2) {
    $total_depth = 7.5;
    $top_tilt = 3;
    $top_skew = 1.75;
    children();
  } else if (n == 3) {
    $total_depth = 6;
    $top_tilt = 7;
    $top_skew = 1.75;
    children();
  } else if (n == 4) {
    $total_depth = 6;
    $top_tilt = 16;
    $top_skew = 1.75;
    children();
  }
}

module dsa_row(n=3) {
	$bottom_key_width = 18.4;
	$bottom_key_height = 18.4;
	$width_difference = 5.7;
	$height_difference = 5.7;
	$total_depth = 7.4;
	$top_tilt = 0;
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
  $dish_depth = 1.2;
  $dish_skew_x = 0;
  $dish_skew_y = 0;

  if (n == 1){
    $total_depth = 13.73;
    $top_tilt = -14;
    $top_skew = 0;
    children();
  } else if (n == 2) {
    $total_depth = 11.73;
    $top_tilt = -7;
    $top_skew = 0;
    children();
  } else if (n == 3) {
    $total_depth = 11.73;
    $top_tilt = 0;
    $top_skew = 0;
    children();
  } else if (n == 4){
    $total_depth = 11.73;
    $top_tilt = 7;
    $top_skew = 0;
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
  brim();
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

module spacebar() {
  $inverted_dish = true;
  $key_length = 6.25;
  //TODO CONFIRM PLS
  $connectors =  [[0,0],[-50,0],[50,0]];
  children();
}

module lshift() {
  //TODO
}

module rshift() {
  //TODO
}

module backspace() {
  //TODO
}

module enter() {
  //TODO
}

module numpad_enter() {
  //TODO
}

module numpad_0() {
  //TODO
}

module translate_u(x=0, y=0){
  echo (x*unit);
  translate([x * unit, y*unit, 0]) {
    children();
  }
}

// key width functions

module u(u=1) {
  $key_length = u;
  echo ($key_length);
  children();
}

module 1u() {
  u(1){
    children();
  }
}

module 2u() {
  u(2){
    children();
  }
}

module 1_25u() {
  u(1.25){
    children();
  }
}

module 1_5u() {
  u(1.5){
    children();
  }
}

module 2_25u() {
  u(2.25){
    children();
  }
}

module 2_75u() {
  u(2.75){
    children();
  }
}

module 6_25u() {
  u(6.25){
    children();
  }
}

// key height functions

module uh(u=1) {
  $key_height = u;
  children();
}

module 1uh() {
  uh(1){
    children();
  }
}

module 2uh() {
  uh(2){
    children();
  }
}

module 1_25uh() {
  uh(1.25){
    children();
  }
}

module 1_5uh() {
  uh(1.5){
    children();
  }
}

module 2_25uh() {
  uh(2.25){
    children();
  }
}

module 2_75uh() {
  uh(2.75){
    children();
  }
}

module 6_25uh() {
  uh(6.25){
    children();
  }
}

module cherry_key() {
  difference() {
    cherry_stem();
    inside();
  }

  keytop();
}

module alps_key() {
  difference(){
    alps_stem();
    inside();
  }

  keytop();
}

module rounded_cherry_key() {
  difference(){
    cherry_stem_rounded();
    inside();
  }

  keytop();
}

for (row=[1:4]) {
  for (column = [1:1]) {
    translate_u(column - 1, 4 - row) dcs_row(row) alps_key();
  }
}
