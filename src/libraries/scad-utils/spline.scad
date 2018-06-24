// Spline module for scad-util library
// Author Sergei Kuzmin, 2014.

// For n+1 given point and hense n intervals returns the spline coefficient matrix.
// param p defines the anchor points.
// File defines two functions: spline_args and spline.
// example usage:
// spl1 = spline_args(point, v1=[0,1,0], closed=false);
// interpolated_points = [for(t=[0:0.1:len(point)-1]) spline(spl1, t)]

use <linalg.scad>
use <lists.scad>

q1=[[1,0,0,0],[1,1,1,1],[0,1,2,3],[0,0,1,3]];
q1inv=[[1,0,0,0],[-3,3,-2,1],[3,-3,3,-2],[-1,1,-1,1]];
q2=[[0,0,0,0],[0,0,0,0],[0,-1,0,0],[0,0,-1,0]];
qn1i2=-q1inv*q2;
z3=[0,0,0];
z4=[0,0,0,0];

function matrix_power(m,n)= n==0? (len(m)==3?identity3():identity4()) :
        n==1 ? m : (n%2==1) ? matrix_power(m*m,floor(n/2))*m : matrix_power(m*m,n/2);

function det(m) = let(r=[for(i=[0:1:len(m)-1]) i]) det_help(m, 0, r);
// Construction indices list is inefficient, but currently there is no way to imperatively
// assign to a list element
function det_help(m, i, r) = len(r) == 0 ? 1 :
    m[len(m)-len(r)][r[i]]*det_help(m,0,remove(r,i)) - (i+1<len(r)? det_help(m, i+1, r) : 0);

function matrix_invert(m) = let(r=[for(i=[0:len(m)-1]) i]) [for(i=r) [for(j=r)
    ((i+j)%2==0 ? 1:-1) * matrix_minor(m,0,remove(r,j),remove(r,i))]] / det(m);
function matrix_minor(m,k,ri, rj) = let(len_r=len(ri)) len_r == 0 ? 1 :
    m[ri[0]][rj[k]]*matrix_minor(m,0,remove(ri,0),remove(rj,k)) - (k+1<len_r?matrix_minor(m,k+1,ri,rj) : 0);

function spline_u(i,p) = [p[i],p[i+1],z3,z3];

function spline_args(p, closed=false, v1=undef, v2=undef)=len(p)<2 ? []:
    let(q3=closed?q2:[z4, z4, v1==undef?[0,0,1,0]:[0,1,0,0], z4],
        q4=closed?q1:[[1,0,0,0], [1,1,1,1], z4, v2==undef?[0,0,1,3]:[0,1,2,3]],
        pcnt=closed? len(p) + 1 : len(p),
        un=[p[pcnt-2],p[closed?0:pcnt-1],v1==undef?z4:v1, v2==undef?z4:v2],
        sn=matrix_invert(q4+q3*matrix_power(qn1i2,pcnt-2))*(un-q3*q1inv*spline_helper(0, pcnt, p)))
    // result[i+1] recurrently defines result[i]. This is O(n) runtime with imperative language and
    // may be O(n^2) if OpenSCAD doesn't cache spline_si(i+1).
    [for(i=[0:pcnt-2]) spline_si(i, pcnt-2, p, sn)];

// n is number of points including pseudopoint for closed contour
// Weird construct cause there is no if statement for functions
function spline_helper(i, n, p) = let(u=[p[i], p[i+1], z3, z3])  i+3>=n? u : u-q2*q1inv*spline_helper(i+1, n, p);

// knowing s[j+1], calculate s[j]. Stop when found s[i]
function spline_si(i,n, p, sn) = i == n ? sn : q1inv*(spline_u(i,p)-q2*spline_si(i+1, n, p, sn));

// Takes array of (3n+1) points or (2n + 2) points, if tangent segments are symmetric.
// For non-symmetric version input is: point0, normal0, neg_normal1, point1, normal1, ... neg_normal_n, point_n
// For symmetric version: point0, normal0, point1, normal1, ... , normal_n_sub_1, point_n
// In the second case second tangent is constructed from the next tangent by symmetric map.
// I.e. if current points are p0,p1,p2 then anchor points are p0 and p2, first tangent defined by p1-p0,
// second tangent defined by p3-p2.
// Return array of coefficients accepted by spline(), spline_tan() and similar
function bezier3_args(p, symmetric=false) = let(step=symmetric?2:3)
    [for(i=[0:step:len(p)-3]) [[1,0,0,0],[-3,3,0,0],[3,-6,3,0],[-1,3,-3,1]]*
        (symmetric?[p[i],p[i]+p[i+1],p[i+2]-p[i+3],p[i+2]] : [p[i], p[i]+p[i+1], p[i+3]+p[i+2], p[i+3]])];

// s - spline arguments calculated by spline_args
// t - defines point on curve. each segment length is 1. I.e. t= 0..1 is first segment, t=1..2 - second.
function spline(s, t)= let(i=t>=len(s)?len(s)-1: floor(t), t2=t-i) [1,t2,t2*t2,t2*t2*t2]*s[i];

function spline_tan(s, t)= let(i=t>=len(s)?len(s)-1: floor(t), t2=t-i) [0,1,2*t2,3*t2*t2]*s[i];
function spline_tan_unit(s, t)= unit(spline_tan(s,t));
function spline_d2(s,t)= let(i=t>=len(s)?len(s)-1: floor(t), t2=t-i) [0,0,2,6*t2]*s[i];
function spline_binormal_unit(s,t)= unit(cross(spline_tan(s, t), spline_d2(s,t)));
function spline_normal_unit(s,t)= unit(cross(spline_tan(s, t), spline_binormal_unit(s,t)));

function spline_transform(s, t)=
    construct_Rt(transpose_3([spline_normal_unit(s,t), spline_binormal_unit(s,t), spline_tan_unit(s,t)]), spline(s,t));

// Unit tests
__s = spline_args([[0,10,0], [10,0,0],[0,-5,2]], v1=[0,1,0], v2=[-1,0,0], closed=true);
for(t=[0:0.01:len(__s)]) translate(spline(__s, t))
    cube([0.2,0.2,0.2], center=true);

__s1=spline_args([[0,0,0],[0,0,15], [26,0,26+15]], /*v1=[0,0,100],*/ v2=[40,0,0]);
for(t=[0:0.01:len(s1)]) translate(spline(__s1, t))
    cube([0.2,0.2,0.2], center=true);

__s2=bezier3_args([[0,0,0],[0,0,10],[0,0,15],[0,0,26*0.552284],[26,0,41],[26*0.552284,0,0]],symmetric=true);
echo(__s2);
for(t=[0:0.01:len(__s2)]) translate(spline(__s2, t))
    cube([0.2,0.2,0.2], center=true);

// Rotation methods taken from list-comprehension-demos/sweep.scad to demonstrate normal and binormal
// Normally spline_transform is more convenient
function __rotation_from_axis(x,y,z) = [[x[0],y[0],z[0]],[x[1],y[1],z[1]],[x[2],y[2],z[2]]];
function __rotate_from_to(a,b,_axis=[]) =
        len(_axis) == 0
        ? __rotate_from_to(a,b,unit(cross(a,b)))
        : _axis*_axis >= 0.99 ? __rotation_from_axis(unit(b),_axis,cross(_axis,unit(b))) *
    transpose_3(__rotation_from_axis(unit(a),_axis,cross(_axis,unit(a)))) : identity3();

__s3 = spline_args([[0,10,0], [6,6,0], [10,0,0],[0,-5,4]], v1=[0,1,0], v2=[-1,0,0], closed=true);
for(t=[0:0.05:len(__s3)]) translate(spline(__s3, t)) {
    translate([0,0,3]) multmatrix(m=__rotate_from_to([0,0,1],spline_normal_unit(__s3,t)))
        cylinder(r1=0.1, r2=0, h=1, $fn=3);
    translate([0,0,6]) multmatrix(m=__rotate_from_to([0,0,1],spline_binormal_unit(__s3,t)))
        cylinder(r1=0.1, r2=0, h=1, $fn=3);
}

translate([0,0,9]) for(t=[0:0.025:len(__s3)])
    multmatrix(spline_transform(__s3,t)) cube([1,1,0.1],center=true);
