module 3d_surface_dish(width, height, depth, inverted) {
  echo(inverted ? "inverted" : "not inverted");
  // scale_factor is dead reckoning
  scale_factor = 1.2;
  // the edges on this behave differently than with the previous dish implementations
  scale([width*scale_factor/$3d_surface_size/2,height*scale_factor/$3d_surface_size/2,depth]) rotate([inverted ? 0:180,0,0]) polar_3d_surface(bottom=-10);
  /* %scale([width*scale_factor/$3d_surface_size/2,height*scale_factor/$3d_surface_size/2,depth]) rotate([180,0,0]) polar_3d_surface(bottom=-10); */

}
