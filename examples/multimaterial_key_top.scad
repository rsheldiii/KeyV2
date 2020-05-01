include <../includes.scad>

/* use this file to generate multimaterial models for making keycaps with a
   different material for the key top.

   This would be great to use with flexible filament, to make squishy-topped
   keys.

   You don't need a multimaterial printer to use these files since it's hard
   height cutoff. You could print the bottom, leave the prints on the bed, and
   then print the top in a different material. Be careful though! your start
   gcode may crash into the prints.
*/

depth = 1;
// swap the debug()s to render opposite part
/* debug() */ difference() { // intersection() {
  key();
  top_of_key() {
    translate([-total_key_width(),-total_key_height(),-$total_depth - depth]) cube([total_key_width()*2, total_key_height()*2, $total_depth]);
  }
}

debug() intersection() {
  key();
  top_of_key() {
    translate([-total_key_width(),-total_key_height(),-$total_depth - depth]) cube([total_key_width()*2, total_key_height()*2, $total_depth]);
  }
}
