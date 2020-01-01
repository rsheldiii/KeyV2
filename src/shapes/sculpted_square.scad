include <../libraries/rounded_rectangle_profile.scad>

// rounded square shape with additional sculpting functions to better approximate

// When sculpting sides, how much in should the tops come
$side_sculpting_factor = 4.5;
// When sculpting corners, how much extra radius should be added
$corner_sculpting_factor = 1;
// When doing more side sculpting corners, how much extra radius should be added
$more_side_sculpting_factor = 0.4;


// side sculpting functions
// bows the sides out on stuff like SA and DSA keycaps
function side_sculpting(progress) = (1 - progress) * $side_sculpting_factor;
// makes the rounded corners of the keycap grow larger as they move upwards
function corner_sculpting(progress) = pow(progress, 2) * $corner_sculpting_factor;

module sculpted_square_shape(size, delta, progress) {
  width = size[0];
  height = size[1];

  width_difference = delta[0];
  height_difference = delta[1];
  // makes the sides bow
  extra_side_size =  side_sculpting(progress);
  // makes the rounded corners of the keycap grow larger as they move upwards
  extra_corner_size = corner_sculpting(progress);

  // computed values for this slice
  extra_width_this_slice = (width_difference - extra_side_size) * progress;
  extra_height_this_slice = (height_difference - extra_side_size) * progress;
  extra_corner_radius_this_slice = ($corner_radius + extra_corner_size);

  square_size = [
    width - extra_width_this_slice,
    height - extra_height_this_slice
  ];

  offset(r = extra_corner_radius_this_slice) {
    offset(r = -extra_corner_radius_this_slice) {
      side_rounded_square(square_size, r = $more_side_sculpting_factor * progress);
    }
  }
}

// fudging the hell out of this, I don't remember what the negative-offset-positive-offset was doing in the module above
// also no 'bowed' square shape for now
function skin_sculpted_square_shape(size, delta, progress) =
  let(
    width = size[0],
    height = size[1],

    width_difference = delta[0],
    height_difference = delta[1],
    // makes the sides bow
    extra_side_size =  side_sculpting(progress),
    // makes the rounded corners of the keycap grow larger as they move upwards
    extra_corner_size = corner_sculpting(progress),

    // computed values for this slice
    extra_width_this_slice = (width_difference - extra_side_size) * progress,
    extra_height_this_slice = (height_difference - extra_side_size) * progress,
    extra_corner_radius_this_slice = ($corner_radius + extra_corner_size),

    square_size = [
      width - extra_width_this_slice,
      height - extra_height_this_slice
    ]
  ) rounded_rectangle_profile(square_size - [extra_corner_radius_this_slice, extra_corner_radius_this_slice]/4, fn=36, r=extra_corner_radius_this_slice/1.5 + $more_side_sculpting_factor * progress);

  /* offset(r = extra_corner_radius_this_slice) {
    offset(r = -extra_corner_radius_this_slice) {
      side_rounded_square(square_size, r = $more_side_sculpting_factor * progress);
    }
  } */


module side_rounded_square(size, r) {
    iw = size.x - 2 * r;
    ih = size.y - 2 * r;
    resolution = 100;
    sr = r / resolution * 2;
    sh = ih / resolution;
    sw = iw / resolution;
    union() {
      if (sr > 0) {
        translate([-iw/2, 0]) scale([sr, sh]) circle(d = resolution);
        translate([iw/2, 0]) scale([sr, sh]) circle(d = resolution);
        translate([0, -ih/2]) scale([sw, sr]) circle(d = resolution);
        translate([0, ih/2]) scale([sw, sr]) circle(d = resolution);
      }
        square([iw, ih], center=true);
    }
}
