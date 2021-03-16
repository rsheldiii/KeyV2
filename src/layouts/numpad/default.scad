include <../layout.scad>

numpad_default_top_layout = [
  [1,1,1,1],
];

numpad_default_layout = [
  [1,1,1,1],
  [1,1,1,1],
  [1,1,1,1],
  [1,1,1],
  [2,1,1]
];

module numpad_default() {
    char_size=8;
    unicode_font="Noto Sans Symbols2";
    front_offset=-0.2;

    module profile(row) {
        dcs_row(row)
        children();
    }

    module char(text, pos=[0,0], size=char_size) {
        legend(text,pos,size)
        children();
    }

    module unicode(text, pos=[0,0], size=char_size) {
        $font=unicode_font;
        legend(text,pos,size)
        children();
    }

    module front_unicode(text,pos=[0,front_offset],size=5) {
        $font=unicode_font;
        front_legend(text,pos,size)
        children();
    }

    module arrow(top, front, front_pos=[0,front_offset]) {
        intersection() {
            char(top)children();
            front_unicode(front, front_pos)children();
        }
    }

    module front(text, pos=[0,front_offset], size=3) {
        front_legend(text, pos, size)
        children();
    }

    // estimated gap for kbdpad
    translate_u(0,1.5)
    layout_children(numpad_default_top_layout) {
        profile(0) key();
        profile(0) key();
        profile(0) key();
        profile(0) key();
    };

    layout_children(numpad_default_layout) {

        legend("NUM", [0,-0.5], size=2.5) legend("LOCK", [0,0.5], size=2.5) profile(0) key();
        char("/") profile(0) key();
        char("*", [0,0.3]) profile(0) key();
        unicode(chr(129044),[0,0.2]) profile(0) key();

        front("HOME")char("7") profile(1) key();
        arrow("8", chr(129153)) profile(1) key();
        front("PG UP")char("9") profile(1) key();
        char("-", [0,0.3]) profile(1) key();

        arrow("4", chr(129152)) profile(2) key();
        char("5") profile(2) bump() key();
        arrow("6", chr(129154)) profile(2) key();
        char("+", [0,0.3]) profile(2) key();

        front("END")char("1") profile(3) key();
        arrow("2", chr(129155),[0,0]) profile(3) key();
        front("PG DN")char("3") profile(3) key();

        front("INS",[-1.07,front_offset])char("0") profile(4) 2u() key();
        front("DEL")char(".") profile(4) key();
        translate_u(0,0.5) unicode(chr(9166)) profile(2) 2uh() key();

    }
}
