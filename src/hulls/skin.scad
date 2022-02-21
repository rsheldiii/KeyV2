// use skin() instead of successive hulls. much more correct, and looks faster
// too, in most cases. successive hull relies on overlapping faces which are
// not good. But, skin works on vertex sets instead of shapes, which makes it
// a lot more difficult to use
module skin_extrude_shape_hull(thickness_difference, depth_difference, extra_slices = 0 ) {
  skin([
    for (index = [0:$height_slices + extra_slices])
      let(
        progress = (index / $height_slices),
        skew_this_slice = $top_skew * progress,
        x_skew_this_slice = $top_skew_x * progress,
        depth_this_slice = ($total_depth - depth_difference) * progress,
        tilt_this_slice = -$top_tilt / $key_height * progress,
        y_tilt_this_slice = $double_sculpted ? (-$top_tilt_y / $key_length * progress) : 0
      )
      skin_shape_slice(progress, thickness_difference, skew_this_slice, x_skew_this_slice, depth_this_slice, tilt_this_slice, y_tilt_this_slice)
  ]);
}

function skin_shape_slice(progress, thickness_difference, skew_this_slice, x_skew_this_slice, depth_this_slice, tilt_this_slice, y_tilt_this_slice) =
  transform(
    translation([x_skew_this_slice,skew_this_slice,depth_this_slice]),
    transform(
      rotation([tilt_this_slice,y_tilt_this_slice,0]),
        skin_key_shape([
          total_key_width(0) - thickness_difference,
          total_key_height(0) - thickness_difference,
          ],
          [$width_difference, $height_difference],
          progress,
          thickness_difference
        )
    )
  );
