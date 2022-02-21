// we do this weird key_shape_type check here because rounded_square uses
// square_shape, and we want flat sides to work for that too.
// could be refactored, idk
module regular_polygon_shape(size, delta, progress, sides=6){
  // https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/undersized_circular_objects
  fudge = 1/cos(180/sides);
  diameter = (size.x - delta.x * progress - $corner_radius*2) * fudge;
  offset(r=$corner_radius) rotate([0,0,360/sides/2]) circle(d = diameter, $fn=sides);
}



// TODO not implemented
function skin_regular_polygon_shape(size, delta, progress, thickness_difference, sides=6) = echo("skin regular polygon not implemented");
