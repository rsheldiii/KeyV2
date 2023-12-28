module cylindrical_dish(width, height, depth, inverted){
  // .5 has problems starting around 3u
  $fa=.25;
  /* we do some funky math here
   * basically you want to have the dish "dig in" to the keycap x millimeters
   * in order to do that you have to solve a small (2d) system of equations
   * where the chord of the spherical cross section of the dish is
   * the width of the keycap.
   */
  // the distance you have to move the dish so it digs in depth millimeters
  chord_length = cylindrical_dish_chord_length(width=width, depth=depth);
  //the radius of the dish
  rad = cylindrical_dish_radius(width=width, depth=depth);
  direction = inverted ? -1 : 1;

  translate([0,0, chord_length * direction]){
    rotate([90, 0, 0]) cylinder(h=height + 20, r=rad, center=true);
  }
}
