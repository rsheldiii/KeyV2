include <stems/cherry.scad>
include <stems/rounded_cherry.scad>
include <stems/box_cherry.scad>
include <stems/alps.scad>
include <stems/filled.scad>
include <stems/cherry_stabilizer.scad>
include <stems/choc.scad>


//whole stem, alps or cherry, trimmed to fit
module stem(stem_type, depth, slop, throw){
    if (stem_type == "alps") {
      alps_stem(depth, slop, throw);
    } else if (stem_type == "cherry" || stem_type == "costar_stabilizer") {
      cherry_stem(depth, slop, throw);
    } else if (stem_type == "rounded_cherry") {
      rounded_cherry_stem(depth, slop, throw);
    } else if (stem_type == "box_cherry") {
      box_cherry_stem(depth, slop, throw);
    } else if (stem_type == "filled") {
      filled_stem();
    } else if (stem_type == "cherry_stabilizer") {
      cherry_stabilizer_stem(depth, slop, throw);
    } else if (stem_type == "choc") {
      choc_stem(depth, slop, throw);
    } else if (stem_type == "disable") {
      children();
    } else {
      echo("Warning: unsupported $stem_type: ");
      echo(stem_type);
    }
}
