use <scad-utils/transformations.scad>
use <scad-utils/lists.scad>

// Skin a set of profiles with a polyhedral mesh
module skin(profiles, loop=false /* unimplemented */) {
  P = max_len(profiles);
  N = len(profiles);

  profiles = [
    for (p = profiles)
      for (pp = augment_profile(to_3d(p),P))
        pp
  ];

  function quad(i,P,o) = [[o+i, o+i+P, o+i%P+P+1], [o+i, o+i%P+P+1, o+i%P+1]];

  function profile_triangles(tindex) = [
    for (index = [0:P-1])
      let (qs = quad(index+1, P, P*(tindex-1)-1))
        for (q = qs) q
  ];

    triangles = [
    for(index = [1:N-1])
          for(t = profile_triangles(index))
        t
  ];

  start_cap = [range([0:P-1])];
  end_cap   = [range([P*N-1 : -1 : P*(N-1)])];

  polyhedron(convexity=2, points=profiles, faces=concat(start_cap, triangles, end_cap));
}

// Augments the profile with steiner points making the total number of vertices n
function augment_profile(profile, n) =
  subdivide(profile,insert_extra_vertices_0([profile_lengths(profile),dup(0,len(profile))],n-len(profile))[1]);

function subdivide(profile,subdivisions) = let (N=len(profile)) [
  for (i = [0:N-1])
    let(n = len(subdivisions)>0 ? subdivisions[i] : subdivisions)
      for (p = interpolate(profile[i],profile[(i+1)%N],n+1))
        p
];

function interpolate(a,b,subdivisions) = [
  for (index = [0:subdivisions-1])
    let(t = index/subdivisions)
      a*(1-t)+b*t
];

function distribute_extra_vertex(lengths_count,ma_=-1) = ma_<0 ? distribute_extra_vertex(lengths_count, max_element(lengths_count[0])) :
  concat([set(lengths_count[0],ma_,lengths_count[0][ma_] * (lengths_count[1][ma_]+1) / (lengths_count[1][ma_]+2))], [increment(lengths_count[1],max_element(lengths_count[0]),1)]);

function insert_extra_vertices_0(lengths_count,n_extra) = n_extra <= 0 ? lengths_count :
  insert_extra_vertices_0(distribute_extra_vertex(lengths_count),n_extra-1);

// Find the index of the maximum element of arr
function max_element(arr,ma_,ma_i_=-1,i_=0) = i_ >= len(arr) ? ma_i_ :
  i_ == 0 || arr[i_] > ma_ ? max_element(arr,arr[i_],i_,i_+1) : max_element(arr,ma_,ma_i_,i_+1);

function max_len(arr) = max([for (i=arr) len(i)]);

function increment(arr,i,x=1) = set(arr,i,arr[i]+x);

function profile_lengths(profile) = [
  for (i = [0:len(profile)-1])
    profile_segment_length(profile,i)
];

function profile_segment_length(profile,i) = norm(profile[(i+1)%len(profile)] - profile[i]);

// Generates an array with n copies of value (default 0)
function dup(value=0,n) = [for (i = [1:n]) value];
