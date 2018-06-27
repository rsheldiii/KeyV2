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

translate_u(0, 0) sa_row(3) stepped_caps_lock() {
  key();
}

translate_u(0, 1) sa_row(2) lshift() {
  $stem_type = false;
  key();
}

translate_u(0, 2) sa_row(1) spacebar() alps() {
  $support_type = false;
  key();
}
