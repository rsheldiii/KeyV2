module alps_stem(depth, has_brim, slop){
  if(has_brim) {
    linear_extrude(height=$brim_height) {
      offset(r=1){
        square($alps_stem + [2,2], center=true);
      }
    }
  }
  linear_extrude(height=depth) {
    square($alps_stem, center = true);
  }
}
