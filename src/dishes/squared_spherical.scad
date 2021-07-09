module squared_spherical_dish(width, height, depth, inverted=false) {
    chord = pow(pow(height / 2, 2) + pow(width / 2, 2),0.5);
    direction = inverted ? -1 : 1;
    r=width / 3.5;

    translate([-width / 2, -height / 2, 0 * direction]) {
      resize([width, height, depth])
        hull() {
          cube([width,height,0.001]);
          translate([width/2, height/2, -chord])
            sphere(r=r, $fn=64);
        }
    }
}