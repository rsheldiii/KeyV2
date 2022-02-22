// rounded square shape with additional sculpting functions to better approximate

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

  offset(r = extra_corner_radius_this_slice, $fa=360/$shape_facets) {
    offset(r = -extra_corner_radius_this_slice) {
      side_rounded_square(square_size, r = $more_side_sculpting_factor * progress);
    }
  }
}

function new_side_rounded_square(size, r, cornerRadius=0) =
  let(
    width = (size.x - r)/2,
    height = (size.y - r)/2,

    // fudge numbers! the radius conflict resolution in polyround smooths out
    // the entire shape based on the ratios between conflicting radii. bumping
    // these up makes the whole shape more fluid
    widthRadius = r ? width*8 : 0,
    heightRadius = r ? height*8 : 0,

    bow = r/2,

    // close enough :/
    facets = 360 / $shape_facets/2,

    points = [
       [-width,-height,cornerRadius],
       [0,-height-bow,widthRadius],
       [width,-height,cornerRadius],
       [width + bow,0,heightRadius],
       [width,height,cornerRadius],
       [0,height + bow,widthRadius],
       [-width,height,cornerRadius],
       [-width-bow,0,heightRadius]
    ]
  ) polyRound(points,facets);


function skin_sculpted_square_shape(size, delta, progress, thickness_difference) =
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
      width - extra_width_this_slice - thickness_difference,
      height - extra_height_this_slice - thickness_difference
    ]
  ) new_side_rounded_square(square_size, $more_side_sculpting_factor * progress, extra_corner_radius_this_slice);


module side_rounded_square(size, r) {
    iw = size.x - 2 * r;
    ih = size.y - 2 * r;
    resolution = 100;
    sr = r / resolution * 2;
    sh = ih / resolution;
    sw = iw / resolution;
    union() {
      if (sr > 0) {
        translate([-iw/2, 0]) scale([sr, sh]) circle(d = resolution, $fa=360/$shape_facets);
        translate([iw/2, 0]) scale([sr, sh]) circle(d = resolution, $fa=360/$shape_facets);
        translate([0, -ih/2]) scale([sw, sr]) circle(d = resolution, $fa=360/$shape_facets);
        translate([0, ih/2]) scale([sw, sr]) circle(d = resolution, $fa=360/$shape_facets);
      }
        square([iw, ih], center=true);
    }
}
