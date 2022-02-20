module keytext(text, position, font_size, depth) {
  woffset = (top_total_key_width()/3.5) * position[0];
  hoffset = (top_total_key_height()/3.5) * -position[1];
  translate([woffset, hoffset, -depth]){
    color($tertiary_color) linear_extrude(height=$dish_depth + depth){
      // Allows for dual top keytext
      if(is_list(text)&&len(text)==2){
        translate([0, (top_total_key_height()/4.25), 0]) text(text=text[0], font=$font, size=font_size*.70, halign="center", valign="center");
        translate([0, -(top_total_key_height()/4.25), 0]) text(text=text[1], font=$font, size=font_size*.70, halign="center", valign="center");
      }
      else {
        text(text=text, font=$font, size=font_size, halign="center", valign="center");
      }
    }
  }
}

module legends(depth=0) {
  if (len($front_legends) > 0) {
    front_of_key() {
      for (i=[0:len($front_legends)-1]) {
        rotate([90,0,0]) keytext($front_legends[i][0], $front_legends[i][1], $front_legends[i][2], depth);
  	  }
    }
  }
  if (len($legends) > 0) {
    top_of_key() {
      for (i=[0:len($legends)-1]) {
        keytext($legends[i][0], $legends[i][1], $legends[i][2], depth);
      }
    }
  }
}
