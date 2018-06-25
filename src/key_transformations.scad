// kind of a catch-all at this point for any directive that doesn't fit in the other files

//TODO duplicate def to not make this a special var. maybe not worth it
unit = 19.05;

module translate_u(x=0, y=0, z=0){
  translate([x * unit, y*unit, z*unit]) children();
}

module brimmed(height = 0.2) {
  $has_brim = true;
  $brim_height = height;
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
  $dish_type = "no dish";
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
  $stem_type = "blank";
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
  $stem_type = "cherry_rounded";
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
