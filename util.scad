$fs=.1;

//centered
// offset, who knew?
module roundedRect(size, radius) {
	linear_extrude(height = size[2]){
		offset(r=radius){
			square([size[0] - radius * 2, size[1] - radius * 2], center=true);
		}
	}
}

module oldroundedRect(size, radius) {
	x = size[0];
	y = size[1];
	z = size[2];

	translate([-x/2,-y/2,0])
	linear_extrude(height=z)
	hull() {
		translate([radius, radius, 0])
		circle(r=radius);

		translate([x - radius, radius, 0])
		circle(r=radius);

		translate([x - radius, y - radius, 0])
		circle(r=radius);

		translate([radius, y - radius, 0])
		circle(r=radius);
	}
}

module functional_scaled_extrude(height = 10, slices=[]) {
	nominal_height = height / (len(slices) - 1);
	for (index = [0 : len(slices)-2]){
		slice1 = slices[index];
		slice2 = slices[index+1];
		echo(slice2);
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
