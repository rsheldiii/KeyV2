include <stems/cherry.scad>
include <stems/rounded_cherry.scad>
include <stems/alps.scad>
include <stems/filled.scad>


//whole stem, alps or cherry, trimmed to fit
module stem(stem_type, depth, has_brim){
		if (stem_type == "alps") {
			alps_stem(depth, has_brim);
		} else if (stem_type == "cherry_rounded") {
			rounded_cherry_stem(depth, has_brim);
		} else if (stem_type == "cherry") {
			cherry_stem(depth, has_brim);
		} else if (stem_type == "filled") {
      filled_stem();
    } else {
      echo("Warning: unsupported $stem_type");
    }
}
