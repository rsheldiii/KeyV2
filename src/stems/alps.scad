module alps_stem(depth, has_brim, slop){
  linear_extrude(height=depth) {
    square($alps_stem, center = true);
  }
}
