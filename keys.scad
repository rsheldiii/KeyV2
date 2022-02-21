// the point of this file is to be a sort of DSL for constructing keycaps.
// when you create a method chain you are just changing the parameters
// key.scad uses, it doesn't generate anything itself until the end. This
// lets it remain easy to use key.scad like before (except without key profiles)
// without having to rely on this file. Unfortunately that means setting tons of
// special variables, but that's a limitation of SCAD we have to work around

include <./includes.scad>


// example key
dcs_row(5) legend("⇪", size=9) key();

// example row
/* for (x = [0:1:4]) {
  translate_u(0,-x) dcs_row(x) key();
} */

// example layout
// preonic_default("dcs") key();

// example dual top Legend row
// legend_test=[["{","["],["|","\\"],[":",";"],["?","/"],["_","-"]];
// for (x = [0:1:4]) {
//  translate_u(0,-x) dsa_row() legend(legend_test[x], [0,0,6]) key();
// }

// example dual top layout
// full_size_dual_default("cherry") key();