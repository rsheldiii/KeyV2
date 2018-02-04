// figures out the scale factor needed to make a 45 degree wall
function scale_for_45(height, starting_size) = (height * 2 + starting_size) / starting_size;

// complicated since we want the different stems to work well
// also kind of messy... oh well
module flared_support(stem_type, loft, height) {
  translate([0,0,loft]){
    if(stem_type == "cherry") {
      cherry_scale = [scale_for_45(height, $cherry_stem[0]), scale_for_45(height, $cherry_stem[1])];
      linear_extrude(height=height, scale = cherry_scale){
        offset(r=1){
          square($cherry_stem - [2,2], center=true);
        }
      }
    } else if (stem_type == "cherry_rounded") {
      linear_extrude(height=height, scale = scale_for_45(height, $rounded_cherry_stem_d)){
        circle(d=$rounded_cherry_stem_d);
      }
    } else if (stem_type == "alps") {
      alps_scale = [scale_for_45(height, $alps_stem[0]), scale_for_45(height, $alps_stem[1])];
      linear_extrude(height=height, scale = alps_scale){
        square($alps_stem, center=true);
      }
    }
  }
}
