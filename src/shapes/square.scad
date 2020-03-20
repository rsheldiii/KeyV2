module square_shape_old(size, delta, progress){
  square(size - delta * progress, center = true);
}
/*
[-size.x /2,-size.y / 2],
[size.x / 2,-size.y / 2],
[size.x / 2, size.y / 2],
[-size.x / 2, size.y / 2] */

module square_shape(size, delta, progress) {
  alpha = sin($top_tilt) * (top_total_key_height() - $corner_radius * 2) * 0.5;
  gamma = ($width_difference * alpha) / ($total_depth+alpha);
  polygon(points=[
    [-size.x /2 + delta.x * progress/2 , -size.y / 2 + delta.y * progress/2],
    [size.x / 2 - delta.x * progress/2,-size.y / 2 + delta.y * progress/2],
    [size.x / 2 - delta.x * progress/2 + gamma * progress, size.y / 2 - delta.y * progress/2],
    [-size.x / 2 + delta.x * progress/2 - gamma * progress, size.y / 2 - delta.y * progress/2]
  ]);
}
