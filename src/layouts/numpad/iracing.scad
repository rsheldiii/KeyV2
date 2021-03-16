numpad_iracing_top_layout = [
  [1,1,1,1],
];

numpad_iracing_layout = [
  [1,1,1,1],
  [1,1,1,1],
  [1,1,1,1],
  [1,1,1,1],
  [1,1,1,1],
  [1,1,1,1]
];

module numpad_iracing() {
    $font_size=4;
    $font="Noto Sans:style=bold";

    module three_letters(text) {
        legend(text,size=3)
        children();
    }

    module plus(top, front) {
        intersection() {
            legend(top,[0,0.7],size=3.4) front(front) children();
            plus_symbol() children();
        }
    }
    module plus_symbol() {
        $font="Noto Sans Symbols2";
        legend("\u2B9D",[0,-0.7],size=5)
        children();
    }

    module minus(top,front) {
        intersection() {
            legend(top,[0,-0.7],size=3.4) front(front) children();
            minus_symbol() children();
        }
    }
    module minus_symbol() {
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

    // estimated gap for top row of kbdpad
    translate_u(0,1.25)
    layout_children(numpad_iracing_top_layout) {
        plus("CAM", "SUB") dcs_row(0) key();
        plus("CAR", "DRV") dcs_row(0) key();
        plus("LAP", "FOV") dcs_row(0) key();
        plus("INC", "STEP") dcs_row(0) key();
    }

    layout_children(numpad_iracing_layout) {
        minus("CAM", "SUB") dcs_row(0) key();
        minus("CAR", "DRV") dcs_row(0) key();
        minus("LAP", "FOV") dcs_row(0) key();
        minus("INC", "STEP") dcs_row(0) key();

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
