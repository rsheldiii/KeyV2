// the point of this file is to be a sort of DSL for constructing keycaps.
// when you create a method chain you are just changing the parameters
// key.scad uses, it doesn't generate anything itself until the end. This
// lets it remain easy to use key.scad like before (except without key profiles)
// without having to rely on this file. Unfortunately that means setting tons of
// special variables, but that's a limitation of SCAD we have to work around

include <./includes.scad>


// example key
dsa_row(1) legend("Q", size=9) c64() key();

translate([-1.5/2,-1.5/2,0])
cube([1.5,1.5,1.5]);


translate([-5/2,-1.5/2,0])
cube([5,1.5,1.5]);

translate([-0.75,-5/2,0])
cube([1.5,5,1.5]);

// example row
/* for (x = [0:1:4]) {
  translate_u(0,-x) dcs_row(x) key();
} */

// example layout
/* preonic_default("dcs"); */