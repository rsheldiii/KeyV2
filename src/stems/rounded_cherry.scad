// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop) = [
  // horizontal tine
  [4.03 + slop, 1.15 + slop / 3],
  // vertical tine
  [1.25 + slop / 3, 5.5 - slop * 2 + .005],
];

module rounded_cherry_stem(depth, has_brim, slop) {
  difference(){
    union(){
      cylinder(d=$rounded_cherry_stem_d, h=depth);
      if(has_brim) {
        cylinder(d=$rounded_cherry_stem_d * 2, h=$brim_height);
      }
    }

    // inside cross
    // translation purely for aesthetic purposes, to get rid of that awful lattice
    translate([0,0,-0.005]) {
      linear_extrude(height = $stem_throw) {
        square(cherry_cross(slop)[0], center=true);
        square(cherry_cross(slop)[1], center=true);
      }
    }
  }
}
