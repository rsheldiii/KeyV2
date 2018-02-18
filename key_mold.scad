
include <keys.scad>

//key unit size
unit = 19.05 * 1.5;

//height of keycap
height = 13;

//minimum mold thickness
extra = 12.5;

//thicknesses of the mold
side_thickness = 2;
bottom_thickness = 2;

total_side = unit + extra*2 + side_thickness * 2;

bottom_box_height = 5;

function hypo(num) = sqrt(pow(num,2) / 2);


module bottom_box() {
  difference(){
    //outer box
    cube([total_side, total_side, bottom_box_height + bottom_thickness]);

    //inner box
    translate([ side_thickness, side_thickness, bottom_thickness]) {
      cube([unit + extra*2, unit + extra*2, bottom_box_height + .02]);
    }
  }
}

module slanted_box() {
  translate([total_side / 2, total_side / 2, bottom_box_height + bottom_thickness]) rotate([0,0,45]) difference(){
    //outer box
    cylinder(
      height + extra - bottom_box_height + bottom_thickness * 4,
      hypo(total_side),
      hypo(total_side + 3),
      $fn=4
    );

    //inner box
    translate([0,0,-0.01]) cylinder(
      height + extra - bottom_box_height + .02 + bottom_thickness * 4,
      hypo(unit + extra*2),
      hypo(unit + extra*2 + 3),
      $fn=4
    );
  }
}

module platform() {
  //platform
  translate([
    side_thickness + extra,
    side_thickness + extra,
    bottom_thickness
  ]) cube([unit, unit, bottom_thickness* 4]);
}

module registration() {
  positions = [
    [// bottom left
      side_thickness + extra / 2,
      side_thickness + extra / 2,
      bottom_thickness
    ],
    [// top left
      side_thickness +  extra / 2,
      side_thickness + unit + extra * 1.5,
      bottom_thickness
    ],
    [// bottom right
      side_thickness + unit + extra * 1.5,
      side_thickness +  extra / 2,
      bottom_thickness
    ],
    [// top right
      side_thickness + unit + extra * 1.5,
      side_thickness + unit + extra * 1.5,
      bottom_thickness
    ]
  ];

  for (position = positions) {
    translate(position) cylinder(3,extra/3, extra/4, $fn=4);
  }
}

module key_for_mold(wall_thickness = 20) {
  translate([
    29,
    29,
    bottom_thickness * 5
  ]) {
    $wall_thickness = wall_thickness;
    $support_type = false;
    key();
  }
}

module bottom_mold(){
  bottom_box();
  slanted_box();
  platform();
  registration();
  /* key_for_mold(); */
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

module skinner_box() {
  scale(.99) union() {
    cube([total_side, total_side, bottom_box_height + bottom_thickness]);
    translate([total_side / 2, total_side / 2, bottom_box_height + bottom_thickness]) rotate([0,0,45]){
      //outer box
      cylinder(
        height + extra - bottom_box_height,
        hypo(total_side),
        hypo(total_side + 3),
        $fn=4
      );
    }
  }
}

difference() {
  /* skinner_box(); */

  bottom_mold();
}

/* key_for_mold(0); */

/* translate([100,0,0]) top_mold(); */
