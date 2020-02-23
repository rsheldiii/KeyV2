include <../includes.scad>

/*
In this example, we harness full sculpting and simple_layout to make a set of SA
keys that look a lot like the key wells on a dactyl, dactyl manuform, or kinesis

SA keys render faster with skin_extrude_shape = true, but then they don't get
the nice flaring on the sides... yet.
*/

// to turn on full sculpting
$double_sculpted = true;
// to make the font fit
$font_size = 4;

// change this to make the full sculpting more or less aggressive. 200 is default
$double_sculpt_radius = 200;

// This is the exact column stagger from the dactyl transposed onto the
// rows of the preonic default layout. the second array is for modifying the
// values up or down - making all the 0's -1's would make each key 1mm lower
// for instance. I'd suggest going as low as you can without cutting off any stems
extra_column_height = [5.64, 5.64, 0, -3, 0, 0, 0, 0, 0, -3, 0, 5.64, 5.64] + [0,0,0,0,0,0,0,0,0,0,0,0,0];
// required for double_sculpted_column
row_length = len(preonic_default_layout[0]);

simple_layout(preonic_default_layout) {
  // this union is here because, for some reason, you cannot modify special variables
  // that are modified in the scope directly above.
  union() {
    // row declarations treat column 0 as perfectly center, so if we just used
    // $column we'd have a ridiculously looking left-leaning keyboard.
    // this function transforms the actual column value into a "2hands" column
    // value, aka for a board with 2 "keywells", one for each hand
    column_value = double_sculpted_column($column, row_length, "2hands");
    /* echo("column value", column_value); */
    sa_row($row+1, column_value){
      // uh oh, now I need two of them...
      union() {
        // uncomment when prototyping for faster prototypes!
        /* $dish_type = "disable"; */
        /* $stem_support_type = "disable"; */

        // here's where the magic happens and we actually add the extra column height
        $total_depth = $total_depth + extra_column_height[$column];
        key();

        // this generates separate legends for the keys
        /* legend(preonic_default_legends[$row][$column]) legends(); */
      }
    }
  }
}
