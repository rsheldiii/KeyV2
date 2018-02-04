module alps_stem(depth, has_brim){
  if(has_brim) {
    linear_extrude(h=brim_height) {
      square($alps_stem * [2,2], center = true);
    }
  }
  linear_extrude(h=depth) {
    square($alps_stem, center = true);
  }
}
