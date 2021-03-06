// the point of this file is to be a sort of DSL for constructing keycaps.
// when you create a method chain you are just changing the parameters
// key.scad uses, it doesn't generate anything itself until the end. This
// lets it remain easy to use key.scad like before (except without key profiles)
// without having to rely on this file. Unfortunately that means setting tons of
// special variables, but that's a limitation of SCAD we have to work around

include <./includes.scad>

// set viewport
$vpt = [ -51.76, -91.61, -87.33 ];
$vpr = [ 55.00, 0.00, 25.00 ];
$vpd = 839.47;

// try a bunch of CAPS_LOCK keys at 4x size

// single stem, centred
    u(u=1.75)
    dcs_row(2) 
    box_cherry(0.3)
    legend("CAPS", size=2.5, position=[-0.75,-0.5])
    legend("LOCK", size=2.5, position=[-0.75,0.5])
    scale(4)
key(); 

// single stem, offset, no stabilizer
    u(u=1.75)
    dcs_row(2) 
    box_cherry(0.3)
    legend("CAPS", size=2.5, position=[-0.75,-0.5])
    legend("LOCK", size=2.5, position=[-0.75,0.5])
    scale(4)
	translate_u(0,-1)
key($stem_positions = [[-5, 0]]); 

// single stem, offset, with one stabilizer
    u(u=1.75)
    dcs_row(2) 
    box_cherry(0.3)
    legend("CAPS", size=2.5, position=[-0.75,-0.5])
    legend("LOCK", size=2.5, position=[-0.75,0.5])
    scale(4)
	translate_u(0,-2)
key($stabilizers = [[6,0]],$stem_positions = [[-5, 0]]); 

// CAPS width, with two stabilizers
    u(u=1.75)
    dcs_row(2) 
    box_cherry(0.3)
    legend("CAPS", size=2.5, position=[-0.8,-0.5])
    legend("LOCK", size=2.5, position=[-0.8,0.5])
    stabilized(mm=12, vertical = false, type="cherry_stabilizer")
    scale(4)
    translate_u(0,-3)
key(); 

// 1.5 width, with two stabilizers
    1_5u()
    dcs_row(2) 
    box_cherry(0.3)
    legend("CAPS", size=2.5, position=[-0.70,-0.5])
    legend("LOCK", size=2.5, position=[-0.70,0.5])
    stabilized(mm=12, vertical = false, type="cherry_stabilizer")
    scale(4)
    translate_u(0,-4)
key(); 

// double width, with two stabilizers
    u(u=2)
    dcs_row(2) 
    box_cherry(0.3)
    legend("CAPS", size=2.5, position=[-0.85,-0.5])
    legend("LOCK", size=2.5, position=[-0.85,0.5])
    stabilized(mm=12, vertical = false, type="cherry_stabilizer")
    scale(4)
    translate_u(0,-5)
key(); 

// test all the stems
/*
test_stems = ["cherry", "rounded_cherry", "box_cherry", "alps",  "cherry_stabilizer", "filled", "custom"];
for (x = [0:1:4]) {
	$stem_type = test_stems[x];
    2u()
    dcs_row(5) 
    stabilized(mm=12, vertical = false, type=test_stems[x])
    legend("CAPS LOCK", size=3, position=[-0.16,1])
    scale(4)
    translate_u(0,-x)
  key();
}
*/

// example layout
/* preonic_default("dcs"); */
