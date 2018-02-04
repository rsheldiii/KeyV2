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
