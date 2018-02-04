module rounded_cherry_stem(depth, has_brim) {
  difference(){
    union(){
      cylinder(d=$rounded_cherry_stem_d, h=depth);
      if(has_brim) {
        cylinder(d=$rounded_cherry_stem_d * 2, h=brim_height);
      }
    }

    // inside cross
    // translation purely for aesthetic purposes, to get rid of that awful lattice
    translate([0,0,-0.005]) {
      linear_extrude(height = $stem_throw) {
        square($cherry_cross[0], center=true);
        square($cherry_cross[1], center=true);
      }
    }
  }
}
