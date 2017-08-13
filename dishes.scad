include <util.scad>
//rounding factor. increase rounding on dishes
$rounding_factor = 1;


module cylindrical_dish(width, height, depth, inverted, tilt){
	// .5 has problems starting around 3u
	$fa=.25;
	/* we do some funky math here
	 * basically you want to have the dish "dig in" to the keycap x millimeters
	 * in order to do that you have to solve a small (2d) system of equations
	 * where the chord of the spherical cross section of the dish is
	 * the width of the keycap.
	 */
	// the distance you have to move the dish so it digs in depth millimeters
	chord_length = (pow(width, 2) - 4 * pow(depth, 2)) / (8 * depth);
	//the radius of the dish
	rad = (pow(width, 2) + 4 * pow(depth, 2)) / (8 * depth);
  direction = inverted ? -1 : 1;

	rotate([90-tilt,0,0]){
	  translate([0,chord_length * direction,0]){
	    cylinder(h=height + 20, r=rad, center=true);
    }
  }
}

module spherical_dish(width, height, depth, inverted, tilt, txt=""){
	// honestly 1 has problems around 6.25 but its already ridiculously slow
	$fa=3;
	//same thing as the cylindrical dish here, but we need the corners to just touch - so we have to find the hypotenuse of the top
	chord = pow((pow(width,2) + pow(height, 2)),0.5); //getting diagonal of the top

	// the distance you have to move the dish up so it digs in depth millimeters
	chord_length = (pow(chord, 2) - 4 * pow(depth, 2)) / (8 * depth);
	//the radius of the dish
	rad = (pow(chord, 2) + 4 * pow(depth, 2)) / (8 * depth);
  direction = inverted ? -1 : 1;

	/*intersection(){*/
		rotate([-tilt,0,0]){
			translate([0,0,chord_length * direction]){
			  //NOTE: if your dish is long at all you might need to increase $fn
				sphere(r=rad);
	    }
		}
		// this line causes openscad to die. maybe re-enable when that doesn't happen instead of differencing the inside() when we add the dish to the shape()
		/*translate([0,0,0]) roundedRect([width, height, depth], 1.5);*/
	/*}*/
}

module sideways_cylindrical_dish(width, height, depth, inverted, tilt){
	$fa=1;
	chord_length = (pow(height, 2) - 4 * pow(depth, 2)) / (8 * depth);
	rad = (pow(height, 2) + 4 * pow(depth, 2)) / (8 * depth);

  direction = inverted ? -1 : 1;

	rotate([90,tilt,90]){
		translate([0,chord_length * direction,0]){
			cylinder(h = width + 20,r=rad, center=true); // +20 for fudge factor
		}
	}
}
