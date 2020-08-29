use <../functions.scad>

// we do this weird key_shape_type check here because rounded_square uses
// square_shape, and we want flat sides to work for that too.
// could be refactored, idk
module square_shape(size, delta, progress){
  if ($key_shape_type == "flat_sided_square") {
    flat_sided_square_shape(size, delta,progress);
  } else {
    square(size - delta * progress, center = true);
  }
}
/*
[-size.x /2,-size.y / 2],
[size.x / 2,-size.y / 2],
[size.x / 2, size.y / 2],
[-size.x / 2, size.y / 2] */

// for side-printed keycaps. Any amount of top tilt (on a keycap with a smaller
// top than bottom) makes the left and right side of the keycap convex. This
// shape makes the sides flat by making the top a trapezoid.
// This obviously doesn't work with rounded sides at all
module flat_sided_square_shape(size, delta, progress) {
  polygon(skin_flat_sided_square_shape(size, delta, progress));
}

function skin_flat_sided_square_shape(size,delta,progress) = [
  [(-size.x + (delta.x + extra_keytop_length_for_flat_sides()) * progress)/2, (-size.y + delta.y * progress)/2],
  [(size.x - (delta.x + extra_keytop_length_for_flat_sides()) * progress)/2,(-size.y + delta.y * progress)/2],
  [(size.x - (delta.x - extra_keytop_length_for_flat_sides()) * progress)/2, (size.y - delta.y * progress)/2],
  [(-size.x + (delta.x - extra_keytop_length_for_flat_sides()) * progress)/2, (size.y - delta.y * progress)/2]
];

function rectangle_profile(size) = [
  [-size.x/2, -size.y/2],
  [size.x/2, -size.y/2],
  [size.x/2, size.y/2],
  [-size.x/2, size.y/2],
];

function skin_square_shape(size, delta, progress, thickness_difference) =
  let(
    width = size[0],
    height = size[1],

    width_difference = delta[0] * progress,
    height_difference = delta[1] * progress,

    square_size = [
      width - width_difference - thickness_difference,
      height - height_difference - thickness_difference
    ]
  ) $key_shape_type == "flat_sided_square" ? skin_flat_sided_square_shape(size, delta, progress) : rectangle_profile(square_size);
