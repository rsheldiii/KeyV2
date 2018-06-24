function square(size) = [[-size,-size], [-size,size], [size,size], [size,-size]] / 2;

function circle(r) = [for (i=[0:$fn-1]) let (a=i*360/$fn) r * [cos(a), sin(a)]];

function regular(r, n) = circle(r, $fn=n);

function rectangle_profile(size=[1,1]) = [
  // The first point is the anchor point, put it on the point corresponding to [cos(0),sin(0)]
  [ size[0]/2,  0],
  [ size[0]/2,  size[1]/2],
  [-size[0]/2,  size[1]/2],
  [-size[0]/2, -size[1]/2],
  [ size[0]/2, -size[1]/2],
];

// FIXME: Move rectangle and rounded rectangle from extrusion
