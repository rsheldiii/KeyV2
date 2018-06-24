// so3

use <linalg.scad>

function rodrigues_so3_exp(w, A, B) = [
[1.0 - B*(w[1]*w[1] + w[2]*w[2]), B*(w[0]*w[1]) - A*w[2],          B*(w[0]*w[2]) + A*w[1]],
[B*(w[0]*w[1]) + A*w[2],          1.0 - B*(w[0]*w[0] + w[2]*w[2]), B*(w[1]*w[2]) - A*w[0]],
[B*(w[0]*w[2]) - A*w[1],          B*(w[1]*w[2]) + A*w[0],          1.0 - B*(w[0]*w[0] + w[1]*w[1])]
];

function so3_exp(w) = so3_exp_rad(w/180*PI);
function so3_exp_rad(w) =
combine_so3_exp(w,
  w*w < 1e-8
  ? so3_exp_1(w*w)
  : w*w < 1e-6
    ? so3_exp_2(w*w)
    : so3_exp_3(w*w));

function combine_so3_exp(w,AB) = rodrigues_so3_exp(w,AB[0],AB[1]);

// Taylor series expansions close to 0
function so3_exp_1(theta_sq) = [
  1 - 1/6*theta_sq,
  0.5
];

function so3_exp_2(theta_sq) = [
  1.0 - theta_sq * (1.0 - theta_sq/20) / 6,
  0.5 - 0.25/6 * theta_sq
];

function so3_exp_3_0(theta_deg, inv_theta) = [
  sin(theta_deg) * inv_theta,
  (1 - cos(theta_deg)) * (inv_theta * inv_theta)
];

function so3_exp_3(theta_sq) = so3_exp_3_0(sqrt(theta_sq)*180/PI, 1/sqrt(theta_sq));


function rot_axis_part(m) = [m[2][1] - m[1][2], m[0][2] - m[2][0], m[1][0] - m[0][1]]*0.5;

function so3_ln(m) = 180/PI*so3_ln_rad(m);
function so3_ln_rad(m) = so3_ln_0(m,
  cos_angle = rot_cos_angle(m),
  preliminary_result = rot_axis_part(m));

function so3_ln_0(m, cos_angle, preliminary_result) =
so3_ln_1(m, cos_angle, preliminary_result,
  sin_angle_abs = sqrt(preliminary_result*preliminary_result));

function so3_ln_1(m, cos_angle, preliminary_result, sin_angle_abs) =
  cos_angle > sqrt(1/2)
  ? sin_angle_abs > 0
    ? preliminary_result * asin(sin_angle_abs)*PI/180 / sin_angle_abs
    : preliminary_result
  : cos_angle > -sqrt(1/2)
    ? preliminary_result * acos(cos_angle)*PI/180 / sin_angle_abs
    : so3_get_symmetric_part_rotation(
        preliminary_result,
        m,
        angle = PI - asin(sin_angle_abs)*PI/180,
        d0 = m[0][0] - cos_angle,
        d1 = m[1][1] - cos_angle,
        d2 = m[2][2] - cos_angle
      );

function so3_get_symmetric_part_rotation(preliminary_result, m, angle, d0, d1, d2) =
so3_get_symmetric_part_rotation_0(preliminary_result,angle,so3_largest_column(m, d0, d1, d2));

function so3_get_symmetric_part_rotation_0(preliminary_result, angle, c_max) =
  angle * unit(c_max * preliminary_result < 0 ? -c_max : c_max);

function so3_largest_column(m, d0, d1, d2) =
    d0*d0 > d1*d1 && d0*d0 > d2*d2
    ?  [d0, (m[1][0]+m[0][1])/2, (m[0][2]+m[2][0])/2]
    : d1*d1 > d2*d2
      ? [(m[1][0]+m[0][1])/2, d1, (m[2][1]+m[1][2])/2]
      : [(m[0][2]+m[2][0])/2, (m[2][1]+m[1][2])/2, d2];

__so3_test = [12,-125,110];
echo(UNITTEST_so3=norm(__so3_test-so3_ln(so3_exp(__so3_test))) < 1e-8);
