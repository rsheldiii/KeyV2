module squared_scoop_dish(height, width, depth, r=0.5, inverted=false, num=3, den=4){
  // changable numerator/denoninator on where to place the square's corners
  // for example, num=2, den=3 means the dish will happen at 1/3 and 2/3 the
  // width and the height.  Defaults to 3/4s. Customizable when calling 
  // this module
  //
  // This was initially intended for the scoop on the HiPro, since that's what
  // it uses.  Use "hipro2_row()" if that's what you'd like.  However, I do NOT
  // know how close the inner square is for the HiPro keycaps.  In fact, it could
  // just be a sphere, in which the "squared spherical" scoop is more appropriate.
  // If, however, it the "squared scoop" makes sense, you can adjust where the square
  // lands with the num (numerator) and den (denominator) variables.  For instance,
  // "3" and "4" mean 3/4 of the width/height is where the flat part starts.

  chord = pow(pow(height/2, 2) + pow(width/2, 2),0.5);
  direction = inverted ? -1 : 1;

  //This is the set of points to hull around for the scoop
  points=[
    [height/den,width/den, -chord],
    [num*height/den,width/den,-chord],
    [height/den,num*width/den, -chord],
    [num*height/den,num*width/den,-chord]
  ];

  translate([-(width + r) / 2, -(height + r) / 2, 0 * direction])
    resize([height+r,width+r,depth])
      hull() {
        cube([height,width,0.001],center=false);
        for(i=[0:len(points)-1]) {
          translate(points[i])
            sphere(r=r,$fn=64);
        }
    }
}

/* ************************** *
 * ORIGINAL ATTEMPT           *
 * DO NOT USE                 *
 * KEPT FOR NOW IF I'M        *
 * MISSING SOMETHING          *
 * ************************** */

// module squared_scoop_dish(height, width, depth, r=0.5, inverted=false, num=3, den=4){
//   // changable numerator/denoninator on where to place the square's corners
//   // for example, num=2, den=3 means the dish will happen at 1/3 and 2/3 the
//   // width and the height.  Defaults to 3/4s. Customizable when calling 
//   // this module

//   chord = pow(pow(height/2, 2) + pow(width/2, 2),0.5);
//   direction = inverted ? -1 : 1;

//   //This is the set of points to hull around for the scoop
//   points=[
//     [height/den,width/den, -chord],
//     [num*height/den,width/den,-chord],
//     [height/den,num*width/den, -chord],
//     [num*height/den,num*width/den,-chord],
//     [height/2, width/2, -chord - 1]
//   ];

//   translate([-width / 2, -height / 2, 0 * direction])
//     resize([height,width,depth])
//       hull() {
//         cube([height,width,0.001],center=false);
//         for(i=[0:len(points)-1]) {
//           translate(points[i])
//             sphere(r=r,$fn=64);
//         }
//     }
// }
