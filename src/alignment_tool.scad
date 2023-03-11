include <./includes.scad>

// Tool for keeping switches aligned while soldering
// Keep the bar high enough that when the keyboard is upside down the switches can be fully depressed

module alignment_tool(layout=[[1,1,1,1,1]], bar_height=$stem_throw*1.2) {
    bar_width=unit/2;
    simple_layout(layout) 
    stem($stem_type, $stem_throw, $stem_slop, $stem_throw);
    hull() {
        simple_layout(layout) 
        translate([-unit/2,-bar_width/2,$stem_throw])
        cube([unit,bar_width,bar_height]);
    }
}
