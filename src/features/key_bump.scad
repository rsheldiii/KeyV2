module keybump(depth = 0, edge_inset=0.4) {
  radius = 0.5;
  translate([0, -top_total_key_height()/2 + edge_inset, depth]){
        rotate([90,0,90]) cylinder($font_size, radius, radius, true);
        translate([0,0,-radius]) cube([$font_size, radius*2, radius*2], true);
  }
}
