
// the point of this file is to be a sort of DSL for constructing keycaps.
// when you create a method chain you are just changing the parameters
// key.scad uses, it doesn't generate anything itself until the end. This
// lets it remain easy to use key.scad like before (except without key profiles)
// without having to rely on this file. Unfortunately that means setting tons of
// special variables, but that's a limitation of SCAD we have to work around

include <./includes.scad>
include <src/libraries/round-anything/polyround.scad>


// example key
/* $stem_throw = 1; */
/* $stem_type = "custom"; */
$outset_legends = true;
/* $hull_shape_type = "linear extrude"; */

/* dcs_row(5) iso_enter() front_legend("j") key(); */
$stabilizer_type = "cherry_stabilizer";
$stem_support_type = "disabled";
 /* $stem_rotation=90; */

/* $skin_extrude_shape = true; */


dcs_row(1) spacebar() uh(1.5){
  /* $top_tilt = -6; */
  key();
}

/* $rounded_key = true; */

/* sa_row(1) key(); */
// example row

// example layout


/* %side_rounded_square([10,10], 0.5); */
/* translate([00,0,0]) polygon(new_side_rounded_square([10,10], 0.5)); */
