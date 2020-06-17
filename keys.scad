// the point of this file is to be a sort of DSL for constructing keycaps.
// when you create a method chain you are just changing the parameters
// key.scad uses, it doesn't generate anything itself until the end. This
// lets it remain easy to use key.scad like before (except without key profiles)
// without having to rely on this file. Unfortunately that means setting tons of
// special variables, but that's a limitation of SCAD we have to work around

include <./includes.scad>


// example key
/* $skin_key_shape = true; */

difference() {
  /* top_of_key() { */
    /* cube(10); */
  /* } */
  /* key(); */
}

/* simple_layout(lets_split_layout) {
  dcs_row($row) key();
} */

dcs_row(1) legend("h") front_legend("q"
) {
  $key_length = 2.75;
    key();
}

translate_u(0,1) dcs_row(1) {
  $key_length = 0.86;
  key();
}

/* debug() key(); */


// example row
/* for (x = [0:1:4]) {
  translate_u(0,-x) dcs_row(x) key();
} */

// example layout
/* preonic_default("dcs"); */
