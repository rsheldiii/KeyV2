
include <keys.scad>

platform_width = 30;
platform_height = 4;
// height difference between bottom and top of platform
platform_slant = 3;

minimum_height = 12;

//minimum mold thickness
extra = 9;

//thicknesses of the mold
side_thickness = 2;
bottom_thickness = 2;


// computed variables
inner_side = platform_width + extra * 2;
total_side = inner_side + side_thickness * 2;


// minimum_height of bottom, non-flared box
bottom_box_height = 5 + bottom_thickness;

function hypo(num) = sqrt(pow(num,2) / 2);


module bottom_box() {
  difference(){
    //outer box
    cube([total_side, total_side, bottom_box_height]);

    //inner box
    translate([ side_thickness, side_thickness, bottom_thickness]) {
      cube([inner_side, inner_side, bottom_box_height - bottom_thickness + .02]);
    }
  }
}

module slanted_box() {
  translate([total_side / 2, total_side / 2, bottom_box_height]) rotate([0,0,45]) difference(){
    //outer box
    cylinder(
      h = minimum_height + extra - bottom_box_height + platform_height,
      r1 = hypo(total_side),
      r2 = hypo(total_side + 3),
      $fn=4
    );

    //inner box
    translate([0,0,-0.01]) cylinder(
      minimum_height + extra - bottom_box_height + .02 + platform_height,
      hypo(inner_side),
      hypo(inner_side + 3),
      $fn=4
    );
  }
}

module platform() {
  //platform
  /* translate([
    side_thickness + extra,
    side_thickness + extra,
    bottom_thickness
  ]) cube([platform_width, platform_width, platform_height]); */

  translate([
    side_thickness + extra + platform_width/2,
    side_thickness + extra + platform_width/2,
    bottom_thickness
  ]) rotate([0,0,45]) cylinder(r1=hypo(platform_width), r2=hypo(platform_width) - platform_slant, h=platform_height, $fn=4);
}

module registration() {
  positions = [
    [// bottom left
      side_thickness + extra / 2 + 1,
      side_thickness + extra / 2 + 1,
      bottom_thickness
    ],
    [// top left
      side_thickness +  extra / 2 + 1,
      side_thickness + platform_width + extra * 1.5 - 1,
      bottom_thickness
    ],
    [// bottom right
      side_thickness + platform_width + extra * 1.5 - 1,
      side_thickness +  extra / 2 + 1,
      bottom_thickness
    ],
    [// top right
      side_thickness + platform_width + extra * 1.5 - 1,
      side_thickness + platform_width + extra * 1.5 - 1,
      bottom_thickness
    ]
  ];

  for (index = [0:len(positions)-1]) {
    position = positions[index];
    translate(position) {
      // dont mind the math
      rotate([0,0,45 / (index % 2 * 0.5 + 1)]) {
        cylinder(platform_height / 2,extra/3, 2, $fn=(index % 2 * 2 + 4));
      }
    }
  }
}

module key_for_mold(wall_thickness = 20) {
  translate([
    total_side / 2,
    total_side / 2,
    platform_height + bottom_thickness
  ]) {
    $wall_thickness = wall_thickness;
    $support_type = false;
    sa_row(1) key();
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
      minimum_height + extra + bottom_thickness,
    ]);

    //inner box
    translate([
      side_thickness,
      side_thickness,
      0
    ]) {
      cube([
        inner_side,
        inner_side,
        minimum_height + extra + bottom_thickness,
      ]);
    }
  }
}

// for calculating how much mold material to use!
module difference_box() {
  scale(.99) union() {
    cube([total_side, total_side, bottom_box_height + bottom_thickness]);
    translate([total_side / 2, total_side / 2, bottom_box_height + bottom_thickness]) rotate([0,0,45]){
      //outer box
      cylinder(
        minimum_height + extra - bottom_box_height,
        hypo(total_side),
        hypo(total_side + 3),
        $fn=4
      );
    }
  }
}

difference() {
  /* difference_box(); */

  /* bottom_mold(); */
}

/* key_for_mold(0); */

translate([0,0,0]) top_mold();
