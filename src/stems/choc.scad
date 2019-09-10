module choc_stem(depth, slop){

  translate([-5.7/2, 0, depth/2]) cube([1.2 - slop, 3 - slop / 2, depth], center=true);
  translate([5.7/2, 0, depth/2]) cube([1.2 - slop, 3 - slop / 2, depth], center=true);
}
