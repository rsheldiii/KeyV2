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
profile = "oem";
//select weather or not to sculpt the keys by row (you probably want true for dsa only)
unsculpted = false;
//choose if legends are inset or raised above the surface of the keys.
legend_inset = true;
//place a home row bump on the F and J keys
home_row_bump = true;

//used for selecting the profile row in a loop.
rows = [5,1,2,3,4];

module translate_u(x=0, y=0, z=0){
  translate([x * unit, y*unit, z*unit]) children();
}

module keypf(row) {
   key_profile(profile, unsculpted ? 3 : row) brimmed(0.25) cherry() key(legend_inset);
}

module make_keys(keys) {
    for (i=[0:len(keys)-1]) {
        for (j=[0:len(keys[i])-1]) {
            if ((keys[i][j][0] == "F" || keys[i][j][0] == "J") && home_row_bump && len(keys[i][j]) == 1)
                translate_u(i, -j) legend(keys[i][j][0]) bump() keypf(rows[j]);
            else if ((keys[i][j][0] == "F" || keys[i][j][0] == "J") && home_row_bump && len(keys[i][j]) == 2)
                translate_u(i, -j) legend(keys[i][j][1], "top", "left", 3) legend(keys[i][j][0]) bump() keypf(rows[j]);
            else if (len(keys[i][j]) == 1)
                translate_u(i, -j) legend(keys[i][j][0]) keypf(rows[j]);
            else if (len(keys[i][j]) == 2)
                translate_u(i, -j) legend(keys[i][j][1], "top", "left", 3) legend(keys[i][j][0]) keypf(rows[j]);
        }
    }
}

module make_1_25_col(keys) {
    for (i=[0:len(keys)-1]) {
        translate_u(0, -i) 1_25u() legend(keys[i]) keypf(rows[i]);
    }
}

//left hand alphanumeric keys
module alphanum_left() {
    keysdef = [
        [["1", "!"], ["Q"], ["A"], ["Z"]],
        [["2", "@"], ["W"], ["S"], ["X"]],
        [["3", "#"], ["E"], ["D"], ["C"]],
        [["4", "$"], ["R"], ["F"], ["V"]],
        [["5", "%"], ["T"], ["G"], ["B"]]
    ];
    make_keys(keysdef);
}

//left hand 1.25u modifier keys
module mod_left_outside() {
    translate_u(-1.125, 0) make_1_25_col(["ESC","TAB","CLK",chr(8657)]);
}

//left hand bottom row modifier keys
module mod_left_bottom() {
    translate_u(-1, -4) legend("`") legend("~", "top", "left", 3) keypf(4);
    translate_u(0, -4) legend("CTRL", size=4) keypf(4);
    translate_u(1, -4) keypf(4);
    translate_u(2, -4) legend("ALT", size=4) keypf(4);
    translate_u(3.125, -4) 1_25u()legend("fn", size=4) keypf(4);
}

//left hand center modifier keys
module mod_left_inside() {
    translate_u(5, 0) legend("-") legend("_", "top", "left", 3) keypf(5);
    translate_u(5, -1.125) 1_25uh() legend("[") legend("{", "top", "left", 3) keypf(1);
}

//left hand thumb cluster modifier keys
module mod_left_thumb() {
    translate_u(5, -3) legend("HOME", size=4) keypf(3);
    translate_u(6, -3) legend("END", size=4) keypf(3);
    translate_u(5, -4.25) 1_5uh() legend(chr(9003)) keypf(3);
    translate_u(6, -4.25)  1_5uh() legend(chr(8998)) keypf(3);
}

//render the entire left hand key set
module left() {
    alphanum_left();
    mod_left_outside();
    mod_left_bottom();
    mod_left_inside();
    mod_left_thumb();
}

//right hand alphanumeric keys
module alphanum_right() {
    keysdef = [
        [["6", "^"], ["Y"], ["H"], ["N"]],
        [["7", "&"], ["U"], ["J"], ["M"]],
        [["8", "*"], ["I"], ["K"], [",", "<"]],
        [["9", "("], ["O"], ["L"], [".", ">"]],
        [["0", ")"], ["P"], [";", ":"], ["/", "?"]]
    ];
    make_keys(keysdef);
}

//right hand 1.25u modifier keys
module mod_right_outside() {
    translate_u(5.125, 0) make_1_25_col([chr(9003),"\\",chr(8629),chr(8657)]);
}

//right hand bottom row modifier keys
module mod_right_bottom() {
    translate_u(5, -4) legend(chr(9654)) keypf(4);
    translate_u(4, -4) legend(chr(9660)) keypf(4);
    translate_u(3, -4) legend(chr(9650)) keypf(4);
    translate_u(2, -4) legend(chr(9664)) keypf(4);
    translate_u(0.875, -4) 1_25u() legend("fn", size=4) keypf(4);
}

//right hand center modifier keys
module mod_right_inside() {
    translate_u(-1, 0) legend("=") legend("+", "top", "left", 3) keypf(1);
    translate_u(-1, -1.125) 1_25uh() legend("]") legend("}", "top", "left", 3) keypf(2);
}

//right hand thum cluster modifier keys
module mod_right_thumb() {
    translate_u(-1, -3) legend("PGDN", size=4) keypf(3);
    translate_u(-2, -3) legend("PGUP", size=4) keypf(3);
    translate_u(-1, -4.25) 1_5uh() keypf(3);
    translate_u(-2, -4.25) 1_5uh() legend(chr(8629)) keypf(3);
}

//render entire right hand key set
module right() {
    alphanum_right();
    mod_right_outside();
    mod_right_bottom();
    mod_right_thumb();
    mod_right_inside();
}


//show entire set
//left();
//translate_u(10) right();

//individual sections for printing (keep stl output clusters close together for better slicing)
//left();
//alphanum_left();
//mod_left_outside();
//mod_left_bottom();
//mod_left_inside();
//mod_left_thumb();
//right();
//alphanum_right();
//mod_right_outside();
//mod_right_bottom();
//mod_right_thumb();
//mod_right_inside();
