module spherical_dish(width, height, depth, inverted){

  //same thing as the cylindrical dish here, but we need the corners to just touch - so we have to find the hypotenuse of the top
  chord = pow((pow(width,2) + pow(height, 2)),0.5); //getting diagonal of the top

  // the distance you have to move the dish up so it digs in depth millimeters
  chord_length = (pow(chord, 2) - 4 * pow(depth, 2)) / (8 * depth);
  //the radius of the dish
  rad = (pow(chord, 2) + 4 * pow(depth, 2)) / (8 * depth);
  direction = inverted ? -1 : 1;

  translate([0,0,0 * direction]){
    if (geodesic){
      $fa=20;
      scale([chord/2/depth, chord/2/depth]) {
        geodesic_sphere(r=depth);
      }
    } else {
      $fa=6.5;
      // rotate 1 because the bottom of the sphere looks like trash.
      scale([chord/2/depth, chord/2/depth]) {
        sphere(r=depth);
      }
    }
  }
}
