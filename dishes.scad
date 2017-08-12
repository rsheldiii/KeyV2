module cylindrical_dish(top_total_key_width, dish_depth, inverted_dish, top_tilt){
	/* we do some funky math here
	 * basically you want to have the dish "dig in" to the keycap x millimeters
	 * in order to do that you have to solve a small (2d) system of equations
	 * where the chord of the spherical cross section of the dish is
	 * the width of the keycap.
	 */
	// the distance you have to move the dish so it digs in dish_depth millimeters
	chord_length = (pow(top_total_key_width, 2) - 4 * pow(dish_depth, 2)) / (8 * dish_depth);
	//the radius of the dish
	rad = (pow(top_total_key_width, 2) + 4 * pow(dish_depth, 2)) / (8 * dish_depth);
  direction = inverted_dish ? -1 : 1;

	rotate([90-top_tilt,0,0]){
	  translate([0,chord_length * direction,0]){
	    cylinder(h=100,r=rad, $fn=1024, center=true);
    }
  }
}

module spherical_dish(top_total_key_width, dish_depth, inverted_dish, top_tilt){
	//same thing as the cylindrical dish here, but we need the corners to just touch - so we have to find the hypotenuse of the top
	chord = pow((pow(top_total_key_width,2) + pow(top_total_key_height(), 2)),0.5); //getting diagonal of the top

	// the distance you have to move the dish up so it digs in dish_depth millimeters
	chord_length = (pow(chord, 2) - 4 * pow(dish_depth, 2)) / (8 * dish_depth);
	//the radius of the dish
	rad = (pow(chord, 2) + 4 * pow(dish_depth, 2)) / (8 * dish_depth);
  direction = inverted_dish ? -1 : 1;

	rotate([-top_tilt,0,0]){
		translate([0,0,chord_length * direction]){
		  //NOTE: if your dish is long at all you might need to increase $fn
		  sphere(r=rad, $fn=512);
    }
  }
}

module sideways_cylindrical_dish(top_total_key_width, dish_depth, inverted_dish, top_tilt){
	chord_length = (pow(top_total_key_height(), 2) - 4 * pow(dish_depth, 2)) / (8 * dish_depth);
	rad = (pow(top_total_key_height(), 2) + 4 * pow(dish_depth, 2)) / (8 * dish_depth);

  direction = inverted_dish ? -1 : 1;

	rotate([90,top_tilt,90]){
		translate([0,chord_length * direction,0]){
			cylinder(h=total_key_width + 20,r=rad, $fn=1024, center=true); // +20 just cuz
		}
	}
}
