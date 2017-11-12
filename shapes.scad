$fs=.1;
unit = 19.05;

module key_shape(width, height, width_difference, height_difference, corner_size) {
	if ($key_shape_type == "iso_enter") {
		fakeISOEnter(width_difference/2);
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
module fakeISOEnter(thickness_difference = 0){
	// t is all modifications to the polygon array
	// t used to contain a corner radius adjustment, but due to
	// the offset we need that expansion back
	t = (thickness_difference - (unit - 18.16));

	function unit(length) = unit * length;

  pointArray = [
      [unit(-.625)  + t,      unit(-1)  + t],
      [unit(0.625)  - t,      unit(-1)  + t],
      [unit(0.625)  - t,      unit(1)   - t],
      [unit(-0.875) + t,      unit(1)   - t],
      [unit(-0.875) + t,      unit(0)   + t],
      [unit(-0.625) + t,      unit(0)   + t]
  ];

	minkowski(){
		circle(r=$corner_radius);
		// gives us rounded inner corner
		offset(r=-$corner_radius*2) {
			polygon(points=pointArray);
		}
	}
}
