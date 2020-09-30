include <../functions.scad>
// TODO this define doesn't do anything besides tell me I used flat() in this file
// is it better than not having it at all?
include <./flat.scad>

// figures out the scale factor needed to make a 45 degree wall
function scale_for_45(height, starting_size) = (height * 2 + starting_size) / starting_size;

// complicated since we want the different stems to work well
// also kind of messy... oh well
module flared(stem_type, loft, height) {
  // flat support. straight flat support has a tendency to shear off; flared support
  // all the way to the top has a tendency to warp the outside of the keycap.
  // hopefully the compromise is both
  flat(stem_type, loft + height/4, height);

  translate([0,0,loft]){
    if (stem_type == "rounded_cherry") {
      linear_extrude(height=height, scale = scale_for_45(height, $rounded_cherry_stem_d)){
        circle(d=$rounded_cherry_stem_d);
      }
    } else if (stem_type == "alps") {
      alps_scale = [scale_for_45(height, $alps_stem[0]), scale_for_45(height, $alps_stem[1])];
      linear_extrude(height=height, scale = alps_scale){
        square($alps_stem, center=true);
      }
    } else if (stem_type == "box_cherry") {
      // always render cherry if no stem type. this includes stem_type = false!
      // this avoids a bug where the keycap is rendered filled when not desired
      cherry_scale = [scale_for_45(height, outer_box_cherry_stem($stem_slop)[0]), scale_for_45(height, outer_box_cherry_stem($stem_slop)[1])];
      linear_extrude(height=height, scale = cherry_scale){
        offset(r=1){
          square(outer_box_cherry_stem($stem_slop) - [2,2], center=true);
        }
      }
    } else if (stem_type == "cherry_stabilizer") {
      cherry_scale = [scale_for_45(height, outer_cherry_stabilizer_stem($stem_slop)[0]), scale_for_45(height, outer_cherry_stabilizer_stem($stem_slop)[1])];
      linear_extrude(height=height, scale = cherry_scale){
        offset(r=1){
          square(outer_cherry_stabilizer_stem($stem_slop) - [2,2], center=true);
        }
      }
    } else if (stem_type == "choc") {
      // single support, just the stem
      new_choc_scale = [scale_for_45(height, $choc_stem[0] + 5.7 - $stem_slop), scale_for_45(height, $choc_stem[1])];
      translate([0,0,0]) linear_extrude(height=height, scale = new_choc_scale){
        // TODO make a choc_stem() function so it can build in the slop
        square([$choc_stem[0] + 5.7 - $stem_slop, $choc_stem[1] - $stem_slop], center=true);
      }

    } else {
      // always render cherry if no stem type. this includes stem_type = false!
      // this avoids a bug where the keycap is rendered filled when not desired
      cherry_scale = [scale_for_45(height, outer_cherry_stem($stem_slop)[0]), scale_for_45(height, outer_cherry_stem($stem_slop)[1])];
      linear_extrude(height=height, scale = cherry_scale){
        offset(r=1){
          square(outer_cherry_stem($stem_slop) - [2,2], center=true);
        }
      }
    }
  }
}
