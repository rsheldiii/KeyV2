# WIP

just want to make sure I put this here, I'm going to make this a much better document later

## Printing upside down

still in beta, but using `upside_down()` in a method chain will rotate keycaps to be upside down. This makes the stem print better and requires no support, but generally the top of the keycap comes out worse - unless it is flat.

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
