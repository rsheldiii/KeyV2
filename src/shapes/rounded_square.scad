module rounded_square_shape(size, delta, progress, center = true) {
    width = size[0];
    height = size[1];

    width_difference = delta[0];
    height_difference = delta[1];

    // computed values for this slice
    extra_width_this_slice = (width_difference) * progress;
    extra_height_this_slice = (height_difference) * progress;
    extra_corner_radius_this_slice = ($corner_radius);

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
