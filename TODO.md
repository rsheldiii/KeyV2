TODO:
  * implement key_shape_at_progress which allows you to query for the exact 2d outline of the keycap at a given height
    * this makes certain functions easier - building the envelope for instance
    * requires breaking out shape_slice, and creating a polygon of the skin_shape_slice slices
  * dishes add / remove height from keycaps, particularly spherical dishes
    * a bandaid solution would be to allow you to modify where the keytop is along the progression of the keycap
      * you can't just set a new total_depth because of how width_difference and height_difference work
    * the true solution would be to rewrite how the dishes work to make them very graduated at the edges
  * implement regular polygon for skin extrusions
  * switch to skin-shaped extrusions by default
  * kailh choc has a non-square key unit; should I get that working for layouts etc? 
  * move everything over to layouts requiring a child key
  * add an "errors" or "warnings" or "suggestions" echo section in key.scad, right when the key is being made, so the errors don't get lost / repeated
