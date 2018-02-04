// the point of this file is to be a sort of DSL for constructing keycaps.
// when you create a method chain you are just changing the parameters
// key.scad uses, it doesn't generate anything itself until the end. This
// lets it remain easy to use key.scad like before (except without key profiles)
// without having to rely on this file. Unfortunately that means setting tons of
// special variables, but that's a limitation of SCAD we have to work around

//TODO duplicate def to not make this a special var. maybe not worth it
unit = 19.05;

use <src/key.scad>

include <src/settings.scad>
include <src/key_sizes.scad>
include <src/key_profiles.scad>
include <src/key_types.scad>
include <src/key_transformations.scad>

module translate_u(x=0, y=0, z=0){
  translate([x * unit, y*unit, z*unit]) children();
}

// basic
cherry() key();

translate_u(1) sa_row(2) cherry() key("q");
translate_u(2) oem_row(2) alps() key("q", inset=true);
translate_u(3) dsa_row() flat_support() rounded_cherry() key();

translate_u(1, 1) sa_row(3) lshift() cherry() key(inset=true) {
  sphere(1);
};

translate_u(3, 2) sa_row(3) bar_support() spacebar() cherry() key("space bar");

translate_u(3,1) sa_row(3) 2u() cherry() {
  $key_shape_type = "oblong";
  $support_type = false;
  $inverted_dish = true;
  key();
}


/* // g20 / dsa sculpting test
for (x = [1:5]) {
  translate_u(0, x) dsa_row(x) cherry() key();
  translate_u(1, x) g20_row(x) cherry() key();
} */
