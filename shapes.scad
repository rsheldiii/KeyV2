$fs=.1;
unit = 19.05;

module key_shape(width, height, width_difference, height_difference, corner_size) {
	if ($key_shape_type == "iso_enter") {
		ISO_enter(width, height, width_difference, height_difference, corner_size);
	} else if ($key_shape_type == "normal") {
		roundedSquare([width - width_difference, height - height_difference], corner_size);
	} else if ($key_shape_type == "circle") {
		circle(d=width - width_difference);
	}
}

// centered
module roundedRect(size, radius, center=true) {
	linear_extrude(height = size[2]){
		roundedSquare([size[0], size[1]], radius, center=center);
	}
}

module roundedSquare(size, radius, center = true) {
		offset(r=radius){
			square([size[0] - radius * 2, size[1] - radius * 2], center=center);
		}
}

// corollary is roundedSquare
// NOT 3D
module ISO_enter(width, height, width_difference, height_difference, corner_size){
	function unit_length(length) = unit * (length - 1) + 18.16;


	// in order to make the ISO keycap shape generic, we are going to express the
	// 'elbow point' in terms of ratios. an ISO enter is just a 1.5u key stuck on
	// top of a 1.25u key, but since our key_shape function doesnt understand that
	// and wants to pass just width and height, we make these ratios to know where
	// to put the elbow joint

	width_ratio = unit_length(1.25) / unit_length(1.5);
	height_ratio = unit_length(1) / unit_length(2);

  pointArray = [
      [                      -width_difference/2,                        -height_difference/2],
      [                      -width_difference/2,               -height + height_difference/2],
      [-width * width_ratio + width_difference/2,               -height + height_difference/2],
      [-width * width_ratio + width_difference/2,-height * height_ratio + height_difference/2],
      [              -width + width_difference/2,-height * height_ratio + height_difference/2],
      [              -width + width_difference/2,                        -height_difference/2]
  ];

	minkowski(){
		circle(r=corner_size);
		// gives us rounded inner corner
		offset(r=-corner_size*2) {
			translate([(width * width_ratio)/2, height/2]) polygon(points=pointArray);
		}
	}
}
