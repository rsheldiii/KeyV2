// the point of this file is to be a sort of DSL for constructing keycaps.
// when you create a method chain you are just changing the parameters
// key.scad uses, it doesn't generate anything itself until the end. This
// lets it remain easy to use key.scad like before (except without key profiles)
// without having to rely on this file. Unfortunately that means setting tons of
// special variables, but that's a limitation of SCAD we have to work around

include <./includes.scad>


// example key
dcs_row(5) legend("⇪", size=9) key();

// different font legends
translate_u(0,-1) dsa_row(3) legend("A", position=[-1,-1], size=4, font_name="Arial") legend("%", position=[1,0], size=3, font_name="Arial Rounded MT Bold")key();

// example row
/* for (x = [0:1:4]) {
  translate_u(0,-x) dcs_row(x) key();
} */

// example layout
/* preonic_default("dcs"); */