module squared_spherical_dish(width, height, depth, inverted=false) {
    chord = pow(pow(height / 2, 2) + pow(width / 2, 2),0.5);
    direction = inverted ? -1 : 1;
    r=max(height,width,chord) / 5;
    // ^^^^^ Nothing special about this code to figure out r.
    // I just modeled up 1u, 1.25u, 1.5u, 2u, 2.25u, and 2.75u
    // keys and messed around until I came up with something that
    // looked reasonable for all key sizes.  This just seems to work
    // well for all sizes

    translate([-width / 2, -height / 2, 0 * direction]) {
      resize([width, height, depth])
        hull() {
          cube([chord,chord,0.001]);
          // Use something larger in this translate than -depth 
          // (like -chord) if you want more of a defined circle
          // in the keywell
          translate([chord/2, chord/2, -depth]) 
            sphere(r=r, $fn=128);
        }
    }
}
