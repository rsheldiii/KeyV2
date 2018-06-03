/*
keyset generator for the redox keyboard found here: https://www.thingiverse.com/thing:2704567

Modify the "profile", "unsculpted", "legend_inset", "home_row_bump" to achieve desired results.

Select what to render at the bottom of the file (which modules to call) (everything is commented out
by default...

Modify key legends with the "legend" function in each module (or keysdef in the case of alpha numeric keys)
*/
use <src/key.scad>
include <src/settings.scad>
include <src/key_sizes.scad>
include <src/key_profiles.scad>
include <src/key_types.scad>
include <src/key_transformations.scad>

//select the keyset profile options are: ["dcs", "oem", "sa", "g20", "dsa"]
profile = "dsa";
//select weather or not to sculpt the keys by row (set to true for real dsa keys or they will just be shorter sa keys)
unsculpted = false;
//choose if legends are inset or raised above the surface of the keys.
legend_inset = true;
//place a home row bump on the F and J keys
home_row_bump = true;
//regular legend font size (default is 6)
//$font_size = 6;
//symbol legend font size (symbols being arrows/enter/shift/backspace etc)
sym_size = 10;
//shifted key press font size
alt_size = 4.5;
//multi character font size
word_size = 4;



//used for selecting the profile row in a loop.
//rows = [5,1,2,3,4];
rows = [1,2,3,4,3];

module translate_u(x=0, y=0, z=0){
  translate([x * unit, y*unit, z*unit]) children();
}

module keypf(row) {
   key_profile(profile, unsculpted ? 3 : row) brimmed(0.25) cherry() key(legend_inset);
}

module make_keys(keys, scol=undef, ecol=undef) {
    ascol = scol == undef ? 0 : scol;
    aecol = ecol == undef ? len(keys) - 1 : ecol;
    for (i=[ascol:aecol]) {
        for (j=[0:len(keys[i])-1]) {
            if ((keys[i][j][0] == "F" || keys[i][j][0] == "J") && home_row_bump && len(keys[i][j]) == 1)
                translate_u(i, -j) legend(keys[i][j][0]) bump() keypf(rows[j]);
            else if ((keys[i][j][0] == "F" || keys[i][j][0] == "J") && home_row_bump && len(keys[i][j]) == 2)
                translate_u(i, -j) legend(keys[i][j][1], "top", size=alt_size) legend(keys[i][j][0], "bottom", size=alt_size) bump() keypf(rows[j]);
            else if (len(keys[i][j]) == 1)
                translate_u(i, -j) legend(keys[i][j][0]) keypf(rows[j]);
            else if (len(keys[i][j]) == 2)
                translate_u(i, -j) legend(keys[i][j][1], "top", size=alt_size) legend(keys[i][j][0], "bottom", size=alt_size) keypf(rows[j]);
        }
    }
}

//left hand alphanumeric keys
module alphanum_left(scol=undef, ecol=undef) {
    keysdef = [
        [["1", "!"], ["Q"], ["A"], ["Z"]],
        [["2", "@"], ["W"], ["S"], ["X"]],
        [["3", "#"], ["E"], ["D"], ["C"]],
        [["4", "$"], ["R"], ["F"], ["V"]],
        [["5", "%"], ["T"], ["G"], ["B"]]
    ];
    make_keys(keysdef, scol, ecol);
}

//left hand 1.25u modifier keys
module mod_left_outside() {
    translate_u(-1.125, 0) 1_25u() legend("ESC") keypf(1);
    translate_u(-1.125, -1) 1_25u() legend("TAB") keypf(2);
    translate_u(-1.125, -2) 1_25u() legend("CLK") keypf(3);
    translate_u(-1.125, -3) 1_25u() legend(chr(8657), size=sym_size) keypf(4);
}

//left hand bottom row modifier keys
module mod_left_bottom(half=undef) {
    if (half == undef || half == "left") {
        translate_u(-1, -4) legend("CTRL", size=word_size) keypf(3);
        translate_u(0, -4) legend("LYR", size=word_size) keypf(3);
        translate_u(1, -4) legend("GUI", size=word_size) keypf(3);
        translate_u(2, -4) legend("ALT", size=word_size) keypf(3);
    }
    if (half == undef || half == "right") translate_u(3.125, -4) 1_25u() legend(chr(8657), size=sym_size) keypf(3);
}

//left hand center modifier keys
module mod_left_inside() {
    translate_u(5, -0.125) 1_25uh() legend("[", "bottom", size=alt_size) legend("{", "top", size=alt_size) keypf(2);
    translate_u(5, -1.375) 1_25uh() legend("-", "bottom") legend("_", "top") keypf(3);
}

//left hand thumb cluster modifier keys
module mod_left_thumb() {
    translate_u(5, -3) legend("", size=word_size) keypf(2);
    translate_u(6, -3) legend(chr(8998), size=sym_size) keypf(2);
    translate_u(5, -4.25) 1_5uh() keypf(3);
    translate_u(6, -4.25)  1_5uh() legend(chr(9003), size=sym_size) keypf(3);
}

//render the entire left hand key set (or a half of a half for smaller printable groups)
module left(half=undef) {
    if (half == "left") {
        alphanum_left(0, 2);
        mod_left_outside();
        mod_left_bottom("left");
    }
    else if (half == "right") {
        alphanum_left(3, 4);
        mod_left_bottom("right");
        mod_left_inside();
        mod_left_thumb();
    }
    else {
        alphanum_left();
        mod_left_outside();
        mod_left_bottom();
        mod_left_inside();
        mod_left_thumb();
    }
}

//right hand alphanumeric keys
module alphanum_right(scol=undef, ecol=undef) {
    keysdef = [
        [["6", "^"], ["Y"], ["H"], ["N"]],
        [["7", "&"], ["U"], ["J"], ["M"]],
        [["8", "*"], ["I"], ["K"], [",", "<"]],
        [["9", "("], ["O"], ["L"], [".", ">"]],
        [["0", ")"], ["P"], [";", ":"], ["/", "?"]]
    ];
    make_keys(keysdef, scol, ecol);
}

//right hand 1.25u modifier keys
module mod_right_outside() {
    translate_u(5.125, 0) 1_25u() legend(chr(9003), size=sym_size) keypf(1);
    translate_u(5.125, -1) 1_25u() legend("\\", "bottom", size=alt_size) legend("|", "top", size=alt_size) keypf(2);
    translate_u(5.125, -2) 1_25u() legend("'", "bottom", size=alt_size) legend("\"", "top", size=alt_size) keypf(3);
    translate_u(5.125, -3) 1_25u() legend(chr(8657), size=sym_size) keypf(4);
}

//right hand bottom row modifier keys
module mod_right_bottom(half=undef) {
    if (half == undef || half == "right") {
        translate_u(5, -4) legend(chr(9654)) keypf(3);
        translate_u(4, -4) legend(chr(9660)) keypf(3);
        translate_u(3, -4) legend(chr(9650)) keypf(3);
        translate_u(2, -4) legend(chr(9664)) keypf(3);
    }
    if (half == undef || half == "left") translate_u(0.875, -4) 1_25u() legend(chr(8657), size=sym_size) keypf(3);
}

//right hand center modifier keys
module mod_right_inside() {
    translate_u(-1, -0.125) 1_25uh() legend("]", "bottom", size=alt_size) legend("}", "top", size=alt_size) keypf(2);
    translate_u(-1, -1.375) 1_25uh() legend("=", "bottom") legend("+", "top") keypf(3);
}

//right hand thum cluster modifier keys
module mod_right_thumb() {
    translate_u(-1, -3) legend("PGDN", size=word_size) keypf(2);
    translate_u(-2, -3) legend("PGUP", size=word_size) keypf(2);
    translate_u(-1, -4.25) 1_5uh() keypf(3);
    translate_u(-2, -4.25) 1_5uh() legend(chr(8629), size=sym_size) keypf(3);
}

//render entire right hand key set
module right(half=undef) {
    if (half == "left") {
        alphanum_right(0, 1);
        mod_right_bottom("left");
        mod_right_thumb();
        mod_right_inside();
    }
    else if (half == "right") {
        alphanum_right(2, 4);
        mod_right_outside();
        mod_right_bottom("right");
    }
    else {
        alphanum_right();
        mod_right_outside();
        mod_right_bottom();
        mod_right_thumb();
        mod_right_inside();
    }
}


//show entire set
//left();
//translate_u(10) right();

//individual sections for printing (keep stl output clusters close together for better slicing)
//left();
//left("left");
//left("right");
//alphanum_left();
//mod_left_outside();
//mod_left_bottom();
//mod_left_inside();
//mod_left_thumb();
//right();
//right("left");
//right("right");
//alphanum_right();
//mod_right_outside();
//mod_right_bottom();
//mod_right_thumb();
//mod_right_inside();

//inverted()
