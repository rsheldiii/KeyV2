CHANGELOG:
  V2.0.0:
    * added $fa values for minkowski and shape - so you can customize how much rounding there is
    * rejiggered `key.scad` pipeline for more clarity and less shapes
    * implemented "3d_surface" dish - still in beta
      * super cool though, you can even change the distribution of points on the surface! just make sure you use monotonically increasing functions
    * created "hull" folder to house different ways of creating the overall key shape
    * promoted "feature" folder to first-class folder with keytext and switch clearance as new residents
    * wrote this changelog!
    * implemented `$inner_shape_type`, use "flat" for less geometry or "disable" to make a completely solid key easily. didn't help render rounded keys though
    * side-printed keycaps are first class! you can use the `sideways()` modifier to set up sideways keycaps that have flat sides to print on.
    * it's much easier to make quick artisans now that the inside of the keycap is differenced from any additive features placed on top
    * `$linear_extrude_shape` and `$skin_extrude_shape` retired in favor of `$hull_shape_type`
    * added regular_polygon shape and octagonal and hexagonal key profiles
    * added beta kailh choc
    * Finally got ISO Enter working correctly!
    * STILL TODO:
      * add a magic scaling variable so you can scale the whole world up, see if that fixes degeneracy
      * Make flat stem support default
      * make flat inner shape default
      * new_key_structure changes doesn't take into account support stems properly; fix
      * support repositioning to print on the back surface of the keycap
      * implement regular polygon for skin extrusions
      * switch to skin-shaped extrusions by default
      * kailh choc has a non-square key unit; should I get that working for layouts etc? 
