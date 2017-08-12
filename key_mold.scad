
//key unit size
unit = 19.05;

//height of keycap
height = 13;

//minimum mold thickness
extra = 15;

//thicknesses of the mold
side_thickness = 2;
bottom_thickness = 2;

total_side = unit + extra*2 + side_thickness * 2;

function hypo(num) = sqrt(pow(num,2) / 2);

module bottom_mold(){
  difference(){
    //outer box
    cube([
      total_side,
      total_side,
      5 + bottom_thickness,
    ]);

    //inner box
    translate([
      side_thickness,
      side_thickness,
      bottom_thickness
    ]) {
      cube([
        unit + extra*2,
        unit + extra*2,
        5,
      ]);
    }
  }

  translate([total_side / 2, total_side / 2, 5 + bottom_thickness]) rotate([0,0,45]) difference(){
    //outer box
      cylinder(
      height + extra - 5,
      hypo(total_side),
      hypo(total_side + 3),
      $fn=4
    );

    //inner box
    cylinder(
      height + extra - 5,
      hypo(unit + extra*2),
      hypo(unit + extra*2 + 3),
      $fn=4
    );
  }
  //platform
  translate([
    side_thickness + extra,
    side_thickness + extra,
    bottom_thickness
  ]) cube([unit, unit, bottom_thickness]);
/*
  translate([
    side_thickness + extra + unit / 2,
    side_thickness + extra + unit / 2,
    bottom_thickness*2
  ]) rotate([0,0,45]) cylinder(bottom_thickness, unit/2 + 1, unit / 2, $fn=4);*/

  //registration
  translate([
    side_thickness + extra / 2,
    side_thickness + extra / 2,
    bottom_thickness
  ]) cylinder(3,extra/3, extra/4, $fn=4);

  //registration
  translate([
    side_thickness +  extra / 2,
    side_thickness + unit + extra * 1.5,
    bottom_thickness
  ]) cylinder(3,extra/3, extra/4, $fn=4);

  //registration
  translate([
    side_thickness + unit + extra * 1.5,
    side_thickness + unit + extra * 1.5,
    bottom_thickness
  ]) cylinder(3,extra/3, extra/4, $fn=4);
}

module top_mold(){
  difference(){
    //outer box
    cube([
      total_side,
      total_side,
      height + extra + bottom_thickness,
    ]);

    //inner box
    translate([
      side_thickness,
      side_thickness,
      0
    ]) {
      cube([
        unit + extra*2,
        unit + extra*2,
        height + extra + bottom_thickness,
      ]);
    }
  }
}

/*bottom_mold();*/

translate([50,0,0]) top_mold();
