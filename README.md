# Parametric Mechanical Keycap Library

![a slightly askew welcome picture](assets/welcome.png)

This library is a keycap and keyset construction library for mechanical keyboards, written in openSCAD.

Relevant links:
* Thingiverse: https://www.thingiverse.com/thing:2783650
* Shapeways: https://www.shapeways.com/designer/rsheldiii/creations
* Buy me a coffee: https://ko-fi.com/rsheldiii, but only if you want to!

# V2.0.0 Cutover

As of February 19th, 2022, the v2.0.0 branch has been merged into master.

This branch completely rewrote key.scad to be much simpler and faster. If you're just starting out, please use master and report any bugs you find.

If you branched off this repo previously, merging to master will probably break any additions you've made. If you need the prior version of the code for whatever reason, v1.1.0 is master just before the v2.0.0 merge. I will be backporting bugfixes to the v1 branch, so if you see v1.1.1 or higher, use that instead.

## How to run

#### OpenSCAD Proper (recommended way)

If you are technically inclined at all, this is definitely the best way to run the code. It's not very hard!

First, you'll need OpenSCAD: http://www.openscad.org/downloads.html. I highly recommend installing the development snapshot, as they generally support more features and are relatively stable. Development snapshots are listed in their own section on the downloads page.

After you have openSCAD installed, you need to download the code and run it. running `git clone https://github.com/rsheldiii/openSCAD-projects.git` if you have git, or downloading [this zip](https://github.com/rsheldiii/openSCAD-projects/archive/master.zip) and extracting the directory should do it. 

To make your own key, all you need to do is open `keys.scad` with openSCAD and modify this line:

```
dcs_row(5) legend("⇪", size=9) key();
``` 

To be whatever you want. For example, this is for a ctrl key on an OEM keyboard:  

```u(1.25) oem_row(3) legend("ctrl", size=4.5) key();```

It is possible to edit this project with an external editor by checking off Design => 'Automatic Reload and Preview' in OpenSCAD.

All examples below assume you are running the library on your computer with OpenSCAD.

#### OpenSCAD Customizer

If you're not technically inclined enough to start programming in OpenSCAD (it's easier than you think), you can look into [getting OpenSCAD's customizer working](https://github.com/rsheldiii/KeyV2/wiki/Getting-the-OpenSCAD-Customizer-working).

`customizer.scad` is auto-generated from the other files in this repository due to a quirk with how OpenSCAD shows customizer settings. It should be perpetually kept up to date, but there may be some bugs. feel free to open an issue if you find one!

#### Thingiverse Customizer

The easiest and buggiest way to run this program is to boot it up in [Thingiverse's Customizer](https://www.thingiverse.com/apps/customizer/run?thing_id=2783650). Explanations of each option are provided, as well as some default variables. Twiddle the variables to see how the keycap changes!

Unfortunately I don't think I can update the Thingiverse customizer without breaking it, so you don't get all the cool new features I've been developing over the past couple years.

## High-level overview

This library supports Cherry and Alps switches, and has pre-defined key profiles for SA, DSA, DCS, G20, Hi-Pro and (some form of) OEM keycaps. `keys.scad` is the entry point for everything but the most technical use. Pre-programmed key profiles can be found in the `key_profiles` directory.

Every key starts with default settings (provided in `settings.scad`) that are overridden by each function call. The simplest key you can make would be:

```
key();
```
![a bog-standard cherry key](assets/example1.JPG)


which is a bog-standard DCS row 5 (number / function row) keycap. To change how the key is generated, you can modify the settings directly or add predefined modifier functions like so:

```
// directly modified setting
$stem_inset = 1;
// settings changed through modifier function
sa_row(2) 2u() key();
```

You can chain as many modifier functions as you like!

![a 2 unit SA row 2 cherry key](assets/example2.JPG)

## Modifier functions

There is a bevy of supporting functions to customize your keycaps. You can add a brim to more easily print the stem with `brimmed_stem_support`, make 2x2 keycaps with `2u() 2uh()`, add legends, rotate stems, and more. All these functions manipulate the settings available to you in [`settings.scad`](https://github.com/rsheldiii/KeyV2/blob/master/src/settings.scad), though [some of them](https://github.com/rsheldiii/KeyV2/blob/851ececdb297c77bfbcd0a7cb4cdbc5e21970396/src/key_transformations.scad#L128) are quite complex.

These modifier functions can be found in [`key_profiles/`](https://github.com/rsheldiii/KeyV2/blob/master/src/key_profiles) for different keycap profiles, [`key_types.scad`](https://github.com/rsheldiii/KeyV2/blob/master/src/key_types.scad) for predefined settings for common keys (spacebar, left shift, etc), [`key_sizes.scad`](https://github.com/rsheldiii/KeyV2/blob/master/src/key_sizes.scad) for common unit sizes, and [`key_transformations.scad`](https://github.com/rsheldiii/KeyV2/blob/master/src/key_transformations.scad) for everything else. I encourage you to do some sleuthing but for a list of (most) helper functions with explanations, [Check out the wiki!](https://github.com/rsheldiii/KeyV2/wiki/KeyV2-Helper-Documentation)

These modifier functions may not cover every use case; in that case, you may have to write some SCAD yourself.

## Layouts

new to the library and still in a beta state, layouts allows you to generate an entire layout for a keyboard!

It is recommended to print layouts with a brim that extends to the next key.

```
60_percent_default("dcs") key();
```

![a standard 60 percent layout](assets/layout.png)

layouts accept children, so you can use them as a chained function like other modifiers. Be wary of accidentally overriding something the layout does for you though.

#### Example customizations

Let's say you wanted to generate some 2u stabilized keycaps for an Ergodox, you could do something like this:

```
legends = ["Enter", "Escape", "Tab", "Shift"];
for(y=[0:3]) {
  translate_u(0,y) 2u() dsa_row() stabilized() cherry() legend(legends[y], [0,0, 6]) key();
}
```

![a set of 2 unit keys with legends](assets/example3.JPG)

The `key()` function also supports children, and will place them in the center of the top of the keycap, if you want to quickly design your own artisan keycaps:

```
cherry() key() {
  translate([-6.25,2.3,-0]) scale(0.074) import("Assieme1.stl");
};
```

![an artisan key with no-face on it](assets/example4.JPG)

(no face courtesy of [this thing](https://www.thingiverse.com/thing:519727/))

Artisan support also supports _subtracting_ children by doing `key(inset=true) { ... }`, which is super helpful if you want to make keycaps with legends that are not text. The children will be placed just above the middle of the dish as per usual; you will need to translate them downwards (`ex translate([0,0,-1])`) to get them to 'dig in' to the top of the key.

## Tips and tricks

Looking for information or something specific? you could try checking out the [tips and tricks](TIPS_AND_TRICKS.md) section, or the [examples](/examples) directory.

## What if I want to get _really_ technical?

Now we're talkin!

At the base level this project should function well as an intensive key profile design library. by loading up `src/key.scad` (notice no s) you can tweak variables in `src/settings.scad` to prototype your own profiles. `key.scad` There are currently ~~44~~ a lot of different settings to tweak in `src/settings.scad` including width height and depth of the keycap, dish tilt, top skew, fonts, wall thickness, etc. If you want to see the full list of settings, feel free to browse the file itself: [settings.scad](https://github.com/rsheldiii/KeyV2/blob/master/src/settings.scad) it has lots of comments to help you get started.

This library should also be abstract enough to handle new dish types, keystems, key layouts, key profiles, and key shapes, in case you want to design your own Typewriter-style keycaps, support buckling spring keyboards or design some kind of triangular dished profile. `src/shapes.scad` `src/stems.scad` and `src/dishes.scad` all have a 'selector' module that should allow you to implement your own creations alongside what already exists in their constituent folders.

If you're interested in this, it may help to read the [Technical Design of a keycap](https://github.com/rsheldiii/KeyV2/wiki/Technical-Design-of-a-Keycap) wiki page.

Here's an example of tweaking the settings and code to make a 'stop sign' key profile:

In `key_shape()` in `shapes.scad`:

```
 else if ($key_shape_type == "stop_sign") {
   stop_sign_shape(size, delta, progress);
 }
```

in `src/shapes/stop_sign.scad`:

```
module stop_sign_shape(size, delta, progress){
  rotate([0,0,22.5]) circle(d=size[0] - delta[0], $fn=8);
}
```

In `keys.scad`:

```
union() {
  // make the font smaller
  $font_size = 3;
  // top of keycap is the same size as the bottom
  $width_difference = 0;
  $height_difference = 0;
  $key_shape_type="stop_sign";
  $dish_type = "cylindrical";
  // some keycap tops are slid backwards a little, and we don't want that
  $top_skew = 0;

  legends = ["Stop..", "Hammer", "time!"];

  for(x=[0:len(legends)-1]) {
    translate_u(x) cherry() key(legends[x]);
  }
}
```

![three stop-sign shaped keys with legends](assets/example5.JPG)

## Printing Help

Prints from this library are still challenging, despite all efforts to the contrary. Resin printers can create great looking keycaps; FDM printers can create usable keys that look alright, but may require tweaking to get prints acceptable. There are a few quick things that you can do:

1. If your stem isn't fitting in the switch, try upping the slop factor, accessed by giving your keystem function a numeric value (eg `cherry(0.5) key()`). This will lengthen the cross and decrease the overall size of the keystem. The default value is 0.3, and represents millimeters. Note that even if you have a resin printer, you should probably keep the default value; keys printed with 0 slop will barely fit on the stem.

2. If your keystem breaks off the bed mid-print, you can enable a brim by adding the `brimmed_stem_support()` modifier. This will give a solid base for the keystem to anchor into.

3. If you are unsatisfied with the quality of the top surface, you can try printing the keycap on a different surface than the bottom, though it may impact the quality of the stem.

4. If your newly-designed key shape is crashing into the switch, you can enable a clearance check for cherry switches by adding `$clearance_check = true;` to your keycap declaration. This will subtract a cherry switch shape from your keycap, highlighting any parts in red which intersect with the switch.

That's it, if you have any questions feel free to open an issue or leave a comment on thingiverse!

## TODO:
moved to [TODO doc](./TODO.md)

## Contributions welcome

 My lists of key profiles and layouts are not exhaustive at all, if you want to contribute feel free to make a PR with your changes and we can work together on getting it merged!
