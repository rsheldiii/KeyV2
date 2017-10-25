include <util.scad>

stem_depth = 24;

module brim(has_brim) {
  //brim radius. 11 ensconces normal keycap stem in normal keycap
  brim_radius = 6;
  //brim depth
  brim_depth = .3;

  if (has_brim) color([0,1,0]) cube([brim_radius, brim_radius, brim_depth]);
}

module cherry_stem(has_brim, slop = 0.3) {

  stem_width = 7.2 - slop * 2;
  stem_height = 5.5 - slop * 2;

  vertical_cross_width = 1.25;
  vertical_cross_length = 3.93;

  horizontal_cross_width = 1.15;
  horizontal_cross_length = 4.03;

  cross_depth = 4;

  stem = [stem_width, stem_height];
  vertical_cross = [vertical_cross_width, vertical_cross_length + slop + 12];
  horizontal_cross = [horizontal_cross_length + slop, horizontal_cross_width];

  translate([0,0,stem_inset]) {
    brim(has_brim);
    linear_extrude(height = cross_depth) {
      difference(){
        roundedSquare(stem, 1, center=true);
        off = 0;
        offset(r = off){
          square(vertical_cross + [-off * 2,-off * 2], center=true);
          square(horizontal_cross + [-off * 2,-off * 2], center=true);
        }
      }
    }
    // flared support
    // 6 and 8 are magic numbers I got from trying to make the sides of the flared part of the stem 45 degree overhangs
    translate([0,0,cross_depth]) linear_extrude(height=(stem_depth - cross_depth), scale = [6,8]){
      roundedSquare([stem_width, stem_height], 1, center=true);
    }
  }
}

module cherry_stem_rounded(has_brim) {
  // cross length
  cross_length = 4.4;
  //dimensions of connector
  // outer cross extra length in y
  extra_outer_cross_height = 1.0;
  // dimensions of cross
  // horizontal cross bar width
  horizontal_cross_width = 1.4;
  // vertical cross bar width
  vertical_cross_width = 1.3;
  // cross depth, stem height is 3.4mm
  cross_depth = 4;

  difference(){
    union(){
      cylinder(
        d = cross_length+extra_outer_cross_height,
        h = stem_depth
      );
      brim(has_brim);
    }
    //the cross part of the steam
    translate([0,0,(cross_depth)/2 + stem_inset]){
      cube([vertical_cross_width,cross_length,cross_depth], center=true );
      cube([cross_length,horizontal_cross_width,cross_depth], center=true );
    }
  }
}

module alps_stem(has_brim = false){
	cross_depth = 40;
	width = 4.45;
	height = 2.25;

	base_width = 12;
	base_height = 15;

  brim(has_brim);
	translate([0,0,cross_depth/2 + stem_inset]){
		cube([width,height,cross_depth], center = true);
	}
}

module filled_stem(has_brim=false) {
  // this is mostly for testing. we don't pass the size of the keycp in here
  // so we can't make this work for all keys
  cube(100, center=true);
}


//whole connector, alps or cherry, trimmed to fit
module connector(stem_profile, has_brim){
		if (stem_profile == "alps") {
			alps_stem(has_brim);
		} else if (stem_profile == "cherry_rounded") {
			cherry_stem_rounded(has_brim);
		} else if (stem_profile == "cherry") {
			cherry_stem(has_brim);
		} else if (stem_profile == "filled") {
      filled_stem();
    }
}
