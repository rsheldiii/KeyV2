// kind of a catch-all at this point for any directive that doesn't fit in the other files

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

module filled() {
	$stem_type = "filled";
	children();
}

module blank() {
  $stem_type = "blank";
  children();
}

module cherry(slop = 0.3) {
	$stem_slop = slop;
  $stem_type = "cherry";
  children();
}

module alps(slop = 0.3) {
	$stem_slop = slop;
  $stem_type = "alps";
  children();
}

module rounded_cherry(slop = 0.3) {
	$stem_slop = slop;
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
