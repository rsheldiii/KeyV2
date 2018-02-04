//whole stem, alps or cherry, trimmed to fit
module stem(stem_type, depth, has_brim){
		if (stem_type == "alps") {
			alps_stem(depth, has_brim);
		} else if (stem_type == "cherry_rounded") {
			cherry_stem_rounded(depth, has_brim);
		} else if (stem_type == "cherry") {
			cherry_stem(depth, has_brim);
		} else if (stem_type == "filled") {
      // just a cube, so no args
      filled_stem();
    } else {
      echo("Warning: unsupported $stem_type");
    }
}

module cherry_stem(depth, has_brim) {
  difference(){
    union() {
      // outside shape
      linear_extrude(height = depth) {
        offset(r=1){
          square($cherry_stem - [2,2], center=true);
        }
      }

      // brim, if applicable
      if(has_brim) {
        linear_extrude(height = brim_height){
          offset(r=1){
            square($cherry_stem - [2,2], center=true);
          }
        }
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

module cherry_stem_rounded(depth, has_brim) {


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

module alps_stem(depth, has_brim){
  if(has_brim) {
    linear_extrude(h=brim_height) {
      square($alps_stem * [2,2], center = true);
    }
  }
  linear_extrude(h=depth) {
    square($alps_stem, center = true);
  }
}

module filled_stem() {
  // this is mostly for testing. we don't pass the size of the keycp in here
  // so we can't make this work for all keys
  cube(1000, center=true);
}
