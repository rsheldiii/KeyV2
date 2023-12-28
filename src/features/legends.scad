use <libraries/text_on.scad>

module keytext(text, position, font_size, depth) {
  woffset = (top_total_key_width()/3.5) * position[0];
  hoffset = (top_total_key_height()/3.5) * -position[1];
  translate([woffset, hoffset, -depth]){
    color($tertiary_color) linear_extrude(height=$dish_depth + depth){
      text(text=text, font=$font, size=font_size, halign="center", valign="center");
    }
  }
}

module keytext_cylindrical(text, position, font_size, depth) {
  woffset = (top_total_key_width()/3.5) * position[0];
  hoffset = (top_total_key_height()/3.5) * -position[1] - font_size/2;
  // copied from module _dish()
  dish_width = top_total_key_width() + $dish_overdraw_width;
  dish_height = top_total_key_height() + $dish_overdraw_height;
  dish_rad = cylindrical_dish_radius(width=dish_width, depth=$dish_depth);
  // XXX inverted legends
  chord_length = cylindrical_dish_chord_length(width=dish_width, depth=$dish_depth);
  dish_circumference = 6.283 * dish_rad;
  theta = woffset * 360 / dish_circumference;
  echo("dish radius =", dish_rad, "woffset = ", woffset, "theta =", theta);
  translate([$dish_offset_x,0,chord_length]) {
  mirror([1,0,0])
  rotate(180)
  rotate([90,0,0])
    color($tertiary_color) {
      text_on_cylinder(t=text,
      r=dish_rad-.1,
      h=top_total_key_height()/3.5,
      updown=hoffset,
      eastwest=theta,
      face=$font, size=font_size,
      // unsupported: halign="center", valign="center",
      center=false,
      cylinder_center=true,
      extrusion_center=true,
      extrusion_height = 2*depth,
      rotate=0);
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
    if($dish_type == "cylindrical"){
    top_placement()
        for (i=[0:len($legends)-1]) {
          keytext_cylindrical($legends[i][0], $legends[i][1], $legends[i][2], depth);
        }
    } else {
      top_of_key() {
        for (i=[0:len($legends)-1]) {
          keytext($legends[i][0], $legends[i][1], $legends[i][2], depth);
        }
      }
    }
  }
}
