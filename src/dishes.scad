include <libraries/geodesic_sphere.scad>

include <dishes/cylindrical.scad>
include <dishes/old_spherical.scad>
include <dishes/sideways_cylindrical.scad>
include <dishes/spherical.scad>
include <dishes/squared_spherical.scad>
include <dishes/squared_scoop.scad>
include <dishes/flat.scad>
include <dishes/3d_surface.scad>

//geodesic looks much better, but runs very slow for anything above a 2u
geodesic=false;

//dish selector
module  dish(width, height, depth, inverted) {
    if($dish_type == "cylindrical"){
      cylindrical_dish(width, height, depth, inverted);
    } else if ($dish_type == "spherical") {
      spherical_dish(width, height, depth, inverted);
    } else if ($dish_type == "sideways cylindrical"){
      sideways_cylindrical_dish(width, height, depth, inverted);
    } else if ($dish_type == "old spherical") {
      old_spherical_dish(width, height, depth, inverted);
    } else if ($dish_type == "3d surface") {
      3d_surface_dish(width, height, depth, inverted);
    } else if ($dish_type == "flat") {
      flat_dish(width, height, depth, inverted);
    } else if ($dish_type == "disable") {
      // else no dish
    } else if ($dish_type == "squared spherical") {
      squared_spherical_dish(width, height, depth, inverted=inverted);
    } else if ($dish_type == "squared scoop") {
      squared_scoop_dish(width, height, depth, inverted=inverted);
    } else {
      echo("WARN: $dish_type unsupported");
    }
}
