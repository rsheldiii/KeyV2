include <../layout.scad>

numpad_default_top_layout = [
  [1,1,1,1],
];

numpad_default_layout = [
  [1,1,1,1],
  [1,1,1],
  [1,1,1,1],
  [1,1,1],
  [2,1,1]
];

module numpad_default() {
    char_size=8;
    unicode_font="Noto Sans Symbols2";
    front_offset=-0.2;
    $font="Noto Sans:style=bold";

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

    module front_char(text, pos=[0,front_offset], size=5) {
        front_legend(text, pos, size)
        children();
    }

	colors=true;
	module ifcolor(c) {
		if(colors) {
			color(c)
			children();	
		} else {
			children();	
		}
	}
	module num() {
		ifcolor("purple")
		children();
	}

	module sym() {
		ifcolor("gray")
		children();
	}
	module ctl() {
		ifcolor("sienna")
		children();
	}	
	module arw() {
		ifcolor("red")
		children();
	}

    // kbdpad has an extra top row
    translate_u(0,1.5)
    layout_children(numpad_default_top_layout) {
        legend("ESC", size=4) profile(0) ctl() key();
        front_char("%") legend("TAB", size=4) profile(0) ctl() key();
        front_char(")") legend("DEL", size=4) profile(0) ctl() key();
	intersection() {
		front_char(")") profile(0) ctl() key();
		unicode(chr(129044),[0,0.2]) profile(0) ctl() key();
	}
    };

    layout_children(numpad_default_layout) {

        front("MOD") legend("NUM", [0,-0.5], size=2.5) legend("LOCK", [0,0.5], size=2.5) profile(0) ctl() key();
        //unicode("⇭") profile(0) key();
        front_char("$") char("/") profile(0) sym() key();
        front_char("=") char("*", [0,0.3]) profile(0) sym() key();
        front_char(",") char("-", [0,0.3]) profile(0) sym() key();

        front("HOME")char("7") profile(1) num() key();
        arrow("8", chr(129153)) profile(1) arw() key();
        front("PG UP")char("9") profile(1) num() key();

        arrow("4", chr(129152)) profile(2) arw() key();
        arrow("5", chr(129155),[0,0]) bump() profile(2) arw() key();
        arrow("6", chr(129154)) profile(2) arw() key();
        translate_u(0,0.5) char("+") profile(1) 2uh() sym() key();

        front("END")char("1") profile(3) num() key();
        arrow("2", chr(129155),[0,0]) profile(3) num() key();
        front("PG DN")char("3") profile(3) num() key();

        front("INS",[-1.07,front_offset])char("0") profile(4) 2u() num() key();
        front("DEL")char(".") profile(4) sym() key();
        translate_u(0,0.5) unicode(chr(9166)) profile(2) 2uh() sym() key();

    }
}
