// the point of this file is to be a sort of DSL for constructing keycaps.
// when you create a method chain you are just changing the parameters
// key.scad uses, it doesn't generate anything itself until the end. This
// lets it remain easy to use key.scad like before (except without key profiles)
// without having to rely on this file. Unfortunately that means setting tons of
// special variables, but that's a limitation of SCAD we have to work around


echo($fa);
echo("WHERES THE BEEF");


include <./includes.scad>
dsa_row(3) {
  union() {
    $key_shape_type="sculpted_square";
    $dish_type="disabled";
    $skin_extrude_shape = true;
    key();
  }
}

/* $inverted_dish = true; */
/* $rounded_key = true; */

/* $linear_extrude_shape=true; */
/* $rounded_key=true; */
/* $outset_legends = true; */
/* $inverted_dish =true; */
/* $dish_type = "pyramid"; */
/* legend("q") key(); */
/* $outset_legends = true; */
 dcs_row(3) {
     /* iso_enter() */
    union() {
      union() {
        /* $minkowski_radius = 10; */
        /* $minkowski_radius = 0.12; */

        /* $key_shape_type = "iso_enter"; */
        $key_shape_type="sculpted_square";
        /* $dish_type ="disable"; */
        /* $inverted_dish = true; */
        /* $stem_type = "disable"; */
        /* $dish_type="3d_surface"; */
        /* $support_type = "disable"; */
        /* $stabilizer_type = "disable"; */
        /* rounded_shape(); */
        /* minkowski() { */

          /* rounded_key(); */
          /* translate([0,0,-200]) cube(10); */


         /* difference(){ */
          /* key(); */
          /* cube(100); */
        /* } */

          /* minkowski_shape(); */
        /* } */
      }
    }
  }

/* translate_u(1,0) {
  oem_row(3) {
    cherry() legend("q")
    union() {
      key();
    }
  }
} */

/* difference() {
  translate([0,0,-.1]) cube(1.1);
  translate([0.5,0.5,-0.5]) polar_3d_surface(step=0.1);
} */


// Written in 2015 by Torsten Paul <Torsten.Paul@gmx.de>
//
// To the extent possible under law, the author(s) have dedicated all
// copyright and related and neighboring rights to this software to the
// public domain worldwide. This software is distributed without any
// warranty.
//
// For details of the CC0 Public Domain Dedication see
// <http://creativecommons.org/publicdomain/zero/1.0/>.

// example row
/* for (x = [0:1:4]) {
  translate_u(0,-x) dcs_row(x) key();
} */

// example layout
/* preonic_default("dcs"); */
