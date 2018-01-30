$fs=.1;
unit = 19.05;

// side sculpting functions
// bows the sides out on stuff like SA and DSA keycaps
function side_sculpting(progress) = (1 - progress) * 2.5;
// makes the rounded corners of the keycap grow larger as they move upwards
function corner_sculpting(progress) = pow(progress, 2);

module key_shape(size, delta, progress = 0) {
	if ($key_shape_type == "iso_enter") {
		ISO_enter(size, delta, progress);
	} else if ($key_shape_type == "normal") {
		roundedSquare(size, delta, progress);
	} else if ($key_shape_type == "circle") {
		circle(d=width);
	} else if ($key_shape_type == "square") {
		square(size - delta, center = true);
  } else if ($key_shape_type == "obloid") {
		obloid(size, delta, progress);
	}
}

module obloid(size, delta, progress) {
	width = size[0];
	height = size[1] - delta[1] * progress; // TODO if we don't account for the delta somehow 1u keys will not render as the offset margin is greater than the size of the key. this does not work however

	if (progress < .5 && false) {
		circle(d=5.5);
	} else {
		offset(r=height / 2.1) {
			square(size - [height / 1.05, height / 1.05] - delta * progress, center=true);
		}
	}
}

module roundedSquare(size, delta, progress, center = true) {
		width = size[0];
		height = size[1];

		width_difference = delta[0];
		height_difference = delta[1];
		// makes the sides bow
		extra_side_size =  $enable_side_sculpting ? side_sculpting(progress) : 0;
		// makes the rounded corners of the keycap grow larger as they move upwards
		extra_corner_size = $enable_side_sculpting ? corner_sculpting(progress) : 0;

		// computed values for this slice
		extra_width_this_slice = (width_difference - extra_side_size) * progress;
		extra_height_this_slice = (height_difference - extra_side_size) * progress;
		extra_corner_radius_this_slice = ($corner_radius + extra_corner_size);

		offset(r=extra_corner_radius_this_slice){
			square(
				[
					width - extra_width_this_slice - extra_corner_radius_this_slice * 2,
					height - extra_height_this_slice - extra_corner_radius_this_slice * 2
				],
				center=center
			);
		}
}

// corollary is roundedSquare
// NOT 3D
module ISO_enter(size, delta, progress){
	width = size[0];
	height = size[1];
	function unit_length(length) = unit * (length - 1) + 18.16;


	// in order to make the ISO keycap shape generic, we are going to express the
	// 'elbow point' in terms of ratios. an ISO enter is just a 1.5u key stuck on
	// top of a 1.25u key, but since our key_shape function doesnt understand that
	// and wants to pass just width and height, we make these ratios to know where
	// to put the elbow joint

	width_ratio = unit_length(1.25) / unit_length(1.5);
	height_ratio = unit_length(1) / unit_length(2);

  pointArray = [
      [                   0,                     0], // top right
      [                   0,               -height], // bottom right
      [-width * width_ratio,               -height], // bottom left
      [-width * width_ratio,-height * height_ratio], // inner middle point
      [              -width,-height * height_ratio], // outer middle point
      [              -width,                     0]  // top left
  ];

	minkowski(){
		circle(r=corner_size);
		// gives us rounded inner corner
		offset(r=-corner_size*2) {
			translate([(width * width_ratio)/2, height/2]) polygon(points=pointArray);
		}
	}
}
