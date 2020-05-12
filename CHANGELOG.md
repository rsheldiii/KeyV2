CHANGELOG:
  V2.0.0:
    * added $fa values for minkowski and shape - so you can customize how much rounding there is
    * rejiggered `key.scad` pipeline for more clarity and less shapes
    * implemented "3d_surface" dish - still in beta
      * super cool though, you can even change the distribution of points on the surface! just make sure you use monotonically increasing functions
    * created "hull" folder to house different ways of creating the overall key shape
    * promoted "feature" folder to first-class folder with keytext and switch clearance as new residents
    * wrote this changelog!
    * `flat_keytop_bottom` for less geometry. didn't help render rounded keys though
    * still todo: add a magic scaling variable so you can scale the whole world up, see if that fixes degeneracy
    * side-printed keycaps are first class! you can use the `sideways()` modifier to set up sideways keycaps that have flat sides to print on.
    * it's much easier to make quick artisans now that the inside of the keycap is differenced from any additive features placed on top
