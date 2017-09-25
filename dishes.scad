include <libraries/geodesic_sphere.scad>
include <util.scad>
//geodesic looks much better, but runs very slow for anything above a 2u
geodesic=false;

//dish selector
module  dish(width, height, depth, inverted, tilt) {
		if($dish_type == "cylindrical"){
			cylindrical_dish(width, height, depth, inverted, tilt);
		}
		else if ($dish_type == "spherical") {
			spherical_dish(width, height, depth, inverted, tilt);
		}
		else if ($dish_type == "sideways cylindrical"){
			sideways_cylindrical_dish(width, height, depth, inverted, tilt);
		}
		// else no dish, "no dish" is the value
}

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

module spherical_dish(width, height, depth, inverted, tilt, txt=""){

	//same thing as the cylindrical dish here, but we need the corners to just touch - so we have to find the hypotenuse of the top
	chord = pow((pow(width,2) + pow(height, 2)),0.5); //getting diagonal of the top

	// the distance you have to move the dish up so it digs in depth millimeters
	chord_length = (pow(chord, 2) - 4 * pow(depth, 2)) / (8 * depth);
	//the radius of the dish
	rad = (pow(chord, 2) + 4 * pow(depth, 2)) / (8 * depth);
  direction = inverted ? -1 : 1;

	/*intersection(){*/
		rotate([-tilt,0,0]){
			translate([0,0,0 * direction]){
				if (geodesic){
					$fa=10;
					geodesic_sphere(r=rad);
				} else {
					$fa=1;
					// rotate 1 because the bottom of the sphere looks like trash.
					scale([chord/2/depth, chord/2/depth]) {
						geodesic_sphere(r=depth);
					}
				}
	    }
		}
		// this line causes openscad to die. maybe re-enable when that doesn't happen instead of differencing the inside() when we add the dish to the shape()
		/*translate([0,0,0]) roundedRect([width, height, depth], 1.5);*/
	/*}*/
}

//the older, 'more accurate', and MUCH slower spherical dish.
// generates the largest sphere possible that still contains the chord we are looking for
// much more graduated curvature at an immense cost
module old_spherical_dish(width, height, depth, inverted, tilt, txt=""){

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
				if (geodesic){
					$fa=3;
					geodesic_sphere(r=rad);
				} else {
					$fa=1;
					// rotate 1 because the bottom of the sphere looks like trash.
					%difference() {
						sphere(r=rad);
						translate([0,0,rad]) cube(rad*2, center=true);
					}
				}
	    }
		}
		// this line causes openscad to die. maybe re-enable when that doesn't happen instead of differencing the inside() when we add the dish to the shape()
		/*translate([0,0,0]) roundedRect([width, height, depth], 1.5);*/
	/*}*/
}
