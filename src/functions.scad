include <constants.scad>

// I use functions when I need to compute special variables off of other special variables
// functions need to be explicitly included, unlike special variables, which
// just need to have been set before they are used. hence this file

function stem_height() = $total_depth - $dish_depth - $stem_inset;

// cherry stem dimensions
function outer_cherry_stem(slop) = [7.2 - slop * 2, 5.5 - slop * 2];

// cherry stabilizer stem dimensions
function outer_cherry_stabilizer_stem(slop) = [4.85 - slop * 2, 6.05 - slop * 2];

// box (kailh) switches have a bit less to work with
function outer_box_cherry_stem(slop) = [6 - slop, 6 - slop];

// .005 purely for aesthetics, to get rid of that ugly crosshatch
function cherry_cross(slop, extra_vertical = 0) = [
  // horizontal tine
  [4.03 + slop, 1.25 + slop / 3],
  // vertical tine
  [1.15 + slop / 3, 4.23 + extra_vertical + slop / 3 + SMALLEST_POSSIBLE],
];

// actual mm key width and height
function total_key_width(delta = 0) = $bottom_key_width + $unit * ($key_length - 1) - delta;
function total_key_height(delta = 0) = $bottom_key_height + $unit * ($key_height - 1) - delta;

// actual mm key width and height at the top
function top_total_key_width() = $bottom_key_width + ($unit * ($key_length - 1)) - $width_difference;
function top_total_key_height() = $bottom_key_height + ($unit * ($key_height - 1)) - $height_difference;

function side_tilt(column) = asin($unit * column / $double_sculpt_radius);
// tan of 0 is 0, division by 0 is nan, so we have to guard
function extra_side_tilt_height(column) = side_tilt(column) ? ($double_sculpt_radius - ($unit * abs(column)) / tan(abs(side_tilt(column)))) : 0;

// (I think) extra length of the side of the keycap due to the keytop being tilted.
// necessary for calculating flat sided keycaps
function vertical_inclination_due_to_top_tilt() = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
// how much you have to expand the front or back of the keytop to make the side
// of the keycap a flat plane. 1 = front, -1 = back
// I derived this through a bunch of trig reductions I don't really understand.
function extra_keytop_length_for_flat_sides() = ($width_difference * vertical_inclination_due_to_top_tilt()) / ($total_depth);

// adds uniform rounding radius for round-anything polyRound
function add_rounding(p, radius)=[for(i=[0:len(p)-1])[p[i].x,p[i].y, radius]];
// computes millimeter length from unit length
function unit_length(length) = $unit * (length - 1) + 18.16;

/* we do some funky math here
 * basically you want to have the dish "dig in" to the keycap x millimeters
 * in order to do that you have to solve a small (2d) system of equations
 * where the chord of the spherical cross section of the dish is
 * the width of the keycap.
 */
// the distance you have to move the dish so it digs in depth millimeters
function cylindrical_dish_chord_length(width, depth) = 
    (pow(width, 2) - 4 * pow(depth, 2)) / (8 * depth);

//the radius of the dish
function cylindrical_dish_radius(width, depth) =
        (pow(width, 2) + 4 * pow(depth, 2)) / (8 * depth);
