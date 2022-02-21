include <../layout.scad>

rt_arrow="\u2192";
lt_arrow="\u2190";
up_arrow="\u2191";
dn_arrow="\u2193";
menu="\u2261";
enter=lt_arrow; //"\u2386" with supported Unicode Font
backspace="BkSp"; //"\u232B" with supported Unicode Font

// Keys are defined independently: [legend, horizontalSize, verticalSize, fontChg]
full_size_dual = [[["Esc",1,1,-2], ["",-1,1,0], ["F1",1,1,-2], ["F2",1,1,-2], ["F3",1,1,-2], ["F4",1,1,-2], ["",-.5,1,0], ["F5",1,1,-2], ["F6",1,1,-2], ["F7",1,1,-2], ["F8",1,1,-2], ["",-.5,1,0], ["F9",1,1,-2], ["F10",1,1,-2], ["F11",1,1,-2], ["F12",1,1,-2],                         ["",-0.5,1,0], [["Print","Screen"],1,1,-3], [["Scroll", "Lock"],1,1,-3], [["Pause","Break"],1,1,-3]],
                 [[["~","`"],1,1,0], [["!","1"],1,1,0], [["@","2"],1,1,0], [["#","3"],1,1,0], [["$","4"],1,1,0], [["%","5"],1,1,0], [["^","6"],1,1,0], [["&","7"],1,1,0], [["*","8"],1,1,0], [["(","9"],1,1,0], [[")","0"],1,1,0], [["_","-"],1,1,0], [["+","="],1,1,0], [backspace,2,1,-2], ["",-0.5,1,0], ["Ins",1,1,-2], ["Home",1,1,-2], [["Pg","Up"],1,1,-1],                                 ["",-0.5,1,0], [["Num","Lock"],1,1,-2], ["/",1,1,0], ["*",1,1,0], ["-",1,1,0]],
                 [["Tab",1.5,1,-2], ["Q",1,1,0], ["W",1,1,0], ["E",1,1,0], ["R",1,1,0], ["T",1,1,-2], ["Y",1,1,0], ["U",1,1,0], ["I",1,1,0], ["O",1,1,0], ["P",1,1,0], [["{","["],1,1,0], [["}","]"],1,1,0], [["|","\\"],1.5,1,0],                                                        ["",-0.5,1,0], ["Del",1,1,-2], ["End",1,1,-2], [["Pg","Dn"],1,1,-1],                                  ["",-0.5,1,0], ["7",1,1,0], ["8",1,1,0], ["9",1,1,0], ["+",1,2,0]],
                 [["Caps",1.75,1,-2], ["A",1,1,0], ["S",1,1,0], ["D",1,1,0], ["F",1,1,-2], ["G",1,1,0], ["H",1,1,0], ["J",1,1,0], ["K",1,1,0], ["L",1,1,0], [[":",";"],1,1,0], [["\"","'"],1,1,0], ["Enter",2.25,1,-2],                                                                                                                                                                         ["",-4,1,0], ["4",1,1,0], ["5",1,1,0], ["6",1,1,0]],
                 [["Shift",2.25,1,-2], ["Z",1,1,0], ["X",1,1,0], ["C",1,1,-2], ["V",1,1,0], ["B",1,1,0], ["N",1,1,0], ["M",1,1,0], [["<",","],1,1,0], [[">","."],1,1,0], [["?","/"],1,1,0], ["Shift",2.75,1,-2],                                                                          ["",-1.5,1,0],                   [up_arrow,1,1,0],                                                    ["",-1.5,1,0], ["1",1,1,0], ["2",1,1,0], ["3",1,1,0], [enter,1,2,0]],
                 [["Ctrl",1.25,1,-2], ["Win",1.25,1,-2], ["Alt",1.25,1,-2], ["",6.25,1,0], ["Alt",1.25,1,-2], ["FN",1.25,1,-2], [menu,1.25,1,0], ["Ctrl",1.25,1,-2],                                                                                                                      ["",-0.5,1,0], [lt_arrow,1,1,0], [dn_arrow,1,1,0], [rt_arrow,1,1,0],                                  ["",-0.5,1,0], ["0",2,1,0], [".",1,1,0]]];

// Derive/seperate out tables
full_size_dual_legends = [ for (row = full_size_dual) [ for (col = row) col[0]]];
full_size_dual_default_layout = [ for (row = full_size_dual) [ for (col = row) col[1]]];
full_size_dual_vertical_size = [ for (row = full_size_dual) [ for (col = row) col[2]]];
full_size_dual_legend_size = [ for (row = full_size_dual) [ for (col = row) col[3]]];

module full_size_dual_default(profile="dcs") {
  simple_layout(full_size_dual_default_layout) {
    dual_legend = full_size_dual_legends[$row][$column];
    legend_size = $font_size+full_size_dual_legend_size[$row][$column];
    vertical_size = full_size_dual_vertical_size[$row][$column];

    legend(dual_legend, size=legend_size) {
      key_profile(profile, $row, $column) {
        if(vertical_size > 1){
          v_offset = -(vertical_size - 1) / 2;
          translate_u(0, v_offset){
            uh(vertical_size) {
              stabilized(vertical=true) children();
            }
          }
        } else {
          children();
        }
      }
    }
  }
}