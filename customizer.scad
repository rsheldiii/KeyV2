/*
  Hello there!
  if you're seeing this, you're probably poking at the Customizer script, wondering how it all works. I would HIGHLY recommend you look at the zip file or github instead! Thingiverse does not support including openSCAD files into other openSCAD files, so I had to copy / paste all my separated code into a single file :/ that's why this is over a thousand lines long! it's much more readable when it's all separate, trust me.

  Or don't, I'm just a comment
 */

/* [Hidden] */

// BEGIN SETTINGS

// keytop thickness, aka how many millimeters between the inside and outside of the top surface of the key
$keytop_thickness = 1;
// wall thickness, aka the thickness of the sides of the keycap. note this is the total thickness, aka 3 = 1.5mm walls
$wall_thickness = 3;
//whether stabilizer connectors are enabled
$stabilizers = false;
// font used for text
$font="DejaVu Sans Mono:style=Book";
// font size used for text
$font_size = 6;
// whether or not to render fake keyswitches to check clearances
$clearance_check = false;

/* [Key profile] */

// width of the very bottom of the key
$bottom_key_width = 18.16;
// height (from the front) of the very bottom of the ke
$bottom_key_height = 18.16;
// how much less width there is on the top. eg top_key_width = bottom_key_width - width_difference
$width_difference = 6;
// how much less height there is on the top
$height_difference = 4;
// how deep the key is, before adding a dish
$total_depth = 11.5;
// the tilt of the dish in degrees. divided by key height
$top_tilt = -6;
// how skewed towards the back the top is (0 for center)
$top_skew = 1.7;
// what type of dish the key has. note that unlike stems and supports a dish ALWAYS gets rendered.
$dish_type = "cylindrical";
// how deep the dish 'digs' into the top of the keycap. this is max depth, so you can't find the height from total_depth - dish_depth. besides the top is skewed anyways
$dish_depth = 1;
// how skewed in the x direction the dish is
$dish_skew_x = 0;
// how skewed in the y direction (height) the dish is
$dish_skew_y = 0;
//length in units of key
$key_length = 1;
//height in units of key. should remain 1 for most uses
$key_height = 1;
//print brim for connector to help with bed adhesion
$has_brim = false;
// invert dishing. mostly for spacebar
$inverted_dish = false;
// array of positions of all stems. includes stabilizers as well, for now
// ternary is a bad hack to keep the stabilizers flag working
$connectors = $stabilizers ? [[0,0],[-50,0],[50,0]] : [[0,0]];
// use linear_extrude instead of hull slices to make the shape of the key
// should be faster, also required for concave shapes
$linear_extrude_shape = false;
//should the key be rounded? unnecessary for most printers, and very slow
$rounded_key = false;
// what type of stem you want. To turn off stems pass false. "cherry", "alps", and "cherry_rounded" supported
$stem_type = "cherry";
// how much higher the stem is than the bottom of the keycap.
// inset stem requires support but is more accurate in some profiles
$stem_inset = 0;
// how many degrees to rotate the stems. useful for sideways keycaps, maybe
$stem_rotation = 0;
// radius of corners of keycap
$corner_radius = 1;
// keystem slop - lengthens the cross and thins out the connector
$stem_slop = 0.3;
// support type. default is "flared" for easy FDM printing. to disable pass false
$support_type = "flared";
// key shape type, determines the shape of the key. default is 'rounded square'
$key_shape_type = "rounded_square";
// ISO enter needs to be linear extruded NOT from the center. this tells the program how far up 'not from the center' is
$linear_extrude_height_adjustment = 0;
// if you need the dish to extend further, you can 'overdraw' the rectangle it will hit
$dish_overdraw_width = 0;
// same as width but for height
$dish_overdraw_height = 0;
// how many slices will be made, to approximate curves on corners. Leave at 1 if you are not curving corners
// if you're doing fancy bowed keycap sides, this controls how many slices you take
$height_slices = 1;
// this enables some fancy and currently hardcoded logic to bow the sides and corners of SA keycaps
$enable_side_sculpting = false;

//minkowski radius. radius of sphere used in minkowski sum for minkowski_key function. 1.75 for G20
$minkowski_radius = .33;

// the stem is the hardest part to print, so this variable controls how much 'slop' there is in the stem
$stem_slop = 0.3;

// how tall in mm the brim is, if there is one. brim sits around the keystem and helps to secure it while printing.
$brim_height = 0.4;
// how far the throw distance of the switch is. determines how far the 'cross' in the cherry switch digs into the stem, and how long the keystem needs to be before supports can start. luckily, alps and cherries have a pretty similar throw. can modify to have stouter keycaps for low profile switches, etc
$stem_throw = 4;

// cherry stem dimensions
$cherry_stem = [7.2 - $stem_slop * 2, 5.5 - $stem_slop * 2];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
$cherry_cross = [
  // horizontal tine
  [4.03 + $stem_slop, 1.15],
  // vertical tine
  [1.25, $cherry_stem[1] + .005],
];

// diameter of the outside of the rounded cherry stem
$rounded_cherry_stem_d = 5.5;

// dimensions of alps stem
$alps_stem = [4.45, 2.25];


// from https://www.thingiverse.com/thing:1484333
// public domain license
// same syntax and semantics as built-in sphere, so should be a drop-in replacement
// it's a bit slow for large numbers of facets
module geodesic_sphere(r=-1, d=-1) {
  // if neither parameter specified, radius is taken to be 1
  rad = r > 0 ? r : d > 0 ? d/2 : 1;

  pentside_pr = 2*sin(36);  // side length compared to radius of a pentagon
  pentheight_pr = sqrt(pentside_pr*pentside_pr - 1);
  // from center of sphere, icosahedron edge subtends this angle
  edge_subtend = 2*atan(pentheight_pr);

  // vertical rotation by 72 degrees
  c72 = cos(72);
  s72 = sin(72);
  function zrot(pt) = [ c72*pt[0]-s72*pt[1], s72*pt[0]+c72*pt[1], pt[2] ];

  // rotation from north to vertex along positive x
  ces = cos(edge_subtend);
  ses = sin(edge_subtend);
  function yrot(pt) = [ ces*pt[0] + ses*pt[2], pt[1], ces*pt[2]-ses*pt[0] ];

  // 12 icosahedron vertices generated from north, south, yrot and zrot
  ic1 = [ 0, 0, 1 ];  // north
  ic2 = yrot(ic1);    // north and +x
  ic3 = zrot(ic2);    // north and +x and +y
  ic4 = zrot(ic3);    // north and -x and +y
  ic5 = zrot(ic4);    // north and -x and -y
  ic6 = zrot(ic5);    // north and +x and -y
  ic12 = [ 0, 0, -1]; // south
  ic10 = yrot(ic12);  // south and -x
  ic11 = zrot(ic10);  // south and -x and -y
  ic7 = zrot(ic11);   // south and +x and -y
  ic8 = zrot(ic7);    // south and +x and +y
  ic9 = zrot(ic8);    // south and -x and +y

  // start with icosahedron, icos[0] is vertices and icos[1] is faces
  icos = [ [ic1, ic2, ic3, ic4, ic5, ic6, ic7, ic8, ic9, ic10, ic11, ic12 ],
    [ [0, 2, 1], [0, 3, 2], [0, 4, 3], [0, 5, 4], [0, 1, 5],
      [1, 2, 7], [2, 3, 8], [3, 4, 9], [4, 5, 10], [5, 1, 6],
      [7, 6, 1], [8, 7, 2], [9, 8, 3], [10, 9, 4], [6, 10, 5],
      [6, 7, 11], [7, 8, 11], [8, 9, 11], [9, 10, 11], [10, 6, 11]]];

  // now for polyhedron subdivision functions

  // given two 3D points on the unit sphere, find the half-way point on the great circle
  // (euclidean midpoint renormalized to be 1 unit away from origin)
  function midpt(p1, p2) =
    let (midx = (p1[0] + p2[0])/2, midy = (p1[1] + p2[1])/2, midz = (p1[2] + p2[2])/2)
    let (midlen = sqrt(midx*midx + midy*midy + midz*midz))
    [ midx/midlen, midy/midlen, midz/midlen ];

  // given a "struct" where pf[0] is vertices and pf[1] is faces, subdivide all faces into
  // 4 faces by dividing each edge in half along a great circle (midpt function)
  // and returns a struct of the same format, i.e. pf[0] is a (larger) list of vertices and
  // pf[1] is a larger list of faces.
  function subdivpf(pf) =
    let (p=pf[0], faces=pf[1])
    [ // for each face, barf out six points
      [ for (f=faces)
          let (p0 = p[f[0]], p1 = p[f[1]], p2=p[f[2]])
            // "identity" for-loop saves having to flatten
            for (outp=[ p0, p1, p2, midpt(p0, p1), midpt(p1, p2), midpt(p0, p2) ]) outp
      ],
      // now, again for each face, spit out four faces that connect those six points
      [ for (i=[0:len(faces)-1])
        let (base = 6*i)  // points generated in multiples of 6
          for (outf =
          [[ base, base+3, base+5],
          [base+3, base+1, base+4],
          [base+5, base+4, base+2],
          [base+3, base+4, base+5]]) outf  // "identity" for-loop saves having to flatten
      ]
    ];

  // recursive wrapper for subdivpf that subdivides "levels" times
  function multi_subdiv_pf(pf, levels) =
    levels == 0 ? pf :
    multi_subdiv_pf(subdivpf(pf), levels-1);

  // subdivision level based on $fa:
  // level 0 has edge angle of edge_subtend so subdivision factor should be edge_subtend/$fa
  // must round up to next power of 2.
  // Take log base 2 of angle ratio and round up to next integer
  ang_levels = ceil(log(edge_subtend/$fa)/log(2));

  // subdivision level based on $fs:
  // icosahedron edge length is rad*2*tan(edge_subtend/2)
  // actually a chord and not circumference but let's say it's close enough
  // subdivision factor should be rad*2*tan(edge_subtend/2)/$fs
  side_levels = ceil(log(rad*2*tan(edge_subtend/2)/$fs)/log(2));

  // subdivision level based on $fn: (fragments around circumference, not total facets)
  // icosahedron circumference around equator is about 5 (level 1 is exactly 10)
  // ratio of requested to equatorial segments is $fn/5
  // level of subdivison is log base 2 of $fn/5
  // round up to the next whole level so we get at least $fn
  facet_levels = ceil(log($fn/5)/log(2));

  // $fn takes precedence, otherwise facet_levels is NaN (-inf) but it's ok
  // because it falls back to $fa or $fs, whichever translates to fewer levels
  levels = $fn ? facet_levels : min(ang_levels, side_levels);

  // subdivide icosahedron by these levels
  subdiv_icos = multi_subdiv_pf(icos, levels);

  scale(rad)
  polyhedron(points=subdiv_icos[0], faces=subdiv_icos[1]);
}

// files
$fs=.1;
unit = 19.05;

// corollary is rounded_square
// NOT 3D
module ISO_enter_shape(size, delta, progress){
  width = size[0];
  height = size[1];
  function unit_length(length) = unit * (length - 1) + 18.16;


  // in order to make the ISO keycap shape generic, we are going to express the
  // 'elbow point' in terms of ratios. an ISO enter is just a 1.5u key stuck on
  // top of a 1.25u key, but since our key_shape function doesnt understand that
  // and wants to pass just width and height, we make these ratios to know where
  // to put the elbow joint

  width_ratio = unit_length(1.25) / unit_length(1.5);
  height_ratio = unit_length(1) / unit_length(2);

  pointArray = [
      [                   0,                     0], // top right
      [                   0,               -height], // bottom right
      [-width * width_ratio,               -height], // bottom left
      [-width * width_ratio,-height * height_ratio], // inner middle point
      [              -width,-height * height_ratio], // outer middle point
      [              -width,                     0]  // top left
  ];

  minkowski(){
    circle(r=corner_size);
    // gives us rounded inner corner
    offset(r=-corner_size*2) {
      translate([(width * width_ratio)/2, height/2]) polygon(points=pointArray);
    }
  }
}

// side sculpting functions
// bows the sides out on stuff like SA and DSA keycaps
function side_sculpting(progress) = (1 - progress) * 2.5;
// makes the rounded corners of the keycap grow larger as they move upwards
function corner_sculpting(progress) = pow(progress, 2);

module rounded_square_shape(size, delta, progress, center = true) {
    width = size[0];
    height = size[1];

    width_difference = delta[0];
    height_difference = delta[1];
    // makes the sides bow
    extra_side_size =  $enable_side_sculpting ? side_sculpting(progress) : 0;
    // makes the rounded corners of the keycap grow larger as they move upwards
    extra_corner_size = $enable_side_sculpting ? corner_sculpting(progress) : 0;

    // computed values for this slice
    extra_width_this_slice = (width_difference - extra_side_size) * progress;
    extra_height_this_slice = (height_difference - extra_side_size) * progress;
    extra_corner_radius_this_slice = ($corner_radius + extra_corner_size);

    offset(r=extra_corner_radius_this_slice){
      square(
        [
          width - extra_width_this_slice - extra_corner_radius_this_slice * 2,
          height - extra_height_this_slice - extra_corner_radius_this_slice * 2
        ],
        center=center
      );
    }
}


module square_shape(size, delta, progress){
  square(size - delta * progress, center = true);
}


module oblong_shape(size, delta, progress) {
  // .05 is because of offset. if we set offset to be half the height of the shape, and then subtract height from the shape, the height of the shape will be zero (because the shape would be [width - height, height - height]). that doesn't play well with openSCAD (understandably), so we add this tiny fudge factor to make sure the shape we offset has a positive width
  height = size[1] - delta[1] * progress - .05;

  if (progress < 0.5) {
  } else {
    offset(r=height / 2) {
      square(size - [height, height] - delta * progress, center=true);
    }
  }
}


module key_shape(size, delta, progress = 0) {
  if ($key_shape_type == "iso_enter") {
    ISO_enter_shape(size, delta, progress);
  } else if ($key_shape_type == "rounded_square") {
    rounded_square_shape(size, delta, progress);
  } else if ($key_shape_type == "square") {
    square_shape(size, delta, progress);
  } else if ($key_shape_type == "oblong") {
    oblong_shape(size, delta, progress);
  } else {
    echo("Warning: unsupported $key_shape_type");
  }
}

module cherry_stem(depth, has_brim) {
  difference(){
    union() {
      // outside shape
      linear_extrude(height = depth) {
        offset(r=1){
          square($cherry_stem - [2,2], center=true);
        }
      }

      // brim, if applicable
      if(has_brim) {
        linear_extrude(height = brim_height){
          offset(r=1){
            square($cherry_stem - [2,2], center=true);
          }
        }
      }
    }

    // inside cross
    // translation purely for aesthetic purposes, to get rid of that awful lattice
    translate([0,0,-0.005]) {
      linear_extrude(height = $stem_throw) {
        square($cherry_cross[0], center=true);
        square($cherry_cross[1], center=true);
      }
    }
  }
}

module rounded_cherry_stem(depth, has_brim) {
  difference(){
    union(){
      cylinder(d=$rounded_cherry_stem_d, h=depth);
      if(has_brim) {
        cylinder(d=$rounded_cherry_stem_d * 2, h=brim_height);
      }
    }

    // inside cross
    // translation purely for aesthetic purposes, to get rid of that awful lattice
    translate([0,0,-0.005]) {
      linear_extrude(height = $stem_throw) {
        square($cherry_cross[0], center=true);
        square($cherry_cross[1], center=true);
      }
    }
  }
}

module alps_stem(depth, has_brim){
  if(has_brim) {
    linear_extrude(h=brim_height) {
      square($alps_stem * [2,2], center = true);
    }
  }
  linear_extrude(h=depth) {
    square($alps_stem, center = true);
  }
}


module filled_stem() {
  // this is mostly for testing. we don't pass the size of the keycp in here
  // so we can't make this work for all keys
  cube(1000, center=true);
}


//whole stem, alps or cherry, trimmed to fit
module stem(stem_type, depth, has_brim){
    if (stem_type == "alps") {
      alps_stem(depth, has_brim);
    } else if (stem_type == "cherry_rounded") {
      rounded_cherry_stem(depth, has_brim);
    } else if (stem_type == "cherry") {
      cherry_stem(depth, has_brim);
    } else if (stem_type == "filled") {
      filled_stem();
    } else {
      echo("Warning: unsupported $stem_type");
    }
}

module cylindrical_dish(width, height, depth, inverted){
  // .5 has problems starting around 3u
  $fa=.25;
  /* we do some funky math here
   * basically you want to have the dish "dig in" to the keycap x millimeters
   * in order to do that you have to solve a small (2d) system of equations
   * where the chord of the spherical cross section of the dish is
   * the width of the keycap.
   */
  // the distance you have to move the dish so it digs in depth millimeters
  chord_length = (pow(width, 2) - 4 * pow(depth, 2)) / (8 * depth);
  //the radius of the dish
  rad = (pow(width, 2) + 4 * pow(depth, 2)) / (8 * depth);
  direction = inverted ? -1 : 1;

  translate([0,0, chord_length * direction]){
    rotate([90, 0, 0]) cylinder(h=height + 20, r=rad, center=true);
  }
}

//the older, 'more accurate', and MUCH slower spherical dish.
// generates the largest sphere possible that still contains the chord we are looking for
// much more graduated curvature at an immense cost
module old_spherical_dish(width, height, depth, inverted){

  //same thing as the cylindrical dish here, but we need the corners to just touch - so we have to find the hypotenuse of the top
  chord = pow((pow(width,2) + pow(height, 2)),0.5); //getting diagonal of the top

  // the distance you have to move the dish up so it digs in depth millimeters
  chord_length = (pow(chord, 2) - 4 * pow(depth, 2)) / (8 * depth);
  //the radius of the dish
  rad = (pow(chord, 2) + 4 * pow(depth, 2)) / (8 * depth);
  direction = inverted ? -1 : 1;

  translate([0,0,chord_length * direction]){
    if (geodesic){
      $fa=7;
      geodesic_sphere(r=rad);
    } else {
      $fa=1;
      // rotate 1 because the bottom of the sphere looks like trash
      sphere(r=rad);
    }
  }
}

module sideways_cylindrical_dish(width, height, depth, inverted){
  $fa=1;
  chord_length = (pow(height, 2) - 4 * pow(depth, 2)) / (8 * depth);
  rad = (pow(height, 2) + 4 * pow(depth, 2)) / (8 * depth);

  direction = inverted ? -1 : 1;

  translate([0,0, chord_length * direction]){
    // cylinder is rendered facing up, so we rotate it on the y axis first
    rotate([0,90,0]) cylinder(h = width + 20,r=rad, center=true); // +20 for fudge factor
  }
}

module spherical_dish(width, height, depth, inverted){

  //same thing as the cylindrical dish here, but we need the corners to just touch - so we have to find the hypotenuse of the top
  chord = pow((pow(width,2) + pow(height, 2)),0.5); //getting diagonal of the top

  // the distance you have to move the dish up so it digs in depth millimeters
  chord_length = (pow(chord, 2) - 4 * pow(depth, 2)) / (8 * depth);
  //the radius of the dish
  rad = (pow(chord, 2) + 4 * pow(depth, 2)) / (8 * depth);
  direction = inverted ? -1 : 1;

  translate([0,0,0 * direction]){
    if (geodesic){
      $fa=20;
      scale([chord/2/depth, chord/2/depth]) {
        geodesic_sphere(r=depth);
      }
    } else {
      $fa=7;
      // rotate 1 because the bottom of the sphere looks like trash.
      scale([chord/2/depth, chord/2/depth]) {
        geodesic_sphere(r=depth);
      }
    }
  }
}

//geodesic looks much better, but runs very slow for anything above a 2u
geodesic=false;

//dish selector
module  dish(width, height, depth, inverted) {
    if($dish_type == "cylindrical"){
      cylindrical_dish(width, height, depth, inverted);
    }
    else if ($dish_type == "spherical") {
      spherical_dish(width, height, depth, inverted);
    }
    else if ($dish_type == "sideways cylindrical"){
      sideways_cylindrical_dish(width, height, depth, inverted);
    }
    else if ($dish_type == "old spherical") {
      old_spherical_dish(width, height, depth, inverted);
    } else {
      // else no dish, "no dish" is the value
      // switchted to actually diffing a cube here due to changes to stems being differenced from the dish instead of the inside
      translate([0,0,500]) cube([width, height, 1000], center=true);
    }
}

// figures out the scale factor needed to make a 45 degree wall
function scale_for_45(height, starting_size) = (height * 2 + starting_size) / starting_size;

// complicated since we want the different stems to work well
// also kind of messy... oh well
module flared_support(stem_type, loft, height) {
  translate([0,0,loft]){
    if(stem_type == "cherry") {
      cherry_scale = [scale_for_45(height, $cherry_stem[0]), scale_for_45(height, $cherry_stem[1])];
      linear_extrude(height=height, scale = cherry_scale){
        offset(r=1){
          square($cherry_stem - [2,2], center=true);
        }
      }
    } else if (stem_type == "cherry_rounded") {
      linear_extrude(height=height, scale = scale_for_45(height, $rounded_cherry_stem_d)){
        circle(d=$rounded_cherry_stem_d);
      }
    } else if (stem_type == "alps") {
      alps_scale = [scale_for_45(height, $alps_stem[0]), scale_for_45(height, $alps_stem[1])];
      linear_extrude(height=height, scale = alps_scale){
        square($alps_stem, center=true);
      }
    }
  }
}

module flat_support(stem_type, loft, height) {
  translate([0,0,loft + 500]){
    cube(1000, center=true);
  }
}

module bars_support(stem_type, loft, height) {
  translate([0,0,loft + height / 2]){
    cube([2, 100, height], center = true);
    cube([100, 2, height], center = true);
  }
}

module supports(type, stem_type, loft, height) {
  if (type == "flared") {
    flared_support(stem_type, loft, height);
  } else if (type == "flat") {
    flat_support(stem_type, loft, height);
  } else if (type == "bars") {
    bars_support(stem_type, loft, height);
  } else {
    echo("Warning: unsupported $support_type");
  }
}

$fs = .1;
unit = 19.05;
color1 = [.2667,.5882,1];
color2 = [.5412, .4784, 1];
color3 = [.4078, .3569, .749];
color4 = [1, .6941, .2];
transparent_red = [1,0,0, 0.5];

// derived values. can't be variables if we want them to change when the special variables do

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + (unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + (unit * ($key_height - 1)) - $height_difference;


// key shape including dish. used as the ouside and inside shape in keytop(). allows for itself to be shrunk in depth and width / height
module shape(thickness_difference, depth_difference){
  dished(depth_difference, $inverted_dish) {
    color(color1) shape_hull(thickness_difference, depth_difference, 1);
  }
}

// shape of the key but with soft, rounded edges. much more realistic, MUCH more complex. orders of magnitude more complex
module rounded_shape() {
  render(){
    color(color1) minkowski(){
      // half minkowski. that means the shape is neither circumscribed nor inscribed.
      shape($minkowski_radius * 2, $minkowski_radius/2);
      difference(){
        sphere(r=$minkowski_radius, $fn=24);
        translate([0,0,-$minkowski_radius]){
          cube($minkowski_radius * 2, center=true);
        }
      }
    }
  }
}


// basic key shape, no dish, no inside
// which is only used for dishing to cut the dish off correctly
// $height_difference used for keytop thickness
// extra_slices is a hack to make inverted dishes still work
module shape_hull(thickness_difference, depth_difference, extra_slices = 0){
  render() {
    if ($linear_extrude_shape) {
      linear_extrude_shape_hull(thickness_difference, depth_difference, extra_slices);
    } else {
      hull_shape_hull(thickness_difference, depth_difference, extra_slices);
    }
  }
}

// corollary is hull_shape_hull
// extra_slices unused, only to match argument signatures
module linear_extrude_shape_hull(thickness_difference, depth_difference, extra_slices = 0){
  height = $total_depth - depth_difference;
  width_scale = top_total_key_width() / total_key_width();
  height_scale = top_total_key_height() / total_key_height();

  translate([0,$linear_extrude_height_adjustment,0]){
    linear_extrude(height = height, scale = [width_scale, height_scale]) {
        translate([0,-$linear_extrude_height_adjustment,0]){
        key_shape(total_key_width(thickness_difference), total_key_height(thickness_difference));
      }
    }
  }
}

module hull_shape_hull(thickness_difference, depth_difference, extra_slices = 0) {
  for (index = [0:$height_slices - 1 + extra_slices]) {
    hull() {
      shape_slice(index / $height_slices, thickness_difference, depth_difference);
      shape_slice((index + 1) / $height_slices, thickness_difference, depth_difference);
    }
  }
}

module shape_slice(progress, thickness_difference, depth_difference) {
  skew_this_slice = $top_skew * progress;
  depth_this_slice = ($total_depth - depth_difference) * progress;
  tilt_this_slice = -$top_tilt / $key_height * progress;

  translate([0, skew_this_slice, depth_this_slice]) {
    rotate([tilt_this_slice,0,0]){
      linear_extrude(height = 0.001){
        key_shape(
          [
            total_key_width(thickness_difference),
            total_key_height(thickness_difference)
          ],
          [$width_difference, $height_difference],
          progress
        );
      }
    }
  }
}

// for when you want something to only exist inside the keycap.
// used for the support structure
module inside() {
  intersection() {
    shape($wall_thickness, $keytop_thickness);
    children();
  }
}

// put something at the top of the key, with no adjustments for dishing
module top_placement(depth_difference) {
  translate([$dish_skew_x, $top_skew + $dish_skew_y, $total_depth - depth_difference]){
    rotate([-$top_tilt / top_total_key_height(),0,0]){
      children();
    }
  }
}

// just to DRY up the code
module _dish() {
  color(color3) dish(top_total_key_width() + $dish_overdraw_width, top_total_key_height() + $dish_overdraw_height, $dish_depth, $inverted_dish);
}

// for when you want to take the dish out of things
// used for adding the dish to the key shape and making sure stems don't stick out the top
module dished(depth_difference, inverted = false) {
  difference() {
    children();
    top_placement(depth_difference){
      difference(){
        union() {
          translate([-500, -500]) cube(1000);
          if (!inverted) _dish();
        }
        if (inverted) _dish();
      }
    }
  }
}

// puts it's children at the center of the dishing on the key, including dish height
// more user-friendly than top_placement
module top_of_key(){
  // if there is a dish, we need to account for how much it digs into the top
  dish_depth = ($dish_type == "no dish") ? 0 : $dish_depth;
  // if the dish is inverted, we need to account for that too. in this case we do half, otherwise the children would be floating on top of the dish
  corrected_dish_depth = ($inverted_dish) ? -dish_depth / 2 : dish_depth;

  top_placement(corrected_dish_depth) {
    children();
  }
}

module keytext(text, depth = 0) {
  translate([0, 0, -depth]){
    linear_extrude(height=$dish_depth){
      text(text=text, font=$font, size=$font_size, halign="center", valign="center");
    }
  }
}

module keystem_positions() {
  for (connector_pos = $connectors) {
    translate(connector_pos) {
      rotate([0, 0, $stem_rotation]){
        children();
      }
    }
  }
}

module keystems() {
  keystem_positions() {
    color(color4) stem($stem_type, $total_depth, $has_brim);
  }
}

module keystem_supports() {
  keystem_positions() {
    color(color4) supports($support_type, $stem_type, $stem_throw, $total_depth - $stem_throw);
  }
}

// a fake cherry keyswitch, abstracted out to maybe replace with a better one later
module cherry_keyswitch() {
  union() {
    hull() {
      cube([15.6, 15.6, 0.01], center=true);
      translate([0,1,5 - 0.01]) cube([10.5,9.5, 0.01], center=true);
    }
    hull() {
      cube([15.6, 15.6, 0.01], center=true);
      translate([0,0,-5.5]) cube([13.5,13.5,0.01], center=true);
    }
  }
}

//approximate (fully depressed) cherry key to check clearances
module clearance_check() {
  if($stem_type == "cherry" || $stem_type == "cherry_rounded"){
    color(transparent_red){
      translate([0,0,3.6 + $stem_inset - 5]) {
        cherry_keyswitch();
      }
    }
  }
}

// legends / artisan support
module artisan(legend, depth) {
  top_of_key() {
    // outset legend
    if (legend != "") keytext(legend, depth);
    // artisan objects / outset shape legends
    children();
  }
}

// key with hollowed inside but no stem
module keytop() {
  difference(){
    if ($rounded_key) {
      rounded_shape();
    } else {
      shape(0, 0);
    }
    // translation purely for aesthetic purposes, to get rid of that awful lattice
    translate([0,0,-0.005]) {
      shape($wall_thickness, $keytop_thickness);
    }
  }
}


// The final, penultimate key generation function.
// takes all the bits and glues them together. requires configuration with special variables.
module key(legend = "", inset = false) {
  difference() {
    union(){
      // the shape of the key, inside and out
      keytop();
      // additive objects at the top of the key
      if(!inset) artisan(legend) children();
      // render the clearance check if it's enabled, but don't have it intersect with anything
      if ($clearance_check) %clearance_check();
    }

    // subtractive objects at the top of the key
    if (inset) artisan(legend, 0.3) children();
    // subtract the clearance check if it's enabled, letting the user see the
    // parts of the keycap that will hit the cherry switch
    if ($clearance_check) clearance_check();
  }

  // both stem and support are optional
  if ($stem_type){
    dished($keytop_thickness, $inverted_dish) {
      translate([0, 0, $stem_inset]) keystems();
    }
  }

  if ($support_type){
    inside() {
      translate([0, 0, $stem_inset]) keystem_supports();
    }
  }
}

// key width functions

module u(u=1) {
  $key_length = u;
  children();
}

module 1u() {
  u(1) children();
}

module 1_25u() {
  u(1.25) children();
}

module 1_5u() {
  u(1.5) children();
}

module 2u() {
  u(2) children();
}

module 2_25u() {
  u(2.25) children();
}

module 2_75u() {
  u(2.75) children();
}

module 6_25u() {
  u(6.25) children();
}

// key height functions

module uh(u=1) {
  $key_height = u;
  children();
}

module 1uh() {
  uh(1) children();
}

module 2uh() {
  uh(2) children();
}

module 1_25uh() {
  uh(1.25) children();
}

module 1_5uh() {
  uh(1.5) children();
}

module 2_25uh() {
  uh(2.25) children();
}

module 2_75uh() {
  uh(2.75) children();
}

module 6_25uh() {
  uh(6.25) children();
}

// key profile definitions

// unlike the other files with their own dedicated folders, this one doesn't need a selector. it just collects all the functions
module dcs_row(n=1) {
  // names, so I don't go crazy
  $bottom_key_width = 18.16;
  $bottom_key_height = 18.16;
  $width_difference = 6;
  $height_difference = 4;
  $dish_type = "cylindrical";
  $dish_depth = 1;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 1.75;

  if (n == 5) {
    $total_depth = 11.5;
    $top_tilt = -6;
    children();
  } else if (n == 1) {
    $total_depth = 8.5;
    $top_tilt = -1;
    children();
  } else if (n == 2) {
    $total_depth = 7.5;
    $top_tilt = 3;
    children();
  } else if (n == 3) {
    $total_depth = 6;
    $top_tilt = 7;
    children();
  } else if (n == 4) {
    $total_depth = 6;
    $top_tilt = 16;
    children();
  }
}

module oem_row(n=1) {
  $bottom_key_width = 18.05;
  $bottom_key_height = 18.05;
  $width_difference = 5.8;
  $height_difference = 4;
  $dish_type = "cylindrical";
  $dish_depth = 1;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 1.75;
  $stem_inset = 1.2;

  if (n == 5) {
    $total_depth = 11.2;
    $top_tilt = -3;
    children();
  } else if (n == 1) {
    $total_depth = 9.45;
    $top_tilt = 1;
    children();
  } else if (n == 2) {
    $total_depth = 9;
    $top_tilt = 6;
    children();
  } else if (n == 3) {
    $total_depth = 9.25;
    $top_tilt = 9;
    children();
  } else if (n == 4) {
    $total_depth = 9.25;
    $top_tilt = 10;
    children();
  }
}

module dsa_row(n=3) {
  $bottom_key_width = 18.24; // 18.4;
  $bottom_key_height = 18.24; // 18.4;
  $width_difference = 6; // 5.7;
  $height_difference = 6; // 5.7;
  $total_depth = 8.1 + abs((n-3) * 1);
  $top_tilt = (n-3) * -7;
  $top_skew = 0;
  $dish_type = "spherical";
  $dish_depth = 1.2;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $height_slices = 10;
  $enable_side_sculpting = true;
  // might wanna change this if you don't minkowski
  // do you even minkowski bro
  $corner_radius = 0.25;

  children();
}

module sa_row(n=1) {
  $bottom_key_width = 18.4;
  $bottom_key_height = 18.4;
  $width_difference = 5.7;
  $height_difference = 5.7;
  $dish_type = "spherical";
  $dish_depth = 0.85;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 0;
  $height_slices = 10;
  $enable_side_sculpting = true;
  // might wanna change this if you don't minkowski
  // do you even minkowski bro
  $corner_radius = 0.25;

  if (n == 1){
    $total_depth = 14.89;
    $top_tilt = -13;
    children();
  } else if (n == 2) {
    $total_depth = 12.925;
    $top_tilt = -7;
    children();
  } else if (n == 3) {
    $total_depth = 12.5;
    $top_tilt = 0;
    children();
  } else if (n == 4){
    $total_depth = 12.925;
    $top_tilt = 7;
    children();
  }
}

module g20_row(n=3) {
  $bottom_key_width = 18.16;
  $bottom_key_height = 18.16;
  $width_difference = 2;
  $height_difference = 2;
  $total_depth = 6;
  $top_tilt = 2.5;
  $top_tilt = (n-3) * -7 + 2.5;
  $top_skew = 0.75;
  $dish_type = "no dish";
  $dish_depth = 0;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $minkowski_radius = 1.75;
  //also,
  /*$rounded_key = true;*/


  children();
}

// man, wouldn't it be so cool if functions were first order
module key_profile(key_profile_type, row) {
  if (key_profile_type == "dcs") {
    dcs_row(row) children();
  } else if (key_profile_type == "oem") {
    oem_row(row) children();
  } else if (key_profile_type == "dsa") {
    dsa_row(row) children();
  } else if (key_profile_type == "sa") {
    sa_row(row) children();
  } else if (key_profile_type == "g20") {
    g20_row(row) children();
  }
}

module spacebar() {
  $inverted_dish = true;
  $dish_type = "sideways cylindrical";
  6_25u() stabilized(mm=50) children();
}

module lshift() {
  2_25u() stabilized() children();
}

module rshift() {
  2_75u() stabilized() children();
}

module backspace() {
  2u() stabilized() children();
}

module enter() {
  2_25u() stabilized() children();
}

module numpad_enter() {
  2uh() stabilized(vertical=true) children();
}

module numpad_plus() {
  numpad_enter() children();
}

module numpad_0() {
  backspace() children();
}

module stepped_caps_lock() {
  u(1.75) {
    $connectors = [
      [-5, 0]
    ];
    children();
  }
}

module iso_enter() {
  $key_length = 1.5;
  $key_height = 2;

  $top_tilt = 0;
  $key_shape_type = "iso_enter";
  $linear_extrude_shape = true;
  $linear_extrude_height_adjustment = 19.05 * 0.5;
  // (unit_length(1.5) - unit_length(1.25)) / 2
  $dish_overdraw_width = 2.38125;


  stabilized(vertical=true) {
    children();
  }
}






























// ok, the actual script now

/* [General] */

// keytop thickness, aka how many millimeters between the inside and outside of the top surface of the key
$keytop_thickness = 1; // [0.5:0.1:5]
// wall thickness, aka the thickness of the sides of the keycap. note this is the total thickness, aka 3 = 1.5mm walls
$wall_thickness = 3; // [1:10]
//whether stabilizer connectors are enabled
$stabilizers = false;

/* [Legends] */

// font used for text
$font="DejaVu Sans Mono:style=Book";
// font size used for text
$font_size = 6;

/* [Key profile] */

//length in units of key
$key_length = 10; // [1:0.25:10]
//height in units of key. should remain 1 for most uses
$key_height = 10; // [1:0.25:10]
//print brim for connector to help with bed adhesion
$has_brim = false;
// invert dishing. mostly for spacebar
$inverted_dish = false;


// what type of stem you want. To turn off stems pass false. "cherry", "alps", and "cherry_rounded" supported
$stem_type = "cherry"; // ["cherry", "cherry_rounded", "alps", "filled", false]
// how much higher the stem is than the bottom of the keycap.
// inset stem requires support but is more accurate in some profiles
$stem_inset = 0; // [0:0.125:10]
// how many degrees to rotate the stems. useful for sideways keycaps, maybe
$stem_rotation = 0; // [0:45:360]
// keystem slop - lengthens the cross and thins out the connector
$stem_slop = 0.3; // [0:0.1:1]
// support type. default is "flared" for easy FDM printing. to disable pass false
$support_type = "flat"; // ["flared", "flat", "bars", false]
// key shape type, determines the shape of the key. default is 'rounded square'
$key_shape_type = "rounded_square"; // ["rounded_square", "square", "ISO_enter", "oblong"]

/* [ Brim ] */

// how tall in mm the brim is, if there is one. brim sits around the keystem and helps to secure it while printing.
$brim_height = 0.4; // [0:0.1:3]

key_profile_type = "dcs"; // ["dcs", "sa", "dsa", "oem", "g20"]

row = 3; // [1:5]

key_profile(key_profile_type, row) {
  key();
}
