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

module legend_front(text, position=[0,0], size=undef) {
    font_size = size == undef ? $font_size : size;
    $legends_front = [for(L=[$legends_front, [[text, position, font_size]]], a=L) a];
    children();
}

module bump(depth=undef) {
    $key_bump = true;
    $key_bump_depth = depth == undef ? $key_bump_depth : depth;
    children();
}

// kinda dirty, but it works
// might not work great with fully sculpted profiles yet
module upside_down() {
  if ($stem_inner_slop != 0) {
    echo("it is recommended you set inner stem slop to 0 when you use upside_down()");
  }
  // $top_tilt*2 because top_placement rotates by top_tilt for us
  // first rotate 180 to get the keycaps to face the same direction
  rotate([0,0,180]) top_placement() rotate([180+$top_tilt*2,0,0]) {
    children();
  }
}
