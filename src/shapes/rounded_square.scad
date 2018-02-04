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
