include <../includes.scad>

/* in this example we'll use some openSCAD to generate files for printing inset
   legends with a multimaterial printer.
*/

legends = ["F1", "1", "q", "a", "z", ""];
for (x = [0:1:4]) {
  translate_u(0,-x) legend(legends[x]) dcs_row(x, 0) {
    // swap the debug()s to render opposite part
    debug() key(true);
    /* debug() */ dished() {
      legends($inset_legend_depth);
    }
  }
}
