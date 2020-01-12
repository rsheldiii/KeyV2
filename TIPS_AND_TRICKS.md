# WIP

just want to make sure I put this here, I'm going to make this a much better document later

## Printing upside down

still in beta, but using `upside_down()` in a method chain will rotate keycaps to be upside down. This makes the stem print better and requires no support, but generally the top of the keycap comes out worse - unless it is flat.

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
