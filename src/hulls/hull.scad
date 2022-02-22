module hull_shape_hull(thickness_difference, depth_difference, extra_slices = 0) {
  for (index = [0:$height_slices - 1 + extra_slices]) {
    hull() {
      placed_shape_slice(index / $height_slices, thickness_difference, depth_difference);
      placed_shape_slice((index + 1) / $height_slices, thickness_difference, depth_difference);
    }
  }
}

module placed_shape_slice(progress, thickness_difference, depth_difference) {
  skew_this_slice = $top_skew * progress;
  x_skew_this_slice = $top_skew_x * progress;

  depth_this_slice = ($total_depth - depth_difference) * progress;

  tilt_this_slice = -$top_tilt / $key_height * progress;
  y_tilt_this_slice = $double_sculpted ? (-$top_tilt_y / $key_length * progress) : 0;

  translate([x_skew_this_slice, skew_this_slice, depth_this_slice]) {
    rotate([tilt_this_slice,y_tilt_this_slice,0]){
      shape_slice(progress, thickness_difference, depth_difference);
    }
  }
}

module shape_slice(progress, thickness_difference, depth_difference) {
  linear_extrude(height = SMALLEST_POSSIBLE, scale = 1){
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
