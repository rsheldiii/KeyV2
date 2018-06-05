use <se3.scad>
use <linalg.scad>
use <lists.scad>

/*!
  Creates a rotation matrix

  xyz = euler angles = rz * ry * rx
  axis = rotation_axis * rotation_angle
*/
function rotation(xyz=undef, axis=undef) =
  xyz != undef && axis != undef ? undef :
  xyz == undef  ? se3_exp([0,0,0,axis[0],axis[1],axis[2]]) :
  len(xyz) == undef ? rotation(axis=[0,0,xyz]) :
  (len(xyz) >= 3 ? rotation(axis=[0,0,xyz[2]]) : identity4()) *
  (len(xyz) >= 2 ? rotation(axis=[0,xyz[1],0]) : identity4()) *
  (len(xyz) >= 1 ? rotation(axis=[xyz[0],0,0]) : identity4());

/*!
  Creates a scaling matrix
*/
function scaling(v) = [
  [v[0],0,0,0],
  [0,v[1],0,0],
  [0,0,v[2],0],
  [0,0,0,1],
];

/*!
  Creates a translation matrix
*/
function translation(v) = [
  [1,0,0,v[0]],
  [0,1,0,v[1]],
  [0,0,1,v[2]],
  [0,0,0,1],
];

// Convert between cartesian and homogenous coordinates
function project(x) = subarray(x,end=len(x)-1) / x[len(x)-1];

function transform(m, list) = [for (p=list) project(m * vec4(p))];
function to_3d(list) = [ for(v = list) vec3(v) ];
