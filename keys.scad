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
include <key_sizes.scad>
include <key_profiles.scad>
include <key_types.scad>
include <key_transformations.scad>

module translate_u(x=0, y=0, z=0){
  translate([x * unit, y*unit, z*unit]) children();
}

sa_row(2) u(2) cherry() key();
