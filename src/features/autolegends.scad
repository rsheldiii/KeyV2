module autolegends(depth=0) {
  if (len($front_autolegends) > 0) {
    front_of_key() {
      for (i=[0:len($front_legends)-1]) {
        rotate([90,0,0]) keytext($front_legends[i][0], $front_legends[i][1], $front_legends[i][2], depth);
  	  }
    }
  }
  if (len($autolegends) > 0) {
    // legends are printed in a square grid - 1, 4, 9 legends, etc
    grid_size = len($autolegends)^0.5;
    echo("grid_size", grid_size);
    max_width = (top_total_key_width() - $legend_margin * (grid_size + 1)) / grid_size;
    max_height = (top_total_key_height() - $legend_margin * (grid_size + 1)) / grid_size;

    top_of_key() {
      for (column=[0:grid_size-1]) {
          for (row=[0:grid_size-1]) {
            top_left_corner = [-top_total_key_width()/2, top_total_key_height()/2];
            centering_offset = [max_width / 2, -max_height / 2];
            position_offset = [(max_width + $legend_margin) * column, (-max_height-$legend_margin) * row];
            margin_offset = [$legend_margin, -$legend_margin];

            translate(top_left_corner + centering_offset + position_offset + margin_offset) {
              translate([0,0,-depth]) {
                color($tertiary_color) linear_extrude(height=$dish_depth + depth){
                  // resize([0, max_height, 0]) {
                    resize([max_width, 0], auto=true) {
                      text(text=$autolegends[row * grid_size + column], font=$font, halign="center", valign="center");
                    }
                  // } 
                }
              }
            }
          }
        }
      }
    }
  }
