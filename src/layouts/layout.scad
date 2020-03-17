// sums all values, unless a value is negative, in which case it makes it positive
// dirty hack to allow for large gaps in keysets
function abs_sum(list, x=0) =
  len(list) <= 1 ?
    x + abs(list[0]) :
    abs_sum([for (x = [1: len(list) - 1]) list[x]], x+abs(list[0]));

function 2hands(index, total) = ((index+0.5) % (total/2)) - (total/4);
function cresting_wave(index, total, mod=4) = (index < total/2) ? (((index + 0.5) / total)*mod) : -(mod - ((index + 0.5) / total * mod));
function 1hand(index, total) = (index % (total)) - (total/2);


// chooses between all the sculpting options
// checks if column is smack in middle of row - if so, no sculpting
// since we are zero indexed, the 7th row has an index of 6 and is the center of 13. 6*2+1 = 13
function double_sculpted_column(column, row_length, column_sculpt_profile) =
  (column*2 + 1 == row_length) ?
    0 : (column_sculpt_profile == "2hands") ?
      2hands(column, row_length) : (column_sculpt_profile == "1hand") ?
        1hand(column, row_length) : (column_sculpt_profile == "cresting_wave") ?
          cresting_wave(column, row_length) : 0;

module layout(list, profile="dcs", legends=undef, front_legends=undef, row_sculpting_offset=0, row_override=undef, column_sculpt_profile="2hands", column_override=undef) {
  for (row = [0:len(list)-1]){
    /* echo("**ROW**:", row); */
    row_length = len(list[row]);

    for(column = column_override ? column_override : [0:len(list[row])-1]) {
      row_sculpting = (row_override != undef ? row_override : row) + row_sculpting_offset;
      key_length = list[row][column];
      column_value = double_sculpted_column(column, row_length, column_sculpt_profile);
      column_distance = abs_sum([for (x = [0 : column]) list[row][x]]);

      /* echo("\t**COLUMN**", "column_value", column_value, "column_distance", column_distance); */

      // supports negative values for nonexistent keys
      if (key_length >= 1) {
        translate_u(column_distance - (key_length/2), -row) {
        
          key_profile(profile, row_sculpting, column_value) u(key_length) legend(legends ? legends[row][column] : "") front_legend(front_legends ? front_legends[row][column] : "") cherry() { // (row+4) % 5 + 1
          $row = row;
          $column = column;

            if (key_length == 6.25) {
              spacebar() {
                if ($children) {
                  children();
                } else {
                  key();
                }
              }
            } else if (key_length == 2.25) {
              lshift() {
                if ($children) {
                  children();
                } else {
                  key();
                }
              }
            } else if (key_length == 2) {
              backspace() {
                if ($children) {
                  children();
                } else {
                  key();
                }
              }
            } else if (key_length == 2.75) {
              rshift() {
                if ($children) {
                  children();
                } else {
                  key();
                }
              }
            } else {
              {
                if ($children) {
                  children();
                } else {
                  key();
                }
              }
            }
          }
        }
      }
    }
  }
}

// much simpler, decoupled layout function
// requires more setup - it only does what is in the layout array, which is translate
// and key length. you have to do row / column profile yourself and always pass
// children()
// this is probably the way we'll go forward
module simple_layout(list) {
  for (row = [0:len(list)-1]){
    /* echo("**ROW**:", row); */
    for(column = [0:len(list[row])-1]) {
      key_length = list[row][column];
      column_distance = abs_sum([for (x = [0 : column]) list[row][x]]);

      /* echo("\t**COLUMN**", "column_value", column_value, "column_distance", column_distance); */

      // supports negative values for nonexistent keys
      if (key_length >= 1) {
        translate_u(column_distance - (key_length/2), -row) {
          u(key_length) { // (row+4) % 5 + 1
            $row = row;
            $column = column;

            if (key_length == 6.25) {
              spacebar() children();
            } else if (key_length == 2.25) {
              lshift() children();
            } else if (key_length == 2) {
              backspace() children();
            } else if (key_length == 2.75) {
              rshift() children();
            } else {
              children();
            }
          }
        }
      }
    }
  }
}
