thickness = .84;
inner_stem_size = [6,4];
outer_stem_size = inner_stem_size + [thickness, thickness];

module custom_stem(depth, slop, throw){
  linear_extrude(height=depth) {
    difference() {
      square(outer_stem_size + [slop,slop], center = true);
      square(inner_stem_size + [slop,slop], center = true);
    }
  }
}
