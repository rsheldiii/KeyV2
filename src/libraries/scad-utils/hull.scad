
// NOTE: this code uses
//  * experimental let() syntax
//  * experimental list comprehension syntax
//  * search() bugfix and feature addition
//  * vector min()/max()

// Calculates the convex hull of a set of points.
// The result is expressed in point indices.
// If the points are collinear (or 2d), the result is a convex
// polygon [i1,i2,i3,...], otherwise a triangular
// polyhedron [[i1,i2,i3],[i2,i3,i4],...]

function hull(points) =
  !(len(points) > 0)  ? [] :
  len(points[0]) == 2 ? convexhull2d(points) :
  len(points[0]) == 3 ? convexhull3d(points) : [];

epsilon = 1e-9;

// 2d version
function convexhull2d(points) =
len(points) < 3 ? [] : let(
  a=0, b=1,

  c = find_first_noncollinear([a,b], points, 2)

) c == len(points) ? convexhull_collinear(points) : let(

  remaining = [ for (i = [2:len(points)-1]) if (i != c) i ],

  polygon = area_2d(points[a], points[b], points[c]) > 0 ? [a,b,c] : [b,a,c]

) convex_hull_iterative_2d(points, polygon, remaining);


// Adds the remaining points one by one to the convex hull
function convex_hull_iterative_2d(points, polygon, remaining, i_=0) = i_ >= len(remaining) ? polygon :
  let (
    // pick a point
    i = remaining[i_],

    // find the segments that are in conflict with the point (point not inside)
    conflicts = find_conflicting_segments(points, polygon, points[i])

    // no conflicts, skip point and move on
  ) len(conflicts) == 0 ? convex_hull_iterative_2d(points, polygon, remaining, i_+1) : let(

    // find the first conflicting segment and the first not conflicting
    // conflict will be sorted, if not wrapping around, do it the easy way
    polygon = remove_conflicts_and_insert_point(polygon, conflicts, i)
  ) convex_hull_iterative_2d(
    points,
    polygon,
    remaining,
    i_+1
  );

function find_conflicting_segments(points, polygon, point) = [
  for (i = [0:len(polygon)-1]) let(j = (i+1) % len(polygon))
    if (area_2d(points[polygon[i]], points[polygon[j]], point) < 0)
      i
];

// remove the conflicting segments from the polygon
function remove_conflicts_and_insert_point(polygon, conflicts, point) =
  conflicts[0] == 0 ? let(
    nonconflicting = [ for(i = [0:len(polygon)-1]) if (!contains(conflicts, i)) i ],
    new_indices = concat(nonconflicting, (nonconflicting[len(nonconflicting)-1]+1) % len(polygon)),
    polygon = concat([ for (i = new_indices) polygon[i] ], point)
  ) polygon : let(
    prior_to_first_conflict = [ for(i = [0:1:min(conflicts)]) polygon[i] ],
    after_last_conflict     = [ for(i = [max(conflicts)+1:1:len(polygon)-1]) polygon[i] ],
    polygon = concat(prior_to_first_conflict, point, after_last_conflict)
  ) polygon;


// 3d version
function convexhull3d(points) =
len(points) < 3 ? [ for(i = [0:1:len(points)-1]) i ] : let (

  // start with a single triangle
  a=0, b=1, c=2,
  plane = plane(points,a,b,c),

  d = find_first_noncoplanar(plane, points, 3)

) d == len(points) ? /* all coplanar*/ let (

  pts2d = [ for (p = points) plane_project(p, points[a], points[b], points[c]) ],
  hull2d = convexhull2d(pts2d)

) hull2d : let(

  remaining = [for (i = [3:len(points)-1]) if (i != d) i],

  // Build an initial tetrahedron

  // swap b,c if d is in front of triangle t
  bc = in_front(plane, points[d]) ? [c,b] : [b,c],
  b = bc[0], c = bc[1],

  triangles = [
    [a,b,c],
    [d,b,a],
    [c,d,a],
    [b,d,c],
  ],

  // calculate the plane equations
  planes = [ for (t = triangles) plane(points, t[0], t[1], t[2]) ]

) convex_hull_iterative(points, triangles, planes, remaining);

// A plane equation (normal, offset)
function plane(points, a, b, c) = let(
  normal = unit(cross(points[c]-points[a], points[b]-points[a]))
) [
  normal,
  normal * points[a]
];

// Adds the remaining points one by one to the convex hull
function convex_hull_iterative(points, triangles, planes, remaining, i_=0) = i_ >= len(remaining) ? triangles :
  let (
    // pick a point
    i = remaining[i_],

    // find the triangles that are in conflict with the point (point not inside)
    conflicts = find_conflicts(points[i], planes),

    // for all triangles that are in conflict, collect their halfedges
    halfedges = [
      for(c = conflicts)
        for(i = [0:2])   let(j = (i+1)%3)
          [triangles[c][i], triangles[c][j]]
    ],

    // find the outer perimeter of the set of conflicting triangles
    horizon = remove_internal_edges(halfedges),

    // generate a new triangle for each horizon halfedge together with the picked point i
    new_triangles = [ for (h = horizon) concat(h,i) ],

    // calculate the corresponding plane equations
    new_planes = [ for (t = new_triangles) plane(points, t[0], t[1], t[2]) ]

  ) convex_hull_iterative(
    points,
    //  remove the conflicting triangles and add the new ones
    concat(remove_elements(triangles, conflicts), new_triangles),
    concat(remove_elements(planes, conflicts), new_planes),
    remaining,
    i_+1
  );

function convexhull_collinear(points) = let(
  n = points[1] - points[0],
  a = points[0],
  points1d = [ for(p = points) (p-a)*n ],
  min_i = min_index(points1d),
  max_i = max_index(points1d)
) [ min_i, max_i ];

function min_index(values,min_,min_i_,i_) =
  i_ == undef       ? min_index(values,values[0],0,1) :
  i_ >= len(values) ? min_i_ :
  values[i_] < min_ ? min_index(values,values[i_],i_,i_+1)
                    : min_index(values,min_,min_i_,i_+1);

function max_index(values,max_,max_i_,i_) =
  i_ == undef       ? max_index(values,values[0],0,1) :
  i_ >= len(values) ? max_i_ :
  values[i_] > max_ ? max_index(values,values[i_],i_,i_+1)
                    : max_index(values,max_,max_i_,i_+1);

function remove_elements(array, elements) = [
  for (i = [0:len(array)-1])
    if (!search(i, elements))
      array[i]
];

function remove_internal_edges(halfedges) = [
  for (h = halfedges)
    if (!contains(halfedges, reverse(h)))
      h
];

function plane_project(point, a, b, c) = let(
  u = b-a,
  v = c-a,
  n = cross(u,v),
  w = cross(n,u),
  relpoint = point-a
) [relpoint * u, relpoint * w];

function plane_unproject(point, a, b, c) = let(
  u = b-a,
  v = c-a,
  n = cross(u,v),
  w = cross(n,u)
) a + point[0] * u + point[1] * w;

function reverse(arr) = [ for (i = [len(arr)-1:-1:0]) arr[i] ];

function contains(arr, element) = search([element],arr)[0] != [] ? true : false;

function find_conflicts(point, planes) = [
  for (i = [0:len(planes)-1])
    if (in_front(planes[i], point))
      i
];

function find_first_noncollinear(line, points, i) =
  i >= len(points)           ? len(points) :
  collinear(points[line[0]],
            points[line[1]],
            points[i])       ? find_first_noncollinear(line, points, i+1)
                             : i;

function find_first_noncoplanar(plane, points, i) =
    i >= len(points)           ? len(points) :
  coplanar(plane, points[i]) ? find_first_noncoplanar(plane, points, i+1)
                             : i;

function distance(plane, point) = plane[0] * point - plane[1];

function in_front(plane, point) = distance(plane, point) > epsilon;

function coplanar(plane, point) = abs(distance(plane,point)) <= epsilon;

function unit(v) = v/norm(v);

function area_2d(a,b,c) = (
  a[0] * (b[1] - c[1]) +
  b[0] * (c[1] - a[1]) +
  c[0] * (a[1] - b[1])) / 2;

function collinear(a,b,c) = abs(area_2d(a,b,c)) < epsilon;

function spherical(cartesian) = [
    atan2(cartesian[1], cartesian[0]),
    asin(cartesian[2])
];

function cartesian(spherical) = [
  cos(spherical[1]) * cos(spherical[0]),
  cos(spherical[1]) * sin(spherical[0]),
  sin(spherical[1])
];


/// TESTCODE


phi = 1.618033988749895;

testpoints_on_sphere = [ for(p =
  [
    [1,phi,0], [-1,phi,0], [1,-phi,0], [-1,-phi,0],
    [0,1,phi], [0,-1,phi], [0,1,-phi], [0,-1,-phi],
    [phi,0,1], [-phi,0,1], [phi,0,-1], [-phi,0,-1]
  ])
  unit(p)
];

testpoints_spherical = [ for(p = testpoints_on_sphere) spherical(p) ];
testpoints_circular = [ for(a = [0:15:360-epsilon]) [cos(a),sin(a)] ];

testpoints_coplanar = let(u = unit([1,3,7]), v = unit([-2,1,-2])) [ for(i = [1:10]) rands(-1,1,1)[0] * u + rands(-1,1,1)[0] * v ];

testpoints_collinear_2d = let(u = unit([5,3]))    [ for(i = [1:20]) rands(-1,1,1)[0] * u ];
testpoints_collinear_3d = let(u = unit([5,3,-5])) [ for(i = [1:20]) rands(-1,1,1)[0] * u ];

testpoints2d = 20 * [for (i = [1:10]) concat(rands(-1,1,2))];
testpoints3d = 20 * [for (i = [1:50]) concat(rands(-1,1,3))];

// All points are on the sphere, no point should be red
translate([-50,0]) visualize_hull(20*testpoints_on_sphere);

// 2D points
translate([50,0]) visualize_hull(testpoints2d);

// All points on a circle, no point should be red
translate([0,50]) visualize_hull(20*testpoints_circular);

// All points 3d but collinear
translate([0,-50]) visualize_hull(20*testpoints_coplanar);

// Collinear
translate([50,50]) visualize_hull(20*testpoints_collinear_2d);

// Collinear
translate([-50,50]) visualize_hull(20*testpoints_collinear_3d);

// 3D points
visualize_hull(testpoints3d);


module visualize_hull(points) {

  hull = hull(points);

  %if (len(hull) > 0 && len(hull[0]) > 0)
    polyhedron(points=points, faces = hull);
  else
    polyhedron(points=points, faces = [hull]);

  for (i = [0:len(points)-1]) assign(p = points[i], $fn = 16) {
    translate(p) {
      if (hull_contains_index(hull,i)) {
        color("blue") sphere(1);
      } else {
        color("red") sphere(1);
      }
    }
  }

  function hull_contains_index(hull, index) =
    search(index,hull,1,0) ||
    search(index,hull,1,1) ||
    search(index,hull,1,2);

}
