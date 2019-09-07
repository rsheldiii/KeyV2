module choc_stem(depth, slop){
  echo("slop");
  echo(slop);
  translate([-5.7/2, 0, depth/2]) cube([1.2 - slop/2, 3 - slop, depth], center=true);
  translate([5.7/2, 0, depth/2]) cube([1.2 - slop/2, 3 - slop, depth], center=true);
}
