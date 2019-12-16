// sums all values, unless a value is negative, in which case it makes it positive
// dirty hack to allow for large gaps in keysets
function abs_sum(list, x=0) =
  len(list) <= 1 ?
    x + abs(list[0]) :
    abs_sum([for (x = [1: len(list) - 1]) list[x]], x+abs(list[0]));

module layout(list, profile="dcs", row_sculpting_offset=0, row_override=undef) {
  for (row = [0:len(list)-1]){
    echo("**ROW**:", row);
    row_length = len(list[row]);
    for(column = [0:len(list[row])-1]) {
      row_sculpting = (row_override != undef ? row_override : row) + row_sculpting_offset;
      key_length = list[row][column];

      // check if column is smack in middle of row - if so, no sculpting
      // otherwise try to make two half-moon shapes, one for each side of the board
      // since we are zero indexed, the 7th row has an index of 6 and is the center of 13. 6*2+1 = 13
      double_sculpted_column = (column*2 + 1 == row_length) ? 0 : (column % (row_length/2))  - (row_length/4);

      echo("double_sculpted_column", double_sculpted_column);
      column_distance = abs_sum([for (x = [0 : column]) list[row][x]]);

      if (key_length >= 1) {
        translate_u(column_distance - (key_length/2), -row) key_profile(profile, row_sculpting, double_sculpted_column) u(key_length) cherry() { // (row+4) % 5 + 1
          if (key_length == 6.25) {
            spacebar() key();
          } else if (key_length == 2.25) {
            lshift() key();
          } else if (key_length == 2) {
            backspace() key();
          } else if (key_length == 2.75) {
            rshift() key();
          } else {
            key();
          }
        }
      }
    }
  }
}
