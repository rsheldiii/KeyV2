include <stems/cherry.scad>
include <stems/rounded_cherry.scad>
include <stems/alps.scad>
include <stems/filled.scad>


//whole stem, alps or cherry, trimmed to fit
module stem(stem_type, depth, has_brim, slop){
    if (stem_type == "alps") {
      alps_stem(depth, has_brim, slop);
    } else if (stem_type == "rounded_cherry") {
      rounded_cherry_stem(depth, has_brim, slop);
    } else if (stem_type == "cherry") {
      cherry_stem(depth, has_brim, slop);
    } else if (stem_type == "filled") {
      filled_stem();
    } else if (stem_type == "disable") {
      children();
    } else {
      echo("Warning: unsupported $stem_type");
    }
}
