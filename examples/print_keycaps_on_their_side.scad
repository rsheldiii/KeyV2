include <../includes.scad>

/* Printing keycaps on their side is an easy way to get a nice, smooth top
   surface, with some caveats:
   1. one of the sides won't look as good as the other
   2. any amount of top tilt makes the sides of the keycap not flat, so we have
      to force them to be flat by making the keytop a trapezoid

  sideways() does the magic for you.

  Note that this won't work at all with side sculpted keycaps, skin_shape_hull,
  and double sculpted aka full sculpted keycaps either. Getting it to work with
  skin_shape_hull is the easiest, getting it to work with full sculpting is a
  lot harder, and side sculpting is obviously impossible by nature
*/

legends = ["F1", "1", "q", "a", "z"];
for (x = [0:4]) {
  translate_u(0,-x) dcs_row(x) sideways() front_legend(legends[x], size=5) {
    $stem_support_type = "disable";
    $dish_type = "disable";

    /* $top_tilt = 30; */
    union() {
      key();
    }
  }
}
