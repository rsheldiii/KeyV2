include <../includes.scad>

/* here's how to use the legends() command.
   The first argument is the legend itself, which can also be a whole string.
   The second argument is the "position" of the legend relative to center.
   Legends currently have to all be inset or outset at the same time, but you
   can have as many of them as you want.
   The numbers used are some magic constant, so just fudge them until it looks good.
*/

/* $outset_legends = true; */
legends = ["A", "b", "c", "uwu"];

$font_size = 4;

for (x=[0,1,2,3,4]) {
  for(y=[1,2,3])
  translate_u(y * y / 2,x) {
    u(y) cherry_row(x)
    legend(legends[0], [-1,-1]) {
      legend(legends[1], [1,-1]) {
        legend(legends[2], [-1,1]) {
          legend(legends[3], [-.8,0]) {
            key();
          }
        }
      }
    }
  }
}
