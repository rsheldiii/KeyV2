scad-utils
==========

Utility libraries for OpenSCAD

Morphology
----------

contains basic 2D morphology operations

    inset(d=1)             - creates a polygon at an offset d inside a 2D shape
    outset(d=1)            - creates a polygon at an offset d outside a 2D shape
    fillet(r=1)            - adds fillets of radius r to all concave corners of a 2D shape
    rounding(r=1)          - adds rounding to all convex corners of a 2D shape
    shell(d,center=false)  - makes a shell of width d along the edge of a 2D shape
                           - positive values of d places the shell on the outside
                           - negative values of d places the shell on the inside
                           - center=true and positive d places the shell centered on the edge


### Examples

With a basic sample polygon shape,

    module shape() {
        polygon([[0,0],[1,0],[1.5,1],[2.5,1],[2,-1],[0,-1]]);
    }

and `$fn=32;`.


* `inset(d=0.3) shape();`

![](http://oskarlinde.github.io/scad-utils/img/morph-0.png)


* `outset(d=0.3) shape();`

![](http://oskarlinde.github.io/scad-utils/img/morph-1.png)


* `rounding(r=0.3) shape();`

![](http://oskarlinde.github.io/scad-utils/img/morph-2.png)


* `fillet(r=0.3) shape();`

![](http://oskarlinde.github.io/scad-utils/img/morph-3.png)


*`shell(d=0.3) shape();`

![](http://oskarlinde.github.io/scad-utils/img/morph-4.png)


*`shell(d=-0.3) shape();`

![](http://oskarlinde.github.io/scad-utils/img/morph-5.png)


*`shell(d=0.3,center=true) shape();`

![](http://oskarlinde.github.io/scad-utils/img/morph-6.png)


Mirror
------

contains simple mirroring functions

    mirror_x()
    mirror_y()
    mirror_z()

example:

    module arrow(l=1,w=.6,t=0.15) {
        mirror_y() polygon([[0,0],[l,0],[l-w/2,w/2],[l-w/2-sqrt(2)*t,w/2],[l-t/2-sqrt(2)*t,t/2],[0,t/2]]);
    }
