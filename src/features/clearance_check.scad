// a fake cherry keyswitch, abstracted out to maybe replace with a better one later
module cherry_keyswitch() {
  union() {
    hull() {
      cube([15.6, 15.6, 0.01], center=true);
      translate([0,1,5 - 0.01]) cube([10.5,9.5, 0.01], center=true);
    }
    hull() {
      cube([15.6, 15.6, 0.01], center=true);
      translate([0,0,-5.5]) cube([13.5,13.5,0.01], center=true);
    }
  }
}

//approximate (fully depressed) cherry key to check clearances
module clearance_check() {
  if($stem_type == "cherry" || $stem_type == "cherry_rounded"){
    color($warning_color){
      translate([0,0,3.6 + $stem_inset - 5]) {
        cherry_keyswitch();
      }
    }
  }
}
