# WIP Tips and Tricks section

just want to make sure I put this here, I'm going to make this a much better document later

## Fully sculpted caps

Fully sculpted keycaps are caps that also tilt inwards / outwards, cupping your fingers a bit.

Most profiles should support this now; you pass in a "column" value after the row value, and the cap will calculate how much extra height and tilt for that column.

the way this works is the program projects a large, imaginary cylinder that it inscribes the top of the keycaps into. Thus, the height and tilt can be tweaked by changing the `$double_sculpt_radius`, which changes the radius of that imaginary cylinder.

At the end of the day though, all the columnular sculpting is doing is adding extra height and y tilt to the top of the key. if you have some other aim than fitting to a cylinder you can control this directly with appropriate changes to `$top_tilt_y` and `$total_depth`, or perhaps changing the `side_tilt()` and `extra_side_tilt_height()` functions in [`functions.scad`](https://github.com/rsheldiii/KeyV2/blob/master/src/functions.scad) which are what the row profiles use.

## skin mode

SA, HiPro and DSA keycaps take _forever_ to render. This is a multifaceted issue that I don't want to get into here, but suffice to say _one_ of the reasons it takes so long is how the keycap is constructed from multiple, smaller slices. OpenSCAD takes more time to render the more objects you have, regardless of how they interact. Enter `$hull_shape_type = "skin"`.

`skin()` is a list comprehension function available [here](https://github.com/openscad/list-comprehension-demos/blob/master/skin.scad). The gist of it is that instead of having x number of keycap slices unioned together, we give `skin()` a set of profiles and it makes a single object out of it for us. This reduces the number of objects per keycap, which makes it easier to render them.

One current limitation of `skin()` is that I suck at math and can't translate [rounded_square](https://github.com/rsheldiii/KeyV2/blob/master/src/shapes/rounded_square.scad) into a function, which means that we miss out on the very nice bowing exhibited on these profiles. once we can translate that to math however, we'll be in business.

## Printing upside down

still in beta, but using `upside_down()` in a method chain will rotate keycaps to be upside down. This makes the stem print better and requires no support, but generally the top of the keycap comes out worse - unless it is flat. Worth noting that you can probably set `$stem_inner_slop` to 0 if you print upside down - elephant's foot is the largest contributor to stems not fitting correctly.

### "doubleshot" letters with a regular printer

While printing upside down, you can do yourself a favor and embed some legends! use code like below:

```
legends = ["F1", "1", "q", "a", "z", ""];
for (x = [0:1:4]) {
  translate_u(0,-x) legend(legends[x]) g20_row(3, 0) upside_down() {
      $stem_support_type = "disable";
      key(true);
      dished() {
        legends($inset_legend_depth);
      }
  }
}
```

and comment out either `key(true)` or the whole `dished` segment. This code generates keycaps with inset legends and the legends that fit inside those insets.

Run just the legends through your slicer first and make sure to turn off anything like skirts or brims, it should print your legends in a single layer on your print bed. Leave them there, swap filaments, and then print the rest of the keycaps around them in a different color. The result is pretty impressive. They aren't quite doubleshot, since the main benefit of doubleshots is the plastic goes all the way through the keycap, but they look incredibly impressive for what they are.

### No stem support

If you're printing updside down you'll want to disable stem supports. you can change the `$stem_support_type`, or just use the `no_stem_support()` modifier function

## front print legends and location / font size

still in beta, set `$front_print_legends = true` to have legends print on the front instead of the top of the keycaps.   

## Clearance check

doing some funky stuff and want to make sure your keycap won't hit the keyswitch? set `$clearance_check = true` and a red-colored depressed switch will show up in preview, cutting away at what contacts the switch.

## Envelope

the 'envelope' of a keycap is used to clip geometry - most notably the dishing at the top of the keycap. if something doesn't look right, you can drop `%envelope()` right next to `key()` to see if it's the envelope cutting things off:

```
g20_row() legend("Q", [0,0], 3) {
   key();
   %envelope();
 }
```

## stem inset

If you want the more refined top surface that printing upright brings, but you are having a bad time with elephant's foot, you can enable some `$stem_inset` and see if that helps. you'll have to figure out what support works best for you.
