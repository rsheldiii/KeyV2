include <../layout.scad>

// incomplete

// how to make tall enter key?
// how to auto scale text?


numpad_default_layout = [
  [1,1,1,1],
  [1,1,1,1],
  [1,1,1,1],
  [1,1,1,-1],
  [2,1,-1]
];

numpad_top_row_layout =[
  [1,1,1,1],
];

numpad_top_row_legends = [
  ["", "", "", "",],
];

numpad_default_legends = [
  ["num", "/", "*", "bksp", ],
  ["7", "8", "9", "-",],
  ["4", "5", "6", "+",],
  ["1", "2", "3", ],
  ["0", ".",],
];

numpad_default_front_legends = [
  ["", "", "", "", ],
  ["home", "\u2191", "pg up", "",],
  ["\u2190", "", "\u2192", "",],
  ["end", "\u2193", "pg down"],
  ["ins", "del",],
];



module numpad_default(profile) {

  layout(numpad_default_layout, profile, numpad_default_legends, numpad_default_front_legends) children();

  translate_u(0,1.25) // this is not accurate
  layout(numpad_top_row_layout, profile, numpad_top_row_legends) children();

  translate_u(3,-3.5)
  layout([[1,],], profile, [["\u2386",]], row_override=3) numpad_enter() children();
}
