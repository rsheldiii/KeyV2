// the point of this file is to be a sort of DSL for constructing keycaps.
// when you create a method chain you are just changing the parameters
// key.scad uses, it doesn't generate anything itself until the end. This
// lets it remain easy to use key.scad like before (except without key profiles)
// without having to rely on this file. Unfortunately that means setting tons of
// special variables, but that's a limitation of SCAD we have to work around

include <./includes.scad>


// $rounded_key = true;
// example key
// typewriter_row(5) legend("⇪", size=9) resin() key();

// // example row
// for(y = [0:1:3]) {
//  for (x = [0:1:4]) {
//     translate_u(x + y % 2 * 0.5,y) hex_row(x) key();
//   }
// }

// $double_sculpted = true;
// row_length = len(preonic_mit_layout[0]);
// simple_layout(preonic_mit_layout) {
//   $keycap_rotation = 90;
//   // $stem_type = "choc";
//   adjusted_column = [-1, -1/2, 0, 1/2, 0, -1/2, -1/2, 0, 1/2, 0, -1/2, -1];
//   column_value = double_sculpted_column($column, row_length, "2hands");
//   translate_u(0, adjusted_column[$column]) hex_row($row, column_value) {
//     key();
//   }
// }

// $hull_shape_type = "skin";
dsa_row(1) key();
translate_u(1) dsa_row(1) {
  union() {
    // $total_depth = 11;
    $inverted_dish = true;
    key();
  }
}

// example layout
/* preonic_default("dcs") key(); */
