// flared support designed for FDM printing, for the normal cherry stem
module cherry_flared(loft, height, stem_bottom) {
  // 6 and 8 are magic numbers I got from trying to make the sides of the flared part of the stem 45 degree overhangs
  translate([0,0,loft]){
    linear_extrude(height=height, scale = [6,8]){
      roundedSquare(stem_bottom, 1, center=true);
    }
  }
}

module flat(loft, height, stem_bottom) {
  // 6 and 8 are magic numbers I got from trying to make the sides of the flared part of the stem 45 degree overhangs
  translate([0,0,loft + 500]){
    cube(1000, center=true);
  }
}

module bars(loft, height, stem_bottom) {
  // 6 and 8 are magic numbers I got from trying to make the sides of the flared part of the stem 45 degree overhangs
  translate([0,0,loft + height / 2]){
    cube([2, 100, height], center = true);
    cube([100, 2, height], center = true);
  }
}
