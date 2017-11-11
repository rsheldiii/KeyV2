$fs=.1;

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

// corollary is roundedRect
// NOT 3D
module fakeISOEnter(thickness_difference = 0){
		// 1u is the space taken upy by a 1u keycap.
		// unit is the space taken up by a unit space for a keycap.
		// formula is 1u + unit *(length - 1)

		// t is all modifications to the polygon array
		// t used to contain a corner radius adjustment, but due to
		// the offset we need that expansion back
		t = (thickness_difference - (19.05 - 18.16));

		function unit(length) = 19.05 * length;

    pointArray = [
        [unit(-.625)  + t,      unit(-1)  + t],
        [unit(0.625)  - t,      unit(-1)  + t],
        [unit(0.625)  - t,      unit(1)  - t],
        [unit(-0.875) + t,      unit(1)  - t],
        [unit(-0.875) + t,      unit(0)  + t],
        [unit(-0.625) + t,      unit(0)  + t]
    ];

		minkowski(){
			circle(r=$corner_radius);
			// gives us rounded inner corner
			offset(r=-$corner_radius*2) {
				polygon(points=pointArray);
			}
		}
}

module functional_scaled_extrude(height = 10, slices=[]) {
	nominal_height = height / (len(slices) - 1);
	for (index = [0 : len(slices)-2]){
		slice1 = slices[index];
		slice2 = slices[index+1];
		hull(){
			translate([0,0,nominal_height * index]) {
				scale(slice1) children();
			}
			translate([0,0,nominal_height * (index + 1)]) {
				scale(slice2) children();
			}
		}
	}
}

module progressive_hull() {
  for (i = [0 : $children-2]){
		hull(){
			children(i);
			children(i+1);
		}
	}
}
