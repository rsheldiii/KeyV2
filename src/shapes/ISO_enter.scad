// corollary is rounded_square
// NOT 3D
function unit_length(length) = unit * (length - 1) + 18.16;

module ISO_enter_shape(size, delta, progress){
  width = size[0];
  height = size[1];


  // in order to make the ISO keycap shape generic, we are going to express the
  // 'elbow point' in terms of ratios. an ISO enter is just a 1.5u key stuck on
  // top of a 1.25u key, but since our key_shape function doesnt understand that
  // and wants to pass just width and height, we make these ratios to know where
  // to put the elbow joint

  width_ratio = unit_length(1.25) / unit_length(1.5);
  height_ratio = unit_length(1) / unit_length(2);

  pointArray = [
      [                   0,                     0], // top right
      [                   0,               -height], // bottom right
      [-width * width_ratio,               -height], // bottom left
      [-width * width_ratio,-height * height_ratio], // inner middle point
      [              -width,-height * height_ratio], // outer middle point
      [              -width,                     0]  // top left
  ];

  minkowski(){
    circle(r=corner_size);
    // gives us rounded inner corner
    offset(r=-corner_size*2) {
      translate([(width * width_ratio)/2, height/2]) polygon(points=pointArray);
    }
  }
}

function iso_enter_vertices(width, height, width_ratio, height_ratio, wd, hd) = [
  [                   0-wd,                     0-hd], // top right
  [                   0-wd,               -height+hd], // bottom right
  [-width * width_ratio+wd,               -height+hd], // bottom left
  [-width * width_ratio+wd,-height * height_ratio+hd], // inner middle point
  [              -width+wd,-height * height_ratio+hd], // outer middle point
  [              -width+wd,                     0-hd]  // top left
] + [
  [(width * width_ratio)/2, height/2 ],
  [(width * width_ratio)/2, height/2 ],
  [(width * width_ratio)/2, height/2 ],
  [(width * width_ratio)/2, height/2 ],
  [(width * width_ratio)/2, height/2 ],
  [(width * width_ratio)/2, height/2 ]
];

// no rounding on the corners at all
function skin_iso_enter_shape(size, delta, progress, thickness_difference) =
  iso_enter_vertices(size.x, size.y, unit_length(1.25) / unit_length(1.5), unit_length(1) / unit_length(2), thickness_difference/2 + delta.x * progress/2, thickness_difference/2 + delta.y * progress/2);
