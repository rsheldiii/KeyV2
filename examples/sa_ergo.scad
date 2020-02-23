include <../includes.scad>

$double_sculpted = true;

$font_size = 4;
extra_column_height = [5.64, 5.64, 0, -3, 0, 0, 0, 0, 0, -3, 0, 5.64, 5.64] + [0,0,0,0,0,0,0,0,0,0,0,0,0];
row_length = len(preonic_default_layout[0]);

simple_layout(preonic_default_layout) {
  // uh oh, now I need two of them...
  union() {
    column_value = double_sculpted_column($column, row_length, "2hands");
    echo("column value", column_value);
    sa_row($row+1, column_value){
      // this union is here because, for some reason, you cannot modify the
      // variables dcs_row and other row decs modify in the scope below them.
      union() {
        /* $dish_type = "disable"; */
        $stem_support_type = "disable";
        $total_depth = $total_depth + extra_column_height[$column];
        /* key(); */
        dished(){
          legend(preonic_default_legends[$row][$column]) legends($inset_legend_depth);
        }
      }
    }
  }
}
