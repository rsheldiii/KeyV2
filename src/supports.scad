// flared support designed for FDM printing, for the normal cherry stem
module flared(loft, height) {
  translate([0,0,loft]){
    linear_extrude(height=height, scale = [height/2,height/2]){
      children();
    }
  }
}

module flat(loft, height) {
  translate([0,0,loft + 500]){
    cube(1000, center=true);
  }
}

module bars(loft, height) {
  translate([0,0,loft + height / 2]){
    cube([2, 100, height], center = true);
    cube([100, 2, height], center = true);
  }
}
