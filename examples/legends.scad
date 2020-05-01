include <../includes.scad>

/* here's how to use the legends() command.
   The first argument is the legend itself, which can also be a whole string.
   The second argument is the "position" of the legend relative to center.
   Legends currently have to all be inset or outset at the same time, but you
   can have as many of them as you want.
   The numbers used are some magic constant, so just fudge them until it looks good.
*/

/* $outset_legends = true; */
legends = [
  ["a", "b", "c", "d"],
  ["e", "f", "g", "h"],
  ["i", "j", "k", "l"],
];

$font_size = 4;

for (x=[0:len(legends)-1]) {
  translate_u(x,0) {
    legend(legends[x][0], [-1,-1]) {
      legend(legends[x][1], [-1,1]) {
        legend(legends[x][2], [1,-1]) {
          front_legend(legends[x][3]) {
            key();
          }
        }
      }
    }
  }
}
