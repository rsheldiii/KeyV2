// TODO uh what
cross_height = 25;
/* [Brim] */
//brim radius. 11 ensconces normal keycap stem in normal keycap
brim_radius = 6;
//brim depth
brim_depth = .3;

module brim(has_brim) {
  if (has_brim) color([0,1,0]) cylinder(r=brim_radius,h=brim_depth);
}

module cherry_stem(has_brim) {
  // cross length
	cross_length = 4.4;
  //extra vertical cross length - the extra length of the up/down bar of the cross
  extra_vertical_cross_length = 1.1;
	//dimensions of connector
	// outer cross extra length in x
	extra_outer_cross_width = 2.10;
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
    translate([0,0,stem_inset]) {
      brim(has_brim);
      translate([
        -(cross_length+extra_outer_cross_width)/2,
        -(cross_length+extra_outer_cross_height)/2,
        0
      ])
      cube([ // the base of the stem, the part the cruciform digs into
        cross_length+extra_outer_cross_width,
        cross_length+extra_outer_cross_height,
        cross_height
      ]);
    }

		//the cross part of the steam
		translate([0,0,(cross_depth)/2 + stem_inset]){
      cube([vertical_cross_width,cross_length+extra_vertical_cross_length,cross_depth], center=true );
      cube([cross_length,horizontal_cross_width,cross_depth], center=true );
    }
  }
}

module cherry_stem_rounded(has_brim) {
  // cross length
  cross_length = 4.4;
  //dimensions of connector
  // outer cross extra length in x
  extra_outer_cross_width = 2.10;
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
        h = cross_height
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


//whole connector, alps or cherry, trimmed to fit
module connector(stem_profile, has_brim){
		if (stem_profile == "alps") {
			alps_stem(has_brim);
		} else if (stem_profile == "cherry_rounded") {
			cherry_stem_rounded(has_brim);
		} else if (stem_profile == "cherry") {
			cherry_stem(has_brim);
		}
}
