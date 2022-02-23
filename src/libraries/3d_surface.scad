// thanks Paul https://github.com/openscad/list-comprehension-demos/

include <../functions.scad>

module 3d_surface(size=$3d_surface_size, step=$3d_surface_step, bottom=-SMALLEST_POSSIBLE){
  function p(x, y) = [ x, y, max(0,$surface_function(x, y)) ];
  function p0(x, y) = [ x, y, bottom ];
  function rev(b, v) = b ? v : [ v[3], v[2], v[1], v[0] ];
  function face(x, y) = [ p(x, y + step), p(x + step, y + step), p(x + step, y), p(x + step, y), p(x, y), p(x, y + step) ];
  function fan(a, i) =
        a == 0 ? [ [ 0, 0, bottom ], [ i, -size, bottom ], [ i + step, -size, bottom ] ]
      : a == 1 ? [ [ 0, 0, bottom ], [ i + step,  size, bottom ], [ i,  size, bottom ] ]
      : a == 2 ? [ [ 0, 0, bottom ], [ -size, i + step, bottom ], [ -size, i, bottom ] ]
      :          [ [ 0, 0, bottom ], [  size, i, bottom ], [  size, i + step, bottom ] ];
  function sidex(x, y) = [ p0(x, y), p(x, y), p(x + step, y), p0(x + step, y) ];
  function sidey(x, y) = [ p0(x, y), p(x, y), p(x, y + step), p0(x, y + step) ];

  points = flatten(concat(
      // top surface
      [ for (x = [ -size : step : size - step ], y = [ -size : step : size - step ]) face(x, y) ],
      // bottom surface as triangle fan
      [ for (a = [ 0 : 3 ], i = [ -size : step : size - step ]) fan(a, i) ],
      // sides
      [ for (x = [ -size : step : size - step ], y = [ -size, size ]) rev(y < 0, sidex(x, y)) ],
      [ for (y = [ -size : step : size - step ], x = [ -size, size ]) rev(x > 0, sidey(x, y)) ]
  ));

  tcount = 2 * pow(2 * size / step, 2) + 8 * size / step;
  scount = 8 * size / step;

  tfaces = [ for (a = [ 0 : 3 : 3 * (tcount - 1) ] ) [ a, a + 1, a + 2 ] ];
  sfaces = [ for (a = [ 3 * tcount : 4 : 3 * tcount + 4 * scount ] ) [ a, a + 1, a + 2, a + 3 ] ];
  faces = concat(tfaces, sfaces);

  polyhedron(points, faces, convexity = 8);
}

module polar_3d_surface(size, step, bottom=-SMALLEST_POSSIBLE){
  function to_polar(q, size) = q * (90 / size);

  function p(x, y) = [
    $surface_distribution_function(to_polar(x, size), size),
    $surface_distribution_function(to_polar(y, size), size),
    max(0,$surface_function($surface_distribution_function(to_polar(x, size), size), $surface_distribution_function(to_polar(y, size), size)))
  ];
  function p0(x, y) = [ x, y, bottom ];
  function rev(b, v) = b ? v : [ v[3], v[2], v[1], v[0] ];
  function face(x, y) = [ p(x, y + step), p(x + step, y + step), p(x + step, y), p(x + step, y), p(x, y), p(x, y + step) ];
  function fan(a, i) =
        a == 0 ? [ [ 0, 0, bottom ], [ i, -size, bottom ], [ i + step, -size, bottom ] ]
      : a == 1 ? [ [ 0, 0, bottom ], [ i + step,  size, bottom ], [ i,  size, bottom ] ]
      : a == 2 ? [ [ 0, 0, bottom ], [ -size, i + step, bottom ], [ -size, i, bottom ] ]
      :          [ [ 0, 0, bottom ], [  size, i, bottom ], [  size, i + step, bottom ] ];
  function sidex(x, y) = [ p0(x, y), p(x, y), p(x + step, y), p0(x + step, y) ];
  function sidey(x, y) = [ p0(x, y), p(x, y), p(x, y + step), p0(x, y + step) ];

  points = flatten(concat(
      // top surface
      [ for (x = [ -size : step : size - step ], y = [ -size : step : size - step ]) face(x, y) ],
      // bottom surface as triangle fan
      [ for (a = [ 0 : 3 ], i = [ -size : step : size - step ]) fan(a, i) ],
      // sides
      [ for (x = [ -size : step : size - step ], y = [ -size, size ]) rev(y < 0, sidex(x, y)) ],
      [ for (y = [ -size : step : size - step ], x = [ -size, size ]) rev(x > 0, sidey(x, y)) ]
  ));

  tcount = 2 * pow(2 * size / step, 2) + 8 * size / step;
  scount = 8 * size / step;

  tfaces = [ for (a = [ 0 : 3 : 3 * (tcount - 1) ] ) [ a, a + 1, a + 2 ] ];
  sfaces = [ for (a = [ 3 * tcount : 4 : 3 * tcount + 4 * scount ] ) [ a, a + 1, a + 2, a + 3 ] ];
  faces = concat(tfaces, sfaces);

  polyhedron(points, faces, convexity = 8);
}

// defaults, overridden in functions.scad
// $surface_distribution_function = function(dim, size) sin(dim) * size;
// $surface_function = function(x,y) (sin(acos(x/$3d_surface_size))) * sin(acos(y/$3d_surface_size));
