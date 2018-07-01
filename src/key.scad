// files
include <functions.scad>
include <shapes.scad>
include <stems.scad>
include <stem_supports.scad>
include <dishes.scad>
include <supports.scad>
include <key_features.scad>

include <libraries/geodesic_sphere.scad>


/* [Hidden] */
$fs = .1;
$unit = 19.05;
blue = [.2667,.5882,1];
color2 = [.5412, .4784, 1];
purple = [.4078, .3569, .749];
yellow = [1, .6941, .2];
transparent_red = [1,0,0, 0.15];

// key shape including dish. used as the ouside and inside shape in keytop(). allows for itself to be shrunk in depth and width / height
module shape(thickness_difference, depth_difference){
  dished(depth_difference, $inverted_dish) {
    color(blue) shape_hull(thickness_difference, depth_difference, 2);
  }
}

// shape of the key but with soft, rounded edges. much more realistic, MUCH more complex. orders of magnitude more complex
module rounded_shape() {
  color(blue) minkowski(){
    // half minkowski in the z direction
    shape($minkowski_radius * 2, $minkowski_radius/2);
    difference(){
      sphere(r=$minkowski_radius, $fn=20);
      translate([0,0,-$minkowski_radius]){
        cube($minkowski_radius * 2, center=true);
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
    rotate([-$top_tilt / $key_height,0,0]){
      children();
    }
  }
}

// just to DRY up the code
module _dish() {
  dish(top_total_key_width() + $dish_overdraw_width, top_total_key_height() + $dish_overdraw_height, $dish_depth, $inverted_dish);
}

module envelope(depth_difference) {
  s = 1.5;
  hull(){
    cube([total_key_width() * s, total_key_height() * s, 0.01], center = true);
    top_placement(0.005 + depth_difference){
      cube([top_total_key_width() * s, top_total_key_height() * s, 0.01], center = true);
    }
  }
}

module dished_for_show() {
  difference(){
    union() {
      envelope();
      if ($inverted_dish) top_placement(0) _dish();
    }
    if (!$inverted_dish) top_placement(0) _dish();
  }
}


// for when you want to take the dish out of things
// used for adding the dish to the key shape and making sure stems don't stick out the top
// creates a bounding box 1.5 times larger in width and height than the keycap.
module dished(depth_difference, inverted = false) {
  intersection() {
    children();
    difference(){
      union() {
        envelope(depth_difference);
        if (inverted) top_placement(depth_difference) _dish();
      }
      if (!inverted) top_placement(depth_difference) _dish();
    }
  }
}

// puts it's children at the center of the dishing on the key, including dish height
// more user-friendly than top_placement
module top_of_key(){
  // if there is a dish, we need to account for how much it digs into the top
  dish_depth = ($dish_type == "disable") ? 0 : $dish_depth;
  // if the dish is inverted, we need to account for that too. in this case we do half, otherwise the children would be floating on top of the dish
  corrected_dish_depth = ($inverted_dish) ? -dish_depth / 2 : dish_depth;

  top_placement(corrected_dish_depth) {
    children();
  }
}

module keytext(text, position, font_size, depth) {
  woffset = (top_total_key_width()/3.5) * position[0];
  hoffset = (top_total_key_height()/3.5) * -position[1];
  translate([woffset, hoffset, -depth]){
    linear_extrude(height=$dish_depth){
      text(text=text, font=$font, size=font_size, halign="center", valign="center");
    }
  }
}

module keystem_positions(positions) {
  for (connector_pos = positions) {
    translate(connector_pos) {
      rotate([0, 0, $stem_rotation]){
        children();
      }
    }
  }
}

module support_for(positions, stem_type) {
  keystem_positions(positions) {
    color(yellow) supports($support_type, stem_type, $stem_throw, $total_depth - $stem_throw);
  }
}

module stems_for(positions, stem_type) {
  keystem_positions(positions) {
    color(yellow) stem(stem_type, $total_depth, $stem_slop);
    if ($stem_support_type != "disable") {
      color(color2) stem_support($stem_support_type, stem_type, $stem_support_height, $stem_slop);
    }
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
module artisan(depth) {
  top_of_key() {
    // outset legend
    for (i=[0:len($legends)-1]) {
        keytext($legends[i][0], $legends[i][1], $legends[i][2], depth);
    }
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
module key(inset = false) {
  difference() {
    union(){
      // the shape of the key, inside and out
      keytop();
      if($key_bump) top_of_key() keybump($key_bump_depth, $key_bump_edge);
      // additive objects at the top of the key
      if(!inset) artisan() children();
      // render the clearance check if it's enabled, but don't have it intersect with anything
      if ($clearance_check) %clearance_check();
    }

    // subtractive objects at the top of the key
    if (inset) artisan(0.3) children();
    // subtract the clearance check if it's enabled, letting the user see the
    // parts of the keycap that will hit the cherry switch
    if ($clearance_check) clearance_check();
  }

  // both stem and support are optional
  if ($stem_type != "disable" || $stabilizer_type != "disable") {
    dished($keytop_thickness, $inverted_dish) {
      translate([0, 0, $stem_inset]) {
        if ($stabilizer_type != "disable") stems_for($stabilizers, $stabilizer_type);
        if ($stem_type != "disable") stems_for($stem_positions, $stem_type);
      }
    }
  }

  if ($support_type != "disable"){
    inside() {
      translate([0, 0, $stem_inset]) {
        if ($stabilizer_type != "disable") support_for($stabilizers, $stabilizer_type);

        // always render stem support even if there isn't a stem.
        // rendering flat support w/no stem is much more common than a hollow keycap
        // so if you want a hollow keycap you'll have to turn support off entirely
        support_for($stem_positions, $stem_type);
      }
    }
  }
}

// actual full key with space carved out and keystem/stabilizer connectors
// this is an example key with all the fixins from settings.scad
module example_key(){
  include <settings.scad>
  key();
}

example_key();
