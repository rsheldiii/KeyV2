/*use <key.scad>*/
// NEED to include, not use this, even with the default variables set. don't know why
include <keys.scad>

60_percent = [
  [1,1,1,1,1,1,1,1,1,1,1,1,1,2],
  [1.5,1,1,1,1,1,1,1,1,1,1,1,1,1.5],
  [1.75,1,1,1,1,1,1,1,1,1,1,1,2.25],
  [2.25,1,1,1,1,1,1,1,1,1,1,2.75],
  [1.25,1.25,1.25,6.25,1.25,1.25,1.25,1.25]
];

function sum(list, x=0) =
  len(list) <= 1 ?
    x + list[0] :
    sum([for (x = [1: len(list) - 1]) list[x]], x+list[0]);

for (row = [0:len(60_percent)-1]){
  for(column = [0:len(60_percent[row])-1]) {
    columnDist = sum([for (x = [0 : column]) 60_percent[row][x]]);
    a = 60_percent[row][column];
    translate_u(columnDist - (a/2), -row) dishless() dcs_row((row+4) % 5 + 1) u(a) cherry() {
      $width_difference = 0;
      $height_difference = 0;
      $key_shape_type  = "spherical";
      if (a != 6.25) {
        key();
      } else {
        spacebar() key();
      }
    }
  }
}
