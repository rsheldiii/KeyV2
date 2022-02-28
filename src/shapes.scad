include <constants.scad>
include <shapes/ISO_enter.scad>
include <shapes/sculpted_square.scad>
include <shapes/rounded_square.scad>
include <shapes/square.scad>
include <shapes/oblong.scad>
include <shapes/regular_polygon.scad>

// size: at progress 0, the shape is supposed to be this size
// delta: at progress 1, the keycap is supposed to be size - delta
// progress: how far along the transition you are.
// it's not always linear - specifically sculpted_square
module key_shape(size, delta, progress = 0) {
  if ($key_shape_type == "iso_enter") {
    ISO_enter_shape(size, delta, progress);
  } else if ($key_shape_type == "sculpted_square") {
    sculpted_square_shape(size, delta, progress);
  } else if ($key_shape_type == "rounded_square") {
    rounded_square_shape(size, delta, progress);
  } else if ($key_shape_type == "flat_sided_square") {
    // rounded_square_shape handles this
    rounded_square_shape(size, delta, progress);
  } else if ($key_shape_type == "square") {
    square_shape(size, delta, progress);
  } else if ($key_shape_type == "oblong") {
    oblong_shape(size, delta, progress);
  } else if ($key_shape_type == "hexagon") {
    regular_polygon_shape(size, delta, progress);
  } else if ($key_shape_type == "octagon") {
    regular_polygon_shape(size, delta, progress, sides=8);
  } else if ($key_shape_type == "circular") {
    regular_polygon_shape(size, delta, progress, sides=36);
  } else {
    echo("Warning: unsupported $key_shape_type");
  }
}

function skin_key_shape(size, delta, progress = 0, thickness_difference) =
  $key_shape_type == "rounded_square" ?
    skin_rounded_square(size, delta, progress, thickness_difference) :
    $key_shape_type == "sculpted_square" ?
      skin_sculpted_square_shape(size, delta, progress, thickness_difference) :
    $key_shape_type == "square" ?
      skin_square_shape(size, delta, progress, thickness_difference) :
    $key_shape_type == "iso_enter" ?
      skin_iso_enter_shape(size, delta, progress, thickness_difference) :
      echo("Warning: unsupported $key_shape_type for skin shape. disable skin_extrude_shape or pick a new shape");
