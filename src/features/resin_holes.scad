module resin_suction_holes() {
  if ($key_shape_type != "sculpted_square"
      && $key_shape_type != "rounded_square"
      && $key_shape_type != "flat_sided_square"
      && $key_shape_type != "square") {
    echo("Warning: unsupported $key_shape_type for resin_suction_holes. disable resin_suction_holes or pick a new shape");
  }

  dx = $key_length*$unit/2;
  dy = $key_height*$unit/2;

  for(theta=[0, 180])
  rotate(theta)
  {
    translate([dx,dy])
    rotate(-45)
    rotate([90,0,0])
    cylinder(center=true, d=2, h=8);

    translate([-dx,dy])
    rotate(45)
    rotate([90,0,0])
    cylinder(center=true, d=2, h=8);
  }

}

module resin_drain_holes() {
  if ($key_shape_type != "sculpted_square"
      && $key_shape_type != "rounded_square"
      && $key_shape_type != "flat_sided_square"
      && $key_shape_type != "square") {
    echo("Warning: unsupported $key_shape_type for resin_drain_holes. disable resin_drain_holes or pick a new shape");
  }

  // XXX these calculations are specific to the flared support type
  loft = $stem_throw;
  height = $total_depth-$stem_throw;
  dx = $key_length*$unit/2;
  for(r=[90, 270])
  rotate(r)
  translate([0,dx,loft+height/4-1])
  rotate([87,0,0])
  cylinder(center=true, d=3, h=11);
}

