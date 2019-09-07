// kind of a catch-all at this point for any directive that doesn't fit in the other files

include <constants.scad>

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

module choc(slop) {
  $stem_slop = slop ? slop : $stem_slop;
  $stem_type = "choc";
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

module low_profile() {
  /* $total_depth = 5.35; */
  /* extra ugly hack right now to make sure we don't generate keycaps with insufficient throw */
  /* $total_depth = ($total_depth / 2) < 6 ? 6 : $total_depth / 2; */
  $stem_throw = 3;
  children();
}
