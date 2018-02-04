include <libraries/geodesic_sphere.scad>

include <dishes/cylindrical.scad>
include <dishes/old_spherical.scad>
include <dishes/sideways_cylindrical.scad>
include <dishes/spherical.scad>

//geodesic looks much better, but runs very slow for anything above a 2u
geodesic=false;

//dish selector
module  dish(width, height, depth, inverted) {
		if($dish_type == "cylindrical"){
			cylindrical_dish(width, height, depth, inverted);
		}
		else if ($dish_type == "spherical") {
			spherical_dish(width, height, depth, inverted);
		}
		else if ($dish_type == "sideways cylindrical"){
			sideways_cylindrical_dish(width, height, depth, inverted);
		}
		else if ($dish_type == "old spherical") {
			old_spherical_dish(width, height, depth, inverted);
		} else {
			// else no dish, "no dish" is the value
			// switchted to actually diffing a cube here due to changes to stems being differenced from the dish instead of the inside
			translate([0,0,500]) cube([width, height, 1000], center=true);
		}
}
