// the point of this file is to be a sort of DSL for constructing keycaps.
// when you create a method chain you are just changing the parameters
// key.scad uses, it doesn't generate anything itself until the end. This
// lets it remain easy to use key.scad like before (except without key profiles)
// without having to rely on this file. Unfortunately that means setting tons of
// special variables, but that's a limitation of SCAD we have to work around

use <src/key.scad>

include <src/settings.scad>
include <src/key_sizes.scad>
include <src/key_profiles.scad>
include <src/key_types.scad>
include <src/key_transformations.scad>

module translate_u(x=0, y=0, z=0){
  translate([x * unit, y*unit, z*unit]) children();
}

// row 5 is commonly the top row, for whatever reason
key_profiles = ["dcs", "oem", "sa", "g20", "dsa"];

module one_single_key(profile, row, unsculpted) {
   key_profile(profile, unsculpted ? 3 : row) cherry() key();
}

module one_row_profile(profile, unsculpted = false) {
  rows = [5, 1, 2, 3, 4];
  for(row = [0:len(rows)-1]) {
    translate_u(0, -row) one_single_key(profile, rows[row], unsculpted);
  }
}

for (p = [0:len(key_profiles)-1]) {
  translate_u(p){
    /* one_row_profile(key_profiles[p]); */
  }
}

/* translate_u(0, 0) one_row_profile("oem"); */
/* dsa_row(3) u(1) uh(1) cherry() key(); */

translate_u(0) sa_row(3) cherry() {
  key();
}

translate_u(1) sa_row(2) cherry() {
  key();
}

translate_u(2) sa_row(1) cherry() {
  key();
}

/* sculpted_square_shape([19,19], [0,0], 0.3);
translate([26,0,0]) rounded_square_shape([19,19], [0,0], 0.3); */
