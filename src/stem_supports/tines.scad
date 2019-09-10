include <../functions.scad>
include <../stems/cherry.scad>

module centered_tines(stem_support_height) {
  if ($key_length < 2) {
    translate([0,0,$stem_support_height / 2]) {
      cube([total_key_width(), 0.5, $stem_support_height], center = true);
    }
  }

  translate([0,0,$stem_support_height / 2]) {
    cube([
      1,
      total_key_height(),
      $stem_support_height
    ],
    center = true);
  }
}

module tines_support(stem_type, stem_support_height, slop) {
  extra_height = $extra_long_stem_support ? ($unit - total_key_height()) + 0.1 : -$wall_thickness/4; // fudge
  extra_width = $extra_long_stem_support ? ($unit - total_key_width()) + 0.1 : -$wall_thickness/4;

  if (stem_type == "cherry" || stem_type == "costar_stabilizer") {
    difference () {
      union() {
        if ($key_length < 2) {
          translate([0,0,$stem_support_height / 2]) {
            cube([
              total_key_width() + extra_width*2,
              0.5,
              $stem_support_height
            ], center = true);
          }
        }

        // 2 vertical tines holding either side of the cruciform
        for (x = [1.15, -1.15]) {
          translate([x,0,$stem_support_height / 2]) {
            cube([
              0.5,
              total_key_height() + extra_height*2, // this is to extend past
              $stem_support_height
            ], center = true);
          }
        }
      }

      inside_cherry_cross(slop);
    }
  } else if (stem_type == "cherry_stabilizer") {
    difference () {
      for (x = [1.15, -1.15]) {
        translate([x,0,$stem_support_height / 2]) {
          cube([
            1,
            total_key_height($wall_thickness),
            $stem_support_height
          ], center = true);
        }
      }

      inside_cherry_stabilizer_cross(slop);
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
  } else if (stem_type == "choc"){
    if ($key_length < 2) translate([0,0,$stem_support_height / 2]) cube([total_key_width($wall_thickness)+$wall_thickness/4, 0.42, $stem_support_height], center = true);
    /* translate([-5.7/2,0,$stem_support_height / 2]) cube([0.5, total_key_height($wall_thickness), $stem_support_height], center = true); */
    /* translate([5.7/2,0,$stem_support_height / 2]) cube([0.5, total_key_height($wall_thickness), $stem_support_height], center = true); */
  }
}
