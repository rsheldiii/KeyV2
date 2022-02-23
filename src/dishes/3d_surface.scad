include <../libraries/3d_surface.scad>

module 3d_surface_dish(width, height, depth, inverted) {
  echo(inverted ? "inverted" : "not inverted");
  // scale_factor is dead reckoning
  // it doesn't have to be dead reckoning for anything but sculpted sides
  // we know the angle of the sides from the width difference, height difference,
  // skew and tilt of the top. it's a pain to calculate though
  scale_factor = 1.11;
  // the edges on this behave differently than with the previous dish implementations
  scale([width*scale_factor/$3d_surface_size/2,height*scale_factor/$3d_surface_size/2,depth])
    rotate([inverted ? 0:180,0,180])
      polar_3d_surface(size=$3d_surface_size, step=$3d_surface_step, bottom=-10);
  /* %scale([width*scale_factor/$3d_surface_size/2,height*scale_factor/$3d_surface_size/2,depth]) rotate([180,0,0]) polar_3d_surface(bottom=-10); */

}
