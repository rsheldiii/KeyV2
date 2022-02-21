include <../functions.scad>
include <../stems/cherry.scad>

module brim_support(stem_type, stem_support_height, slop) {
  if(stem_type == "alps") {
    linear_extrude(height=stem_support_height) {
      offset(r=1){
        square($alps_stem + [2,2], center=true);
      }
    }
  } else if (stem_type == "cherry" || stem_type == "costar_stabilizer") {
    difference() {
      linear_extrude(height = stem_support_height){
        offset(r=1){
          square(outer_cherry_stem(slop) + [2,2], center=true);
        }
      }

      inside_cherry_cross($stem_inner_slop);
    }
  } else if (stem_type == "rounded_cherry") {
    difference() {
      cylinder(d=$rounded_cherry_stem_d * 2, h=stem_support_height);
      inside_cherry_cross($stem_inner_slop);
    }
  } else if (stem_type == "box_cherry") {
    difference() {
      linear_extrude(height = stem_support_height){
        offset(r=1){
          square(outer_box_cherry_stem(slop) + [2,2], center=true);
        }
      }

      inside_cherry_cross($stem_inner_slop);
    }
  } else if (stem_type == "cherry_stabilizer") {
    difference() {
      linear_extrude(height = stem_support_height){
        offset(r=1){
          square(outer_cherry_stabilizer_stem(slop) + [2,2], center=true);
        }
      }

      inside_cherry_cross($stem_inner_slop);
    }
  } else if(stem_type == "choc") {
    translate([-5.7/2,0,0]) linear_extrude(height=stem_support_height) {
      offset(r=1){
        square($choc_stem + [3,3], center=true);
      }
    }

    translate([5.7/2,0,0]) linear_extrude(height=stem_support_height) {
      offset(r=1){
        square($choc_stem + [3,3], center=true);
      }
    }
  }
}
