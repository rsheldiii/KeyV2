// Copyright (c) 2013 Oskar Linde. All rights reserved.
// License: BSD
//
// This library contains basic 2D morphology operations
//
// outset(d=1)            - creates a polygon at an offset d outside a 2D shape
// inset(d=1)             - creates a polygon at an offset d inside a 2D shape
// fillet(r=1)            - adds fillets of radius r to all concave corners of a 2D shape
// rounding(r=1)          - adds rounding to all convex corners of a 2D shape
// shell(d,center=false)  - makes a shell of width d along the edge of a 2D shape
//                        - positive values of d places the shell on the outside
//                        - negative values of d places the shell on the inside
//                        - center=true and positive d places the shell centered on the edge

module outset(d=1) {
  // Bug workaround for older OpenSCAD versions
  if (version_num() < 20130424) render() outset_extruded(d) child();
  else minkowski() {
    circle(r=d);
    child();
  }
}

module outset_extruded(d=1) {
   projection(cut=true) minkowski() {
        cylinder(r=d);
        linear_extrude(center=true) child();
   }
}

module inset(d=1) {
   render() inverse() outset(d=d) inverse() child();
}

module fillet(r=1) {
  inset(d=r) render() outset(d=r) child();
}

module rounding(r=1) {
  outset(d=r) inset(d=r) child();
}

module shell(d,center=false) {
  if (center && d > 0) {
    difference() {
      outset(d=d/2) child();
      inset(d=d/2) child();
    }
  }
  if (!center && d > 0) {
    difference() {
      outset(d=d) child();
      child();
    }
  }
  if (!center && d < 0) {
    difference() {
      child();
      inset(d=-d) child();
    }
  }
  if (d == 0) child();
}


// Below are for internal use only

module inverse() {
  difference() {
    square(1e5,center=true);
    child();
  }
}


// TEST CODE

use <mirror.scad>

module arrow(l=1,w=.6,t=0.15) {
  mirror_y() polygon([[0,0],[l,0],[l-w/2,w/2],[l-w/2-sqrt(2)*t,w/2],[l-t/2-sqrt(2)*t,t/2],[0,t/2]]);
}

module shape() {
  polygon([[0,0],[1,0],[1.5,1],[2.5,1],[2,-1],[0,-1]]);
}

if(0) assign($fn=32) {

  for (p = [0:10*3-1]) assign(o=floor(p/3)) {
    translate([(p%3)*2.5,-o*3]) {
      //%if (p % 3 == 1) translate([0,0,1]) shape();
      if (p % 3 == 0) shape();
      if (p % 3 == 1) translate([0.6,0]) arrow();
      if (p % 3 == 2) {
        if (o == 0) inset(d=0.3) shape();
        if (o == 1) outset(d=0.3) shape();
        if (o == 2) rounding(r=0.3) shape();
        if (o == 3) fillet(r=0.3) shape();
        if (o == 4) shell(d=0.3) shape();
        if (o == 5) shell(d=-0.3) shape();
        if (o == 6) shell(d=0.3,center=true) shape();
        if (o == 7) rounding(r=0.3) fillet(r=0.3) shape();
        if (o == 8) shell(d=0.3,center=true) fillet(r=0.3) rounding(r=0.3) shape();
        if (o == 9) shell(d=-0.3) fillet(r=0.3) rounding(r=0.3) shape();
      }
    }
  }
}
