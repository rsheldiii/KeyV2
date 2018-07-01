include <../functions.scad>
include <../stems/cherry.scad>

module centered_tines(stem_support_height) {
  translate([0,0,$stem_support_height / 2]) cube([total_key_width($wall_thickness), 1, $stem_support_height], center = true);
  translate([0,0,$stem_support_height / 2]) cube([1, total_key_height($wall_thickness), $stem_support_height], center = true);
}

module tines_support(stem_type, stem_support_height, slop) {
  if (stem_type == "cherry") {
    difference () {
      union() {
        translate([0,0,$stem_support_height / 2]) cube([total_key_width($wall_thickness), 1, $stem_support_height], center = true);
        translate([2,0,$stem_support_height / 2]) cube([1, total_key_height($wall_thickness), $stem_support_height], center = true);
        translate([-2,0,$stem_support_height / 2]) cube([1, total_key_height($wall_thickness), $stem_support_height], center = true);
      }

      inside_cherry_cross(slop);
    }
  } else if (stem_type == "box_cherry") {
    difference () {
      centered_tines(stem_support_height);

      inside_cherry_cross(slop);
    }
  } else if (stem_type == "rounded_cherry") {
    difference () {
      centered_tines(stem_support_height);

      inside_cherry_cross(slop);
    }
  } else if (stem_type == "alps"){
    centered_tines(stem_support_height);
  }
}
