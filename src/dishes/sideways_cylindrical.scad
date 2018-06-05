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
