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
}