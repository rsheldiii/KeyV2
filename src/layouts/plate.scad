// No support for stabilizers yet - but should be easy enough
// Won't work well for split layouts. or, it'll work fine - but it'll only be
// one plate.

// each corner
module unit_corners(height = 3, radius=3, $fn=24) {
  positions = [
    [-$key_length/2, -$key_height/2],
    [$key_length/2, -$key_height/2],
    [$key_length/2, $key_height/2],
    [-$key_length/2, $key_height/2],
  ];
  for (position = positions) {
    translate_u(position.x, position.y) cylinder(h=height, r=radius, $fn=$fn);
  }
}

module switch_hole() {
  cube(14, center=true);
}

module plate(layout_object) {
  difference() {
    hull() {
      simple_layout(layout_object) unit_corners();
    }
    simple_layout(layout_object) switch_hole();
  }
}