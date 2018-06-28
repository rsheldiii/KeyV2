// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop) = [
  // horizontal tine
  [4.03 + slop, 1.15 + slop / 3],
  // vertical tine
  [1.25 + slop / 3, 4.9 + slop / 3 + .005],
];

module cherry_stem(depth, has_brim, slop) {
  difference(){
    union() {
      // outside shape
      linear_extrude(height = depth) {
        offset(r=1){
          square(outer_cherry_stem(slop) - [2,2], center=true);
        }
      }

      // brim, if applicable
      if(has_brim) {
        linear_extrude(height = $brim_height){
          offset(r=1){
            square(outer_cherry_stem(slop) + [2,2], center=true);
          }
        }
      }
    }

    // inside cross
    // translation purely for aesthetic purposes, to get rid of that awful lattice
    translate([0,0,-0.005]) {
      linear_extrude(height = $stem_throw) {
        square(cherry_cross(slop)[0], center=true);
        square(cherry_cross(slop)[1], center=true);
      }
      // Guides to assist insertion and mitigate first layer squishing
      for (i = cherry_cross(slop)) hull() {
        linear_extrude(height = 0.01, center = false) offset(delta = 0.4) square(i, center=true);
        translate([0, 0, 0.5]) linear_extrude(height = 0.01, center = false)  square(i, center=true);
      }
    }
  }
}
