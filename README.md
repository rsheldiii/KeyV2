# Parametric Mechanical Keycap Library

this library is meant to be a keycap and keyset construction library for mechanical keyboards.

## Let's Go! I wanna make some keycaps!

At the highest level this library supports Cherry and Alps switches, and has pre-defined key profiles for SA, DSA, DCS, and (some form of) OEM keycaps. `keys.scad` is meant as an entry point for everything but the most technical use; there should already be an example at the bottom to get you started! Pre-programmed key profiles can be found at `key_profiles.scad`.

## What if I want to customize my keycaps?

There is a bevy of supporting functions to customize your keycaps. You can add a brim to more easily print the stem, switch up the stem support type, make 2x2 keycaps for a POS system, add legends, rotate stems, and more. These functions can be found in `key_profiles.scad`, `key_sizes.scad`, `key_transformations.scad`, and `key_types.scad` currently, and can be referenced directly in `keys.scad`.

The `key()` function also supports children, and will place them in the center of the top of the keycap, if you want to quickly design your own artisan keycaps. I'll post an example later!

## What if I want to get _really_ technical?

If you're not afraid to write some code yourself, at the base level this library _should_ function well as a key profile design library. by loading up `key.scad` (notice no s) you can tweak variables in `settings.scad` to make your own profiles. You can design your own keyset with custom top skew, width and height, dish tilt, fonts, wall thickness, etc.




##TODO:
 * pull out side sculpting options to let people tweak them?
 * can now measure keycaps very accurately. need to redo measurements: [x] SA [ ] DCS [X] DSA [X] OEM?
 * Add inset stem to all profiles that need it. [x] OEM [ ] DCS?
 * customizer version where everything is copy/pasted in. needs to be last.
 * generate dishes via math? kind of hard, maybe later
