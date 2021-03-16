// the point of this file is to be a sort of DSL for constructing keycaps.
// when you create a method chain you are just changing the parameters
// key.scad uses, it doesn't generate anything itself until the end. This
// lets it remain easy to use key.scad like before (except without key profiles)
// without having to rely on this file. Unfortunately that means setting tons of
// special variables, but that's a limitation of SCAD we have to work around

include <./includes.scad>

module item(text) {
    legend(text, [0,0], size=4)
    children();
}

module next() {
    legend("next", [0,-0.5], size=3)
    children();
}

module prev() {
    legend("-", [0,0.5], size=8)
    children();
}


// example key
//dcs_row(5) item("LAP") key();

        
//numpad_iracing("dcs")key();

// example row
/* for (x = [0:1:4]) {
  translate_u(0,-x) dcs_row(x) key();
} */

// example layout
/* preonic_default("dcs"); */


numpad_default_layout = [
  [1,1,1,1],
  [1,1,1,1],
  [1,1,1,1],
  [1,1,1,1],
  [1,1,1,1],
  [1,1,1,1]
];

numpad_top_row_layout =[
  [1,1,1,1],
];

numpad_top_row_legends = [
  ["CAM", "CAR", "LAP", "INC", ],
];

$font_size=4;

numpad_default_legends = [
  ["CAM", "CAR", "LAP", "INC",],
  ["\u23EA", "\u25B6", "\u23E9", "SLO",],
  ["FRM", "\u2191", "FRM", "ME"],
  ["\u2190", "\u2193", "\u2192", "TOOL"],
  ["CTL", "ALT", "SCR", "UI",],
];

// for media controls
//$font="Noto Sans Symbols2";
//$font="DejaVu Sans";

numpad_default_front_legends = [
  ["SUB", "DRV", "FOV", "STEP", ],
];

$font="Noto Sans:style=bold";

module three_letters(text) {
    legend(text,size=3)
    children();
}

module plus_text(text) {
    legend(text,[0,0.7],size=3.4)
    children();
}
module plus() {
    $font="Noto Sans Symbols2";
    legend("\u2B9D",[0,-0.7],size=5)
    children();
}

module minus_text(text) {
    legend(text,[0,-0.7],size=3.4)
    children();
}
module minus() {
    $font="Noto Sans Symbols2";
    legend("\u2B9F",[0,0.7],size=5)
    children();
}

module unicode(text) {
    $font="Noto Sans Symbols2";
    legend(text,size=8)
    children();
}

module front(text) {
    front_legend(text,[0,-0.5],size=3)
    children();
}

module frame() {
    legend("FRAME", size=2)
    children();
}

// RENDER stl
module foo() {
    echo(0);
}


layout_children(numpad_default_layout) {
  //["SUB", "DRV", "FOV", "STEP", ],
    intersection() {
        front("SUB")plus_text("CAM") dcs_row(0) key();
        plus()dcs_row(0) key();
    }
    intersection() {
        front("DRV")plus_text("CAR") dcs_row(0) key();
        plus()dcs_row(0) key();
    }
    intersection() {
        front("FOV")plus_text("LAP") dcs_row(0) key();
        plus()dcs_row(0) key();
    }
    intersection() {
        front("STEP")plus_text("INC") dcs_row(0) key();
        plus()dcs_row(0) key();
    }

    intersection() {
        front("SUB")minus_text("CAM") dcs_row(0) key();
        minus()dcs_row(0) key();
    }
    intersection() {
        front("DRV")minus_text("CAR") dcs_row(0) key();
        minus()dcs_row(0) key();
    }
    intersection() {
        front("FOV")minus_text("LAP") dcs_row(0) key();
        minus()dcs_row(0) key();
    }
    intersection() {
        front("STEP")minus_text("INC") dcs_row(0) key();
        minus()dcs_row(0) key();
    }



  //["\u23EA", "\u25B6", "\u23E9", "SLO",],

    unicode("\u23EA") dcs_row(1) key();
    unicode("\u25B6") bump() dcs_row(1) key();
    unicode("\u23E9") dcs_row(1) key();
    legend("SLOW", [0,-0.5], size=2.5) legend("MO", [0,0.5], size=2.5) dcs_row(1) key();

    
    unicode("\u23EE") dcs_row(2) key();
    // UTF-32BE dec from unicode-table.com
    unicode(chr(129153)) dcs_row(2) key(); // https://unicode-table.com/en/1F881/
    unicode("\u23ED") dcs_row(2) key();
    legend("ME",size=5) dcs_row(2) key();

    unicode(chr(129152)) dcs_row(3) key(); // https://unicode-table.com/en/1F880/
    unicode(chr(129155)) dcs_row(3) key(); // https://unicode-table.com/en/1F883/
    unicode(chr(129154)) dcs_row(3) key(); // https://unicode-table.com/en/1F882/
    legend("CAM", [0,-0.5], size=3) legend("TOOL", [0,0.5], size=2.5) dcs_row(3) key();

    front_legend("CTRL") dcs_row(4) key();
    front_legend("ALT") dcs_row(4) key();
    legend("PRINT", [0,-0.5], size=2.5) legend("SCREEN", [0,0.5], size=2) dcs_row(4) key();
    front_legend("MOD")
    legend("UI",size=6) dcs_row(4) key();

  //["CTL", "ALT", "SCR", "UI",],


};
