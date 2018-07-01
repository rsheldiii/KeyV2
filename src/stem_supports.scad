include <stem_supports/brim.scad>
include <stem_supports/tines.scad>


//whole stem, alps or cherry, trimmed to fit
module stem_support(support_type, stem_type, stem_support_height, slop){
    if (support_type == "brim") {
      brim_support(stem_type, stem_support_height, slop);
    } else if (support_type == "tines") {
      tines_support(stem_type, stem_support_height, slop);
    } else if (support_type == "disable") {
      children();
    } else {
      echo("Warning: unsupported $stem_support_type");
    }
}
