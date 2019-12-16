/* function addl(list, c = 0) =
  c < len(list) - 1 ?
  list[c] + addl(list, c + 1)
  :
  list[c]; */

function addl(list, c = 0, max=undef) =
  max < c ? 0 :
    (c < len(list) - 1) ? list[c] + addl(list, c + 1, max=max) :
    list[c];

function slidingSum(list, c = 1, max = undef) =
  c < 1 || c > len(list-1) ? 0 :
    c > max ? 0 :
      (list[c] + list[c-1])/2 + addl(list, c + 1, max=max);

module project_zen_default(profile) {
  widths = [1.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.5];
  translations = [0,1.25,2.25,3.25,4.25,5.25,6.25,7.25,8.25,9.25,10.25,11.5];

  for(row = [0:1:4]) {
    $t = 0;
    for(column=[-2.5:0.5:3]) {
      normalized_column = column*2 + 5;
      $key_length = widths[normalized_column];

      translate_u(translations[normalized_column],-row) key_profile(profile, row,floor(column)) {
        key();
      }
    }
  }

  for (row=[0:1:1]) {
    for (column=[0:1:1]) {
      $key_length = 2;
      translate_u(4.75 + row*2, -5 - column) key_profile(profile, 3,0) {
        key();
      }
    }
  }
}
