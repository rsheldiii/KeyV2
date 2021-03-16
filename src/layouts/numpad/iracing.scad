// the point of this file is to be a sort of DSL for constructing keycaps.
// when you create a method chain you are just changing the parameters
// key.scad uses, it doesn't generate anything itself until the end. This
// lets it remain easy to use key.scad like before (except without key profiles)
// without having to rely on this file. Unfortunately that means setting tons of
// special variables, but that's a limitation of SCAD we have to work around

include <./includes.scad>

numpad_default_layout = [
  [1,1,1,1],
  [1,1,1,1],
  [1,1,1,1],
  [1,1,1,1],
  [1,1,1,1],
  [1,1,1,1]
];

$font_size=4;
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

// RENDER stl
module foo() {
    // This will silence my auto rendering script
    echo(0);
}

module numpad_iracing() {
    layout_children(numpad_default_layout) {
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

        unicode("\u23EA") dcs_row(1) key();
        unicode("\u25B6") bump() dcs_row(1) key();
        unicode("\u23E9") dcs_row(1) key();
        legend("SLOW", [0,-0.5], size=2.5) legend("MO", [0,0.5], size=2.5) dcs_row(1) key();

        
        unicode("\u23EE") dcs_row(2) key();
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

    };
};
