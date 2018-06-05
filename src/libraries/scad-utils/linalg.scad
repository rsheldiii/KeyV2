// very minimal set of linalg functions needed by so3, se3 etc.

// cross and norm are builtins
//function cross(x,y) = [x[1]*y[2]-x[2]*y[1], x[2]*y[0]-x[0]*y[2], x[0]*y[1]-x[1]*y[0]];
//function norm(v) = sqrt(v*v);

function vec3(p) = len(p) < 3 ? concat(p,0) : p;
function vec4(p) = let (v3=vec3(p)) len(v3) < 4 ? concat(v3,1) : v3;
function unit(v) = v/norm(v);

function identity3()=[[1,0,0],[0,1,0],[0,0,1]];
function identity4()=[[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]];


function take3(v) = [v[0],v[1],v[2]];
function tail3(v) = [v[3],v[4],v[5]];
function rotation_part(m) = [take3(m[0]),take3(m[1]),take3(m[2])];
function rot_trace(m) = m[0][0] + m[1][1] + m[2][2];
function rot_cos_angle(m) = (rot_trace(m)-1)/2;

function rotation_part(m) = [take3(m[0]),take3(m[1]),take3(m[2])];
function translation_part(m) = [m[0][3],m[1][3],m[2][3]];
function transpose_3(m) = [[m[0][0],m[1][0],m[2][0]],[m[0][1],m[1][1],m[2][1]],[m[0][2],m[1][2],m[2][2]]];
function transpose_4(m) = [[m[0][0],m[1][0],m[2][0],m[3][0]],
                           [m[0][1],m[1][1],m[2][1],m[3][1]],
                           [m[0][2],m[1][2],m[2][2],m[3][2]],
                           [m[0][3],m[1][3],m[2][3],m[3][3]]];
function invert_rt(m) = construct_Rt(transpose_3(rotation_part(m)), -(transpose_3(rotation_part(m)) * translation_part(m)));
function construct_Rt(R,t) = [concat(R[0],t[0]),concat(R[1],t[1]),concat(R[2],t[2]),[0,0,0,1]];

// Hadamard product of n-dimensional arrays
function hadamard(a,b) = !(len(a)>0) ? a*b : [ for(i = [0:len(a)-1]) hadamard(a[i],b[i]) ];
