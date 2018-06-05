// side sculpting functions
// bows the sides out on stuff like SA and DSA keycaps
function side_sculpting(progress) = (1 - progress) * $side_sculpting_factor;
// makes the rounded corners of the keycap grow larger as they move upwards
function corner_sculpting(progress) = pow(progress, 2) * $corner_sculpting_factor;

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

                square_size = [width - extra_width_this_slice, height - extra_height_this_slice];
		offset(r = extra_corner_radius_this_slice) offset(r = -extra_corner_radius_this_slice) {
                    if ($enable_more_side_sculpting != false && progress > 0) {
                        side_rounded_square(square_size, r = $more_side_sculpting_factor * progress);
                    } else {
			square(square_size, center=center);
                    }
		}
}

// Brings in a square at each corner by r, applied over the length of each side.
module side_rounded_square(size, r) {
    if ($enable_more_side_sculpting == "slow") {
        side_rounded_square_slow(size, r);
    } else {
        side_rounded_square_fast(size, r);
    }
}
module side_rounded_square_fast(size, r) {
    iw = size.x - 2 * r;
    ih = size.y - 2 * r;
    resolution = 100;
    sr = r / resolution * 2;
    sh = ih / resolution;
    sw = iw / resolution;
    union() {
        translate([-iw/2, 0]) scale([sr, sh]) circle(d = resolution);
        translate([iw/2, 0]) scale([sr, sh]) circle(d = resolution);
        translate([0, -ih/2]) scale([sw, sr]) circle(d = resolution);
        translate([0, ih/2]) scale([sw, sr]) circle(d = resolution);
        square([iw, ih], center=true);
    }
}
module side_rounded_square_slow(size, r) {
    // These two from: https://openscadsnippetpad.blogspot.co.nz/2017/05/circle-defined-by-three-points.html
    function len3(v) = sqrt(pow(v.x, 2) + pow(v.y, 2));
    function circle_by_three_points(A, B, C) = let (
        yD_b = C.y - B.y,  xD_b = C.x - B.x,  yD_a = B.y - A.y,
        xD_a = B.x - A.x,  aS = yD_a / xD_a,  bS = yD_b / xD_b,
        cex = (aS * bS * (A.y - C.y) + bS * (A.x + B.x) - aS * (B.x + C.x)) / (2 * (bS - aS)),
        cey = -1 * (cex - (A.x + B.x) / 2) / aS + (A.y + B.y) / 2
        )
        [cex, cey];

    w = size.x - r * 2;
    h = size.y - r * 2;
    cw = circle_by_three_points([-w / 2, 0], [0, r], [w / 2, 0]);
    rw = len3([w / 2, 0] - cw);
    ch = circle_by_three_points([0, -h / 2], [r, 0], [0, h / 2]);
    rh = len3([0, h / 2] - ch);
    intersection() {
        translate(cw + [0, h / 2]) circle(r = rw, $fa=1);
        translate(cw * -1 + [0, -h / 2]) circle(r = rw, $fa=1);
        translate(ch + [w / 2, 0]) circle(r = rh, $fa=1);
        translate(ch * -1 + [-w / 2, 0]) circle(r = rh, $fa=1);
    }
}
