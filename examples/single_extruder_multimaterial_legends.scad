include <../includes.scad>

/* Don't have a multimaterial printer but still want cool "doubleshot" legends?
   with a couple tricks, you can! We just have to print upside down with no
   dish.

   Here's how to use this file:

   1. modify it as you see fit
   2. render the legends and the keycaps separately
   3. run the legends through your 3d printer. make sure they are a single layer
   4. LEAVE THEM on the bed
   5. change filaments
   6. run the keycaps over the legends. MAKE SURE they line up! PrusaSlicer
      centers models on the bed
   7. voila!
   8. use a powder-coated bed for extra points
*/

legends = ["F1", "1", "q", "a", "z", ""];
for (x = [0:1:4]) {
  translate_u(0,-x) dcs_row(x, 0) upside_down() legend(legends[x]) {
    $dish_type = "disable";
    $inset_legend_depth = 0.2; // whatever layer height you use

    union() {
      // swap the debug()s to render opposite part
      debug() key(true);
      /* debug() */ dished() {
        legends($inset_legend_depth);
      }
    }
  }
}
