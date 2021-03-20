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

    module unicode(text,size=8) {
        $font="Noto Sans Symbols2";
        legend(text,size=size)
        children();
    }

    module front(text) {
        front_legend(text,[0,-0.5],size=3)
        children();
    }

	cam_color="sienna";
	car_color="gray";
	lap_color="sienna";
	inc_color="gray";

    // estimated gap for top row of kbdpad
    translate_u(0,1.25)
    layout_children(numpad_iracing_top_layout) {
        plus("CAM", "SUB") dcs_row(0) if_color(cam_color) key();
        plus("CAR", "DRV") dcs_row(0) if_color(car_color) key();
        plus("LAP", "SES") dcs_row(0) if_color(lap_color) key();
        plus("INC", "START") dcs_row(0) if_color(inc_color)key();
    }

	colors=false;

	module if_color(c) {
		if(colors){
			color(c)
			children();
		} else {
			children();
		}
		
	}

	module frame() {
		if_color("gold") children();
	}

 	module direction() {
		if_color("darkorange") children();
	}

	module red() {
		if_color("red") children();
	}

	module silver() {
		if_color("gray") children();
	}

	module brown() {
		if_color("sienna") children();
	}

	module mods() {
		if_color("gray") children();
	}

	module purple() {
		if_color("purple") children();
		//$primary_color="purple";
		//$secondary_color="purple";
		//children();
	}



    layout_children(numpad_iracing_layout) {
        minus("CAM", "SUB") dcs_row(0) if_color(cam_color) key();
        minus("CAR", "DRV") dcs_row(0) if_color(car_color)key();
        minus("LAP", "SES") dcs_row(0) if_color(lap_color) key();
        minus("INC", "END") dcs_row(0) if_color(inc_color) key();

        unicode("\u23EA") dcs_row(1) direction() key();
        unicode("\u25B6") bump() dcs_row(1) red() key();
        unicode("\u23E9") dcs_row(1) direction() key();
        unicode(chr(9201),6) dcs_row(1) purple() key(); 

        
        unicode("\u23EE") dcs_row(2) frame() key();
        unicode(chr(129153)) dcs_row(2) purple() key(); // https://unicode-table.com/en/1F881/
        unicode("\u23ED") dcs_row(2) frame() key();
        unicode(chr(9210)) dcs_row(2) frame() key();
        //legend("PRINT", [0,-0.6], size=2.5) legend("SCREEN", [0,0.6], size=2) dcs_row(2) brown() key();

        unicode(chr(129152)) dcs_row(3) purple() key(); // https://unicode-table.com/en/1F880/
        unicode(chr(129155)) dcs_row(3) purple() key(); // https://unicode-table.com/en/1F883/
        unicode(chr(129154)) dcs_row(3) purple() key(); // https://unicode-table.com/en/1F882/
        unicode(chr(128253)) dcs_row(3) purple() key(); // https://unicode-table.com/en/1F882/
        //legend("CAM", [0,-0.6], size=3.5) legend("TOOL", [0,0.7], size=2.9) dcs_row(3) purple() key(); // https://unicode-table.com/en/1F881/

        front_legend("CTRL") dcs_row(4) mods() key();
        front_legend("ALT") dcs_row(4) mods() key();
        //unicode(chr(11017)) unicode(chr(11018)) dcs_row(4) purple() key(); // https://unicode-table.com/en/1F881/
        fullscreen_size=11;
        intersection() {
            unicode("\u2B66",fullscreen_size)
            unicode("\u2B68",fullscreen_size)
            unicode("\u2B67",fullscreen_size)
            unicode("\u2B69",fullscreen_size)
            dcs_row(4) purple() key(); 
            front_legend("AIM") dcs_row(4) purple() key(); 
        }
        front_legend("MOD") legend("UI",size=6) dcs_row(4) mods() key();

    };
};
