/* [Hidden] */

//change to round things better
$fn = 64;
unit = 19.05;

//scale of inner to outer shape
key_wall_thickness_width  = .8;
key_wall_thickness_height = .8;
key_wall_thickness_depth  = .8;

/* [Key] */

//length in units of key
key_length = 1;


//keycap type, [0:DCS Row 5, 1:DCS Row 1, 2:DCS Row 2, 3:DCS Row 3, 4:DCS Row 4, 5:DSA Row 3, 6:SA Row 1, 7:SA Row 2, 8:SA Row 3, 9:SA Row 4, 10:DCS Row 4 Spacebar]
key_profile = 0;



/* [Brim] */

//connector brim
//enable brim for connector
has_brim = 0;
//brim radius. 11 ensconces normal keycap stem in normal keycap
brim_radius = 11;
//brim depth
brim_depth = .3;



/* [Stabilizers] */

//whether stabilizer connectors are enabled
stabilizers = 0;

//stabilizer distance in mm
stabilizer_distance = 50;


/* [Dish] */

// invert dishing. mostly for spacebar
inverted_dish = 0;

/* [Stem] */

// cherry MX or Alps stem, or totally broken circular cherry stem [0..2]
stem_profile = 0;

// how inset the stem is from the bottom of the key. experimental. requires support
stem_inset = 0;

// stem offset in units NOT MM. for stepped caps lock
stem_offset = 0;

//profile specific stuff

/*
 Here we have, for lack of a better implementation, an array
 that defines the more intimate aspects of a key.
 order is thus:
 1. Bottom Key Width: width of the immediate bottom of the key
 2. Bottom Key Height: height of the immediate bottom of the key
 3. Top Key Width Difference: mm to subtract from bottom key width to create top key width
 4. Top Key Height Difference: mm to subtract from bottom key height to create top key height
 5. total Depth: how tall the total in the switch is before dishing
 6. Top Tilt: X rotation of the top. Top and dish obj are rotated
 7. Top Skew: Y skew of the top of the key relative to the bottom. DCS has some, DSA has none (its centered)
 8. Dish Type: type of dishing. check out dish function for the options
 9. Dish Depth: how many mm to cut into the key with
 10. Dish Radius: radius of dish obj, the Sphere or Cylinder that cuts into the keycap
*/

key_profiles = [

	//DCS Profile

	[ //DCS ROW 5
		18.16,  // Bottom Key Width
		18.16,  // Bottom Key Height
		6,   // Top Key Width Difference
		4,   // Top Key Height Difference
		11.5, // total Depth
		-6,  // Top Tilt
		1.75,// Top Skew

		//Dish Profile

		0,   // Dish Type
		1,   // Dish Depth
		0,   // Dish Skew X
		0    // DIsh Skew Y
	],
	[ //DCS ROW 1
		18.16,  // Bottom Key Width
		18.16,  // Bottom Key Height
		6,   // Top Key Width Difference
		4,   // Top Key Height Difference
		8.5, // total Depth
		-1,  // Top Tilt
		1.75,// Top Skew

		//Dish Profile

		0,   // Dish Type
		1,   // Dish Depth
		0,   // Dish Skew X
		0    // DIsh Skew Y
	],
	[ //DCS ROW 2
		18.16,  // Bottom Key Width
		18.16,  // Bottom Key Height
		6.2,   // Top Key Width Difference
		4,   // Top Key Height Difference
		7.5, // total Depth
		3,  // Top Tilt
		1.75,// Top Skew

		//Dish Profile

		0,   // Dish Type
		1,   // Dish Depth
		0,   // Dish Skew X
		0    // DIsh Skew Y
	],
	[ //DCS ROW 3
		18.16,  // Bottom Key Width
		18.16,  // Bottom Key Height
		6,   // Top Key Width Difference
		4,   // Top Key Height Difference
		6.2, // total Depth
		7,  // Top Tilt
		1.75,// Top Skew

		//Dish Profile

		0,   // Dish Type
		1,   // Dish Depth
		0,   // Dish Skew X
		0    // DIsh Skew Y
	],
	[ //DCS ROW 4
		18.16,  // Bottom Key Width
		18.16,  // Bottom Key Height
		6,   // Top Key Width Difference
		4,   // Top Key Height Difference
		6.2, // total Depth
		16,  // Top Tilt
		1.75,// Top Skew

		//Dish Profile

		0,   // Dish Type
		1,   // Dish Depth
		0,   // Dish Skew X
		0    // DIsh Skew Y
	],

	//DSA Profile

	[ //DSA ROW 3
	  18.4,  // Bottom Key Width
	  18.4,  // Bottom Key Height
	  5.7, // Top Key Width Difference
	  5.7, // Top Key Height Difference
	  7.4, // total Depth
	  0,   // Top Tilt
	  0,   // Top Skew

	  //Dish Profile

	  1,   // Dish Type
	  1.2, // Dish Depth
	  0,   // Dish Skew X
	  0    // DIsh Skew Y
	],

	//SA Proile

	[ //SA ROW 1
		18.4,  // Bottom Key Width
	  18.4,  // Bottom Key Height
	  5.7, // Top Key Width Difference
	  5.7, // Top Key Height Difference
	  13.73, // total Depth, fudged
	  -14,   // Top Tilt
	  0,   // Top Skew

	  //Dish Profile

	  1,   // Dish Type
	  1.2, // Dish Depth
	  0,   // Dish Skew X
	  0    // DIsh Skew Y
	],
	[ //SA ROW 2
		18.4,  // Bottom Key Width
	  18.4,  // Bottom Key Height
	  5.7, // Top Key Width Difference
	  5.7, // Top Key Height Difference
	  11.73, // total Depth
	  -7,   // Top Tilt
	  0,   // Top Skew

	  //Dish Profile

	  1,   // Dish Type
	  1.2, // Dish Depth
	  0,   // Dish Skew X
	  0    // DIsh Skew Y
	],
	[ //SA ROW 3
		18.4,  // Bottom Key Width
	  18.4,  // Bottom Key Height
	  5.7, // Top Key Width Difference
	  5.7, // Top Key Height Difference
	  11.73, // total Depth
	  0,   // Top Tilt
	  0,   // Top Skew

	  //Dish Profile

	  1,   // Dish Type
	  1.2, // Dish Depth
	  0,   // Dish Skew X
	  0    // DIsh Skew Y
	],
	[ //SA ROW 4
		18.4,  // Bottom Key Width
	  18.4,  // Bottom Key Height
	  5.7, // Top Key Width Difference
	  5.7, // Top Key Height Difference
	  11.73, // total Depth
	  7,   // Top Tilt
	  0,   // Top Skew

	  //Dish Profile

	  1,   // Dish Type
	  1.2, // Dish Depth
	  0,   // Dish Skew X
	  0    // DIsh Skew Y
	],
	[ //DCS ROW 4 SPACEBAR
		18.16,  // Bottom Key Width
		18.16,  // Bottom Key Height
		6,   // Top Key Width Difference
		4,   // Top Key Height Difference
		6.2, // total Depth
		16,  // Top Tilt
		1.75,// Top Skew

		//Dish Profile

		2,   // Dish Type
		1,   // Dish Depth
		0,   // Dish Skew X
		0    // DIsh Skew Y
	],
];

//centered
module roundedRect(size, radius) {
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

//bottom we can use to anchor things
module inside(key_profile)
{
	difference(){
		translate([0,0,50])
		cube([100,100,100],center=true);

		translate([0,0,-.1])
		shape(key_profile, 3);
	}
}

module cherry_stem(){
	// cross length
	cross_length = 4.4;
    //extra vertical cross length - the extra length of the up/down bar of the cross
    extra_vertical_cross_length = 1.1;
	//dimensions of connector
	// outer cross extra length in x
	extra_outer_cross_width = 2.10;
	// outer cross extra length in y
	extra_outer_cross_height = 1.0;
	// dimensions of cross
	// horizontal cross bar width
	horizontal_cross_width = 1.4;
	// vertical cross bar width
	vertical_cross_width = 1.3;
	// cross depth, stem height is 3.4mm
	cross_depth = 4;

	difference(){
		union(){
            if (stem_profile != 2){
                translate([
                    -(cross_length+extra_outer_cross_width)/2,
                    -(cross_length+extra_outer_cross_height)/2,
                    stem_inset
                ])
    			cube([ // the base of the stem, the part the cruciform digs into
					cross_length+extra_outer_cross_width,
					cross_length+extra_outer_cross_height,
					50
    			]);
            } else {
                cylinder(
                    d = cross_length+extra_outer_cross_height,
                    h = 50
                );
            }
			if (has_brim == 1){ cylinder(r=brim_radius,h=brim_depth); }
		}
		//the cross part of the steam
		translate([0,0,(cross_depth)/2 + stem_inset]){
	        cube([vertical_cross_width,cross_length+extra_vertical_cross_length,cross_depth], center=true );
	        cube([cross_length,horizontal_cross_width,cross_depth], center=true );
	    }
	}
}

module alps_stem(){
	cross_depth = 40;
	width = 4.45;
	height = 2.25;

	base_width = 12;
	base_height = 15;

	//translate([0,0,cross_depth + 50/2]) cube([base_width, base_height, 50], center=true);
	translate([0,0,cross_depth/2 + stem_inset]){
		cube([width,height,cross_depth], center = true);
	}
}

//whole connector
module connector(key_profile,has_brim){
	difference(){
		//TODO can I really not do an array index here?
		translate([-unit * stem_offset, 0, 0])
		union(){
			if(stem_profile == 0 || stem_profile == 2) cherry_stem();
			if(stem_profile == 1) alps_stem();
		}
		inside(key_profile);
	}
}

//stabilizer connectors 
module stabilizer_connectors(key_profile,has_brim){
	translate([stabilizer_distance,0,0]) connector(key_profile, has_brim);
	translate([-stabilizer_distance,0,0]) connector(key_profile, has_brim);
}

//i h8 u scad
module shape(key_profile, thickness){

	bottom_key_width = key_profile[0] ;
	bottom_key_height = key_profile[1];
	top_key_width_difference = key_profile[2];
	top_key_height_difference = key_profile[3];
	total_depth = key_profile[4] - thickness;
	top_tilt = key_profile[5];
	top_skew = key_profile[6];

    if (inverted_dish == 1){
		difference(){
			union(){
				shape_hull(key_profile, thickness, 1);
				dish(key_profile, thickness);
			}
			outside(key_profile, thickness);
		}
	}
	else{
		difference(){
			shape_hull(key_profile, thickness, 1);	
			dish(key_profile, thickness);
		}
	}
}

//conicalish clipping shape to trim things off the outside of the keycap
// literally just a key with height of 2 to make sure nothing goes awry with dishing etc
module outside(key_profile, thickness){
	difference(){
		cube([100000,100000,100000],center = true);
		shape_hull(key_profile, thickness, 2);
	}
}

//super basic hull shape without dish
module shape_hull(key_profile, thickness, modifier){
	bottom_key_width = key_profile[0] ;
	bottom_key_height = key_profile[1];
	top_key_width_difference = key_profile[2];
	top_key_height_difference = key_profile[3];
	total_depth = key_profile[4] - thickness;
	top_tilt = key_profile[5];
	top_skew = key_profile[6];

	hull(){
		roundedRect([bottom_key_width*key_length - thickness,bottom_key_height - thickness,.001],1.5);

		translate([0,top_skew,total_depth * modifier])
		rotate([-top_tilt,0,0])
		roundedRect([bottom_key_width*key_length - thickness -top_key_width_difference * modifier,bottom_key_height - thickness -top_key_height_difference * modifier,.001],1.5);
	}
}

//dish selector
module dish(key_profile){ //this thing is a monster
	dish_type = key_profile[7];

	if(dish_type == 0){ // cylindrical dish
		cylindrical_dish(key_profile);
	}
	else if (dish_type == 1) { // spherical dish
		spherical_dish(key_profile);
	}
	else if (dish_type == 2){ // SIDEWAYS cylindrical dish - used for spacebar
		sideways_cylindrical_dish(key_profile);
	}
    else if (dish_type == 3){
    	// no dish
    }
}

module cylindrical_dish(key_profile){ 
	// names, so I don't go crazy
	total_key_width = key_profile[0];
	total_key_height = key_profile[1];
	width_difference = key_profile[2];
	height_difference = key_profile[3];
	total_depth = key_profile[4];
	top_tilt = key_profile[5];
	top_skew = key_profile[6];
	dish_type = key_profile[7];
	dish_depth = key_profile[8];
	dish_skew_x = key_profile[9];
	dish_skew_y = key_profile[10];

	//dependant variables
	key_width = total_key_width * key_length - width_difference;
	key_height = total_key_height - height_difference;

	/* we do some funky math here
	 * basically you want to have the dish "dig in" to the keycap x millimeters
	 * in order to do that you have to solve a small (2d) system of equations
	 * where the chord of the spherical cross section of the dish is
	 * the width of the keycap.
	 */
	// the distance you have to move the dish up so it digs in dish_depth millimeters
	chord_length = (pow(key_width, 2) - 4 * pow(dish_depth, 2)) / (8 * dish_depth);
	//the radius of the dish
	rad = (pow(key_width, 2) + 4 * pow(dish_depth, 2)) / (8 * dish_depth);

	if (inverted_dish == 1){
		translate([dish_skew_x, top_skew + dish_skew_y, total_depth])
		rotate([90-top_tilt,0,0])
		translate([0,-chord_length,0])
		cylinder(h=100,r=rad, $fn=1024, center=true);
	}
	else{
		translate([dish_skew_x, top_skew + dish_skew_y, total_depth])
		rotate([90-top_tilt,0,0])
		translate([0,chord_length,0])
		cylinder(h=100,r=rad, $fn=1024, center=true);
	}

}

module spherical_dish(key_profile){ 
	// names, so I don't go crazy
	total_key_width = key_profile[0];
	total_key_height = key_profile[1];
	width_difference = key_profile[2];
	height_difference = key_profile[3];
	total_depth = key_profile[4];
	top_tilt = key_profile[5];
	top_skew = key_profile[6];
	dish_type = key_profile[7];
	dish_depth = key_profile[8];
	dish_skew_x = key_profile[9];
	dish_skew_y = key_profile[10];

	//dependant variables
	key_width = total_key_width * key_length - width_difference;
	key_height = total_key_height - height_difference;

	//same thing as the cylindrical dish here, but we need the corners to just touch - so we have to find the hypotenuse of the top
	chord = pow((pow(key_width,2) + pow(key_height, 2)),0.5); //getting diagonal of the top

	// the distance you have to move the dish up so it digs in dish_depth millimeters
	chord_length = (pow(chord, 2) - 4 * pow(dish_depth, 2)) / (8 * dish_depth);
	//the radius of the dish
	rad = (pow(chord, 2) + 4 * pow(dish_depth, 2)) / (8 * dish_depth);

	if (inverted_dish == 1){
		translate([dish_skew_x, top_skew + dish_skew_y, total_depth])
        rotate([-top_tilt,0,0])
		translate([0,0,-chord_length])
		sphere(r=rad, $fn=256);
	}
	else{
		translate([dish_skew_x, top_skew + dish_skew_y, total_depth])
        rotate([-top_tilt,0,0])
		translate([0,0,chord_length])
		sphere(r=rad, $fn=256);
	}
}

module sideways_cylindrical_dish(key_profile){
	// names, so I don't go crazy
	total_key_width = key_profile[0];
	total_key_height = key_profile[1];
	width_difference = key_profile[2];
	height_difference = key_profile[3];
	total_depth = key_profile[4];
	top_tilt = key_profile[5];
	top_skew = key_profile[6];
	dish_type = key_profile[7];
	dish_depth = key_profile[8];
	dish_skew_x = key_profile[9];
	dish_skew_y = key_profile[10];

	//dependant variables
	key_width = total_key_width * key_length - width_difference;
	key_height = total_key_height - height_difference;


	chord_length = (pow(key_height, 2) - 4 * pow(dish_depth, 2)) / (8 * dish_depth);
	rad = (pow(key_height, 2) + 4 * pow(dish_depth, 2)) / (8 * dish_depth);

	if (inverted_dish == 1){
		translate([dish_skew_x, top_skew + dish_skew_y, total_depth])
		rotate([90,top_tilt,90])
		translate([0,-chord_length,0])
		cylinder(h=key_width + 20,r=rad, $fn=1024, center=true); // +20 just cuz
	}
	else{
		translate([dish_skew_x, top_skew + dish_skew_y, total_depth])
		rotate([90,top_tilt,90])
		translate([0,chord_length,0])
		cylinder(h=key_width + 20,r=rad, $fn=1024, center=true);
	}
}

//actual full key with space carved out and keystem/stabilizer connectors
module key(key_profile){
	union(){
		difference(){
			shape(key_profile, 0);

			translate([0,0,-.1])
			shape(key_profile, 3);
		}
		connector(key_profile,has_brim);
		if (stabilizers == 1){
			stabilizer_connectors(key_profile,has_brim);
		}
	}
}






// ACTUAL OUTPUT
key(key_profiles[key_profile]);






// non-implemented ISO enter test stuff

// NOT 3D, NOT CENTERED
module fakeISOEnter(){
    z = 0.001;
    radius = 2;
    unit = 18.16; // TODO probably not

    pointArray = [
        [0 + radius,0 + radius],
        [unit*1.25 - radius, 0 + radius],
        [unit*1.25  - radius, unit*2  - radius],
        [unit*-.25 + radius, unit*2  - radius],
        [unit*-.25 + radius, unit*1  + radius],
        [0 + radius, unit*1  + radius]
    ];

    minkowski(){
        circle(r=radius, $fn=24);
        polygon(points=pointArray);
    }
}

module ISOEnterShapeHull(key_profile, thickness, modifier){
    unit = 18.16; // TODO probably not

    bottom_key_width = key_profile[0] ;
    bottom_key_height = key_profile[1];
    top_key_width_difference = key_profile[2];
    top_key_height_difference = key_profile[3];
    total_depth = key_profile[4] - thickness;
    top_tilt = key_profile[5];
    top_skew = key_profile[6];

    top_width_scale_difference = (bottom_key_width - top_key_width_difference) / (bottom_key_width);
    top_height_scale_difference = (bottom_key_width - top_key_width_difference) / (bottom_key_width);

    linear_extrude(height=total_depth*modifier, scale=[top_width_scale_difference, top_height_scale_difference]){
        translate([-unit*.5, -unit*1.5]) minkowski(){
            fakeISOEnter();
        }
    }
}