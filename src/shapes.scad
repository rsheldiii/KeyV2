$fs=.1;
unit = 19.05;

include <shapes/ISO_enter.scad>
include <shapes/rounded_square.scad>
include <shapes/square.scad>
include <shapes/oblong.scad>

module key_shape(size, delta, progress = 0) {
	if ($key_shape_type == "iso_enter") {
		ISO_enter_shape(size, delta, progress);
	} else if ($key_shape_type == "rounded_square") {
		rounded_square_shape(size, delta, progress);
	} else if ($key_shape_type == "square") {
		square_shape(size, delta, progress);
  } else if ($key_shape_type == "oblong") {
		oblong_shape(size, delta, progress);
	} else {
		echo("Warning: unsupported $key_shape_type");
	}
}
