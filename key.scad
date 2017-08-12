include <variables.scad>
include <util.scad>
include <stems.scad>
include <dishes.scad>
/* [Settings] */

// keytop thickness, aka how many millimeters between the inside and outside of the top surface of the key
keytop_thickness = 1;
// wall thickness, aka the thickness of the sides of the keycap. note this is the total thickness, aka 3 = 1.5mm walls
wall_thickness = 3;
/* [Brim] */
//brim radius. 11 ensconces normal keycap stem in normal keycap
brim_radius = 8;
//brim depth
brim_depth = .3;
//whether stabilizer connectors are enabled
stabilizers = false;
// how inset the stem is from the bottom of the key. experimental. requires support
stem_inset = 0;
// stem offset in units NOT MM. for stepped caps lock basically
stem_offset = 0;



/* [Key profile] */

// width of the very bottom of the key
bottom_key_width = 18.16;
// height (from the front) of the very bottom of the ke
bottom_key_height = 18.16;
// how much less width there is on the top. eg top_key_width = bottom_key_width - width_difference
width_difference = 6;
// how much less height there is on the top
height_difference = 4;
// how deep the key is, before adding a dish
total_depth = 11.5;
// the tilt of the dish in degrees. divided by key height
top_tilt = -6;
// how skewed towards the back the top is (0 for center)
top_skew = 1.7;
// what type of dish the key has. 0 for cylindrical, 1 for spherical, 2 for something else idk TODO
dish_type = 0;
// how deep the dish 'digs' into the top of the keycap. this is max depth, so you can't find the height from total_depth - dish_depth. besides the top is skewed anyways
dish_depth = 1;
// how skewed in the x direction the dish is
dish_skew_x = 0;
// how skewed in the y direction (height) the dish is
dish_skew_y = 0;
//length in units of key
key_length = 1;
//height in units of key. should remain 1 for most uses
key_height = 1;
//print brim for connector to help with bed adhesion
has_brim = false;
// invert dishing. mostly for spacebar
inverted_dish = false;
// array of positions of all stems. includes stabilizers as well, for now
// ternary is a bad hack to keep the stabilizers flag working
connectors = stabilizers ? [[0,0],[-50,0],[50,0]] : [[0,0]];
// whether or not we use the functions to generate an ISO enter
// NOTE this uses data in the profile so be sure to set the profile to ISO enter too
ISOEnter = false;
//should the key be rounded? unnecessary for most printers, and very slow
rounded_key = false;
// cherry MX or Alps stem, or totally broken circular cherry stem [0..2]
stem_profile = 0;

/* [Hidden] */
//change to round things better
$fn = 32;
//beginning to use unit instead of baked in 19.05
unit = 19.05;
//minkowski radius. radius of sphere used in minkowski sum for minkowski_key function. 1.75 default for faux G20
minkowski_radius = 1.75;


// derived variables

// actual mm key width and height
function total_key_width() = $bottom_key_width + (unit * ($key_length - 1));
function total_key_height() = $bottom_key_height + (unit * ($key_height - 1));

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + (unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + (unit * ($key_height - 1)) - $height_difference;

// bottom clipping shape we can use to anchor the stem, just a big ol cube with the inside of
// the keycap hollowed out
module inside(){
	difference(){
		//TODO why 50?
		translate([0,0,50]) cube([100000,100000,100000],center=true);
		shape(wall_thickness, keytop_thickness);
	}
}

// conicalish clipping shape to trim things off the outside of the keycap
// literally just a key with height of 2 to make sure nothing goes awry with dishing etc
module outside(thickness_difference){
	difference(){
		cube([100000,100000,100000],center = true);
		shape_hull(thickness_difference, 0, 2);
	}
}

//key shape including dish. used as the ouside and inside shape in key()
module shape(thickness_difference, depth_difference){
	difference(){
		union(){
			shape_hull(thickness_difference, depth_difference, 1);
			if ($inverted_dish) { dish(depth_difference); }
		}
		if (!$inverted_dish) { dish(depth_difference); }
		outside(thickness_difference);
	}
}

// shape of the key but with soft, rounded edges. much more realistic, much more complex
module rounded_shape() {
	minkowski(){
		shape(minkowski_radius*2, minkowski_radius);
		difference(){
			sphere(r=minkowski_radius, $fn=24);
			translate([0,0,-minkowski_radius])
				cube([2*minkowski_radius,2*minkowski_radius,2*minkowski_radius], center=true);
		}
	}
}

// basic key shape, no dish, no inside
// modifier multiplies the height and top differences of the shape,
// which is only used for dishing to cut the dish off correctly
// $height_difference used for keytop thickness
module shape_hull(thickness_difference, depth_difference, modifier){
	if ($ISOEnter) {
		ISOEnterShapeHull(thickness_difference, depth_difference, modifier);
	} else {
		hull(){
			// $bottom_key_width + ($key_length -1) * unit is the correct length of the
			// key. only 1u of the key should be $bottom_key_width long; all others
			// should be 1u
			roundedRect([total_key_width() - thickness_difference, total_key_height() - thickness_difference, .001],1.5);

			//depth_difference outside of modifier because that doesnt make sense
			translate([0,$top_skew,$total_depth * modifier - depth_difference]){
				rotate([-$top_tilt / $key_height,0,0]){
					roundedRect([
						total_key_width()  - thickness_difference - $width_difference  * modifier,
						total_key_height() - thickness_difference - $height_difference * modifier,
						.001
					],1.5);
				}
			}
		}
	}
}

//dish selector
module dish(depth_difference){
	translate([$dish_skew_x, $top_skew + $dish_skew_y, $total_depth - depth_difference]){
		if($dish_type == 0){ // cylindrical dish
			cylindrical_dish(top_total_key_width(), $dish_depth, $inverted_dish, $top_tilt / $key_height);
		}
		else if ($dish_type == 1) { // spherical dish
			spherical_dish(top_total_key_width(), $dish_depth, $inverted_dish, $top_tilt / $key_height);
		}
		else if ($dish_type == 2){ // SIDEWAYS cylindrical dish - used for spacebar
			sideways_cylindrical_dish(top_total_key_width(), $dish_depth, $inverted_dish, $top_tilt / $key_height);
		}
		// else no dish
	}
}

//whole connector, alps or cherry, trimmed to fit
module connector(){
	difference(){
		if($stem_profile == 0) {
			cherry_stem();
		} else if ($stem_profile == 1) {
			alps_stem();
		} else if ($stem_profile == 2) {
			cherry_stem_rounded();
		}
		inside();
	}
}

module brim() {
	cylinder(r=brim_radius,h=brim_depth);
}

module keytop() {
	echo($key_length);
	difference(){
		if ($rounded_key) {
			rounded_shape();
		} else {
			shape(0, 0);
		}
		shape(wall_thickness, keytop_thickness);
	}
}

//actual full key with space carved out and keystem/stabilizer connectors
// this is an example key with all the fixins
module key(){
	$bottom_key_width = bottom_key_width;
	$bottom_key_height = bottom_key_height;
	$width_difference = width_difference;
	$height_difference = height_difference;
	$total_depth = total_depth;
	$top_tilt = top_tilt;
	$top_skew = top_skew;
	$dish_type = dish_type;
	$dish_depth = dish_depth;
	$dish_skew_x = dish_skew_x;
	$dish_skew_y = dish_skew_y;
	$key_length = key_length;
	$key_height = key_height;
	$has_brim = has_brim;
	$inverted_dish = inverted_dish;
	$connectors = connectors;
	$ISOEnter = ISOEnter;
	$rounded_key = rounded_key;
	$stem_profile = stem_profile;


	keytop();

	//TODO this stem offset thing is weird here. find a better place for it. its for stepped caps lock
	translate([-unit * stem_offset, 0, 0]){
		for (x = $connectors) {
			translate(x) connector();
		}
	}

	if ($has_brim){
		brim();
	}
}

// ACTUAL OUTPUT
difference(){
	key();
	// preview cube, for seeing inside the keycap
	//cube([100,100,100]);
}

//minkowski_key();


// Experimental stuff

// NOT 3D, NOT CENTERED
// corollary is roundedRect
module fakeISOEnter(thickness_difference){
    z = 0.001;
    radius = 2;
		// 1u is the space taken upy by a 1u keycap.
		// unit is the space taken up by a unit space for a keycap.
		// formula is 1u + unit *(length - 1)

		// t is all modifications to the polygon array
		// could do map but can scad even do map?
		t = radius + thickness_difference/2;

		function unit(length) = 19.02 * (length) + (18.16 - 19.02);

    pointArray = [
        [         0 + t,             0 + t],
        [unit(1.5)  - t,             0 + t],
        [unit(1.5)  - t,      unit(1)  - t],
        [unit(1.25) - t,      unit(1)  - t],
        [unit(1.25) - t,      unit(2)  - t],
        [         0 + t,      unit(2)  - t]
    ];

    minkowski(){
        circle(r=radius, $fn=24);
				polygon(points=pointArray);
    }
}

//corollary is shape_hull
module ISOEnterShapeHull(thickness_difference, depth_difference, modifier){
    function unit(length) = 19.02 * (length) + (18.16 - 19.02);
		height = 8 - depth_difference;

    translate([unit(-0.25), unit(.5)]) linear_extrude(height=height*modifier, scale=[.8, .9]){
        translate([unit(-.5), unit(-1.5)]) minkowski(){
            fakeISOEnter(thickness_difference);
        }
    }
}
