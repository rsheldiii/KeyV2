// files
include <constants.scad>
include <functions.scad>
include <shapes.scad>
include <stems.scad>
include <stem_supports.scad>
include <dishes.scad>
include <supports.scad>
include <features.scad>
include <hulls.scad>

include <libraries/geodesic_sphere.scad>

// for skin hulls
use <libraries/scad-utils/transformations.scad>
use <libraries/scad-utils/lists.scad>
use <libraries/scad-utils/shapes.scad>
use <libraries/skin.scad>

// key shape including dish. used as the ouside and inside shape in hollow_key(). allows for itself to be shrunk in depth and width / height
module shape(thickness_difference, depth_difference=0){
  dished(depth_difference, $inverted_dish) {
    color($primary_color) shape_hull(thickness_difference, depth_difference, $inverted_dish ? 200 : 0);
  }
}

module rounded_shape() {
  color($primary_color) minkowski(){
    // half minkowski in the z direction
    shape($minkowski_radius * 2, $minkowski_radius/2);
    minkowski_object();
  }
}

// minkowski places this object at every vertex of the other object then mashes
// it all together
module minkowski_object() {
  // alternative minkowski shape that needs the bottom of the keycap to be trimmed
  /* sphere(1); */

  difference(){
    sphere(r=$minkowski_radius, $fa=360/$minkowski_facets);
    translate([0,0,-$minkowski_radius]){
      cube($minkowski_radius * 2, center=true);
    }
  }
}

module envelope(depth_difference=0) {
  s = 1.5;
  hull(){
    cube([total_key_width() * s, total_key_height() * s, 0.01], center = true);
    top_placement(SMALLEST_POSSIBLE + depth_difference){
      cube([top_total_key_width() * s, top_total_key_height() * s, 0.01], center = true);
    }
  }
}

// for when you want to take the dish out of things
// used for adding the dish to the key shape and making sure stems don't stick out the top
// creates a bounding box 1.5 times larger in width and height than the keycap.
module dished(depth_difference = 0, inverted = false) {
  intersection() {
    children();
    difference(){
      union() {
        // envelope is needed to "fill in" the rest of the keycap
        envelope(depth_difference);
        if (inverted) top_placement(depth_difference) color($secondary_color) _dish(inverted);
      }
      if (!inverted) top_placement(depth_difference) color($secondary_color) _dish(inverted);
      /* %top_placement(depth_difference) _dish(); */
    }
  }
}

// just to DRY up the code
// TODO is putting special vars in function signatures legal
module _dish(inverted=$inverted_dish) {
  translate([$dish_offset_x,0,0]) color($secondary_color) 
  dish(top_total_key_width() + $dish_overdraw_width, top_total_key_height() + $dish_overdraw_height, $dish_depth, inverted);
}

// puts its children at each keystem position provided
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
    color($tertiary_color) supports($support_type, stem_type, $stem_throw, $total_depth - $stem_throw);
  }
}

module stems_for(positions, stem_type) {
  keystem_positions(positions) {
    color($tertiary_color) stem(stem_type, stem_height(), $stem_slop, $stem_throw);
    if ($stem_support_type != "disable") {
      color($quaternary_color) stem_support($stem_support_type, stem_type, $stem_support_height, $stem_slop);
    }
  }
}

// put something at the top of the key, with no adjustments for dishing
module top_placement(depth_difference=0) {
  top_tilt_by_height = -$top_tilt / $key_height;
  top_tilt_y_by_length = $double_sculpted ? (-$top_tilt_y / $key_length) : 0;

  // minkowski_height = $rounded_key ? $minkowski_radius : 0;

  translate([$top_skew_x + $dish_skew_x, $top_skew + $dish_skew_y, $total_depth - depth_difference]){
    rotate([top_tilt_by_height, top_tilt_y_by_length,0]){
      children();
    }
  }
}

// puts its children at the center of the dishing on the key, including dish height
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

module front_of_key() {
  // all this math is to take top skew and tilt into account
  // we need to find the new effective height and depth of the top, front lip
  // of the keycap to find the angle so we can rotate things correctly into place
  total_depth_difference = sin(-$top_tilt) * (top_total_key_height()/2);
  total_height_difference = $top_skew + (1 - cos(-$top_tilt)) * (top_total_key_height()/2);

  angle = atan2(($total_depth - total_depth_difference), ($height_difference/2 + total_height_difference));
  hypotenuse = ($total_depth -total_depth_difference) / sin(angle);

  translate([0,-total_key_height()/2,0]) {
    rotate([-(90-angle), 0, 0]) {
      translate([0,0,hypotenuse/2]){
        children();
      }
    }
  }
}

module outer_shape() {
  if ($rounded_key == true) {
    rounded_shape();
  } else {
    shape(0, 0);
  }
}

module inner_shape(extra_wall_thickness = 0, extra_keytop_thickness = 0) {
  if ($inner_shape_type == "flat") {
    /* $key_shape_type="square"; */
    $height_slices = 1;
    // if inner_shape is flat, keytop_thickness will be dish_depth less than it should be, since the dish digs in that far.
    // so, we add dish_depth here
    color($primary_color) shape_hull($wall_thickness + extra_wall_thickness, $keytop_thickness + extra_keytop_thickness + $dish_depth, 0);
  } else {
    shape($wall_thickness + extra_wall_thickness, $keytop_thickness + extra_keytop_thickness);
  }
}

// additive objects at the top of the key
module additive_features(inset) {
  top_of_key() {
    if($key_bump) keybump($key_bump_depth, $key_bump_edge);
    if(!inset && $children > 0) color($secondary_color) children();
  }
  if($outset_legends) legends(0);
  // render the clearance check if it's enabled, but don't have it intersect with anything
  if ($clearance_check) %clearance_check();
}

// subtractive objects at the top of the key
module subtractive_features(inset) {
  top_of_key() {
    if (inset && $children > 0) color($secondary_color) children();
  }
  if(!$outset_legends) legends($inset_legend_depth);
  // subtract the clearance check if it's enabled, letting the user see the
  // parts of the keycap that will hit the cherry switch
  // this is a little confusing as it eats the stem too
  /* if ($clearance_check) clearance_check(); */
}

// features inside the key itself (stem, supports, etc)
module inside_features() {
  // Stems and stabilizers are not "inside features" unless they are fully
  // contained inside the cap. otherwise they'd be cut off when they are
  // differenced with the outside shape. this only matters if $stem_inset
  // is negative
  if ($stem_inset >= 0) stems_and_stabilizers();
  if ($support_type != "disable") translate([0, 0, $stem_inset]) support_for($stem_positions, $stem_type);
  if ($stabilizer_type != "disable") translate([0, 0, $stem_inset]) support_for($stabilizers, $stabilizer_type);
}

// all stems and stabilizers
module stems_and_stabilizers() {
  translate([0, 0, $stem_inset]) {
    if ($stabilizer_type != "disable") stems_for($stabilizers, $stabilizer_type);
    if ($stem_type != "disable") stems_for($stem_positions, $stem_type);
  }
}

// helpers for doubleshot keycaps for now
module inner_total_shape() {
  difference() {
    inner_shape();
    inside_features();
  }
}

module outer_total_shape(inset=false) {
  outer_shape();
  additive_features(inset) {
    children();
  };
}

// The final, penultimate key generation function.
// takes all the bits and glues them together. requires configuration with special variables.
module key(inset=false) {
  difference(){
    outer_total_shape(inset) {
      children();
    };

    if ($inner_shape_type != "disable") {
      translate([0,0,-SMALLEST_POSSIBLE]) {
        inner_total_shape();
      }
    }

    subtractive_features(inset) {
      children();
    };
  }

  // if $stem_inset is less than zero, we add the
  if ($stem_inset < 0) {
    stems_and_stabilizers();
  }
}

// actual full key with space carved out and keystem/stabilizer connectors
// this is an example key with all the fixins from settings.scad
module example_key(){
  include <settings.scad>
  key();
}

if (!$using_customizer) {
  example_key();
}
