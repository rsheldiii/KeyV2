include <../functions.scad>
include <../libraries/round-anything/polyround.scad>

width_ratio = unit_length(1.25) / unit_length(1.5);
height_ratio = unit_length(1) / unit_length(2);



module ISO_enter_shape(size, delta, progress){
  width = size[0];
  height = size[1];


  // in order to make the ISO keycap shape generic, we are going to express the
  // 'elbow point' in terms of ratios. an ISO enter is just a 1.5u key stuck on
  // top of a 1.25u key, but since our key_shape function doesnt understand that
  // and wants to pass just width and height, we make these ratios to know where
  // to put the elbow joint

  delta = delta / 2;

  pointArray = [
      [                   0-delta.x,                     0-delta.y], // top right
      [                   0-delta.x,               -height+delta.y], // bottom right
      [-width * width_ratio+delta.x,               -height+delta.y], // bottom left
      [-width * width_ratio + delta.x,-height * height_ratio+delta.y], // inner middle point
      [              -width + delta.x,-height * height_ratio + delta.y], // outer middle point
      [              -width + delta.x,                     0-delta.y]  // top left
  ];

  minkowski(){
    circle(r=$corner_radius);
    // gives us rounded inner corner
    offset(r=-$corner_radius*2) {
      translate([(width * width_ratio)/2, height/2]) polygon(points=pointArray);
    }
  }
}

function iso_enter_vertices(size, delta, progress, thickness_difference) = [
  [                       0-delta.x/2 * progress - thickness_difference/8,                      0 - delta.y / 2 * progress - thickness_difference/8], // top right
  [                       0-delta.x/2 * progress - thickness_difference/8,               -size[1] + delta.y / 2 * progress + thickness_difference/8], // bottom right
  [-size[0] * width_ratio + delta.x/2 * progress + thickness_difference/8,               -size[1] + delta.y / 2 * progress + thickness_difference/8], // bottom left
  [-size[0] * width_ratio + delta.x/2 * progress + thickness_difference/8,-size[1] * height_ratio + delta.y / 2 * progress + thickness_difference/2], // inner middle point
  [              -size[0] + delta.x/2 * progress + thickness_difference/8,-size[1] * height_ratio + delta.y / 2 * progress + thickness_difference/2], // outer middle point
  [              -size[0] + delta.x/2 * progress + thickness_difference/8,                      0 - delta.y / 2 * progress - thickness_difference/8]  // top left
] + [
  [(size[0] * width_ratio)/2, size[1]/2 ],
  [(size[0] * width_ratio)/2, size[1]/2 ],
  [(size[0] * width_ratio)/2, size[1]/2 ],
  [(size[0] * width_ratio)/2, size[1]/2 ],
  [(size[0] * width_ratio)/2, size[1]/2 ],
  [(size[0] * width_ratio)/2, size[1]/2 ]
];

// no rounding on the corners at all
function skin_iso_enter_shape(size, delta, progress, thickness_difference) =
  polyRound(
    add_rounding(
      iso_enter_vertices(
        size,
        delta,
        progress,
        thickness_difference
      ),
      $corner_radius
    ),
    $shape_facets
  );
