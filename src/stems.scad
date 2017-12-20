include <supports.scad>

brim_height = 0.4;

//whole connector, alps or cherry, trimmed to fit
module connector(stem_profile, depth, has_brim, slop, stem_inset, support_type){
  echo(slop);
		if (stem_profile == "alps") {
			alps_stem(depth, has_brim, slop, stem_inset, support_type);
		} else if (stem_profile == "cherry_rounded") {
			cherry_stem_rounded(depth, has_brim, slop, stem_inset, support_type);
		} else if (stem_profile == "cherry") {
			cherry_stem(depth, has_brim, slop, stem_inset, support_type);
		} else if (stem_profile == "filled") {
      // just a cube, so no args
      filled_stem();
    }
}

module cherry_stem(depth, has_brim, slop, stem_inset, support_type) {
  stem_width = 7.2 - slop * 2;
  stem_height = 5.5 - slop * 2;

  vertical_cross_width = 1.25;
  // currently unused, as we want a split stem
  vertical_cross_length = 3.93;

  horizontal_cross_width = 1.15;
  horizontal_cross_length = 4.03;

  cross_depth = 4;

  stem = [stem_width, stem_height];
  vertical_cross = [vertical_cross_width, stem_height];
  horizontal_cross = [horizontal_cross_length + slop, horizontal_cross_width];

  translate([0,0,stem_inset]) {
    difference(){
      union() {
        linear_extrude(height = depth) {
          roundedSquare(stem, 1, center=true);
        }
        if(has_brim) {
          roundedRect([stem_width*2, stem_height*2,brim_height], 1, 1, center=true);
        }
      }
      linear_extrude(height = cross_depth) {
        square(vertical_cross, center=true);
        square(horizontal_cross, center=true);
      }
    }

    // supports
    if (support_type == "flared") {
      flared(cross_depth, (depth - cross_depth), [stem_width, stem_height]) {
        roundedSquare(stem, 1, center=true);
      }
    } else if (support_type == "flat") {
      flat(cross_depth, (depth - cross_depth), [stem_width, stem_height]);
    } else if (support_type == "bars") {
      bars(cross_depth, (depth - cross_depth), [stem_width, stem_height]);
    }
  }
}

module cherry_stem_rounded(depth, has_brim, slop, stem_inset, support_type) {
  // cross length
  cross_length = 4.4;
  //dimensions of connector
  // outer cross extra length in y
  extra_outer_cross_height = 1.1;
  // dimensions of cross
  // horizontal cross bar width
  horizontal_cross_width = 1.4;
  // vertical cross bar width
  vertical_cross_width = 1.3;
  // cross depth, stem height is 3.4mm
  cross_depth = 4;

  total_diameter = cross_length+extra_outer_cross_height;

  translate([0,0,stem_inset]){
    difference(){
      union(){
        cylinder(d=total_diameter, h=depth);
        if(has_brim) {
          cylinder(d=total_diameter * 2, h=brim_height);
        }
      }
      //the cross part of the steam
      translate([0,0,(cross_depth)/2]){
        cube([vertical_cross_width,cross_length,cross_depth], center=true );
        cube([cross_length,horizontal_cross_width,cross_depth], center=true );
      }
    }

    // supports
    if (support_type == "flared") {
      flared(cross_depth, (depth - cross_depth)) {
        circle(d = cross_length+extra_outer_cross_height);
      }
    } else if (support_type == "flat") {
      flat(cross_depth, (depth - cross_depth));
    } else if (support_type == "bars") {
      bars(cross_depth, (depth - cross_depth));
    }
  }
}

module alps_stem(depth, has_brim, slop, stem_inset, support_type){
  // not really cross depth, basically just the max length of stem we need for the key to function properly
  cross_depth = 4;

	width = 4.45;
	height = 2.25;

	base_width = 12;
	base_height = 15;

  translate([0,0,stem_inset]){
    if(has_brim) {
      translate([0,0,brim_height / 2]) cube([width*2,height*2,brim_height], center = true);
    }
    translate([0,0,depth/2]){
      cube([width,height,depth], center = true);
    }
  }

  translate([0, 0, stem_inset]){
    if (support_type == "flared") {
      flared(cross_depth, (depth - cross_depth)) {
        square([width,height]);
      }
    } else if (support_type == "flat") {
      flat(cross_depth, (depth - cross_depth));
    } else if (support_type == "bars") {
      bars(cross_depth, (depth - cross_depth));
    }
  }
}

module filled_stem() {
  // this is mostly for testing. we don't pass the size of the keycp in here
  // so we can't make this work for all keys
  cube(1000, center=true);
}
