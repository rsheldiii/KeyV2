// Library: round-anything
// Version: 1.0
// Author: IrevDev
// Contributors: TLC123
// Copyright: 2020
// License: MIT


function addZcoord(points,displacement)=[for(i=[0:len(points)-1])[points[i].x,points[i].y, displacement]];
function translate3Dcoords(points,tran=[0,0,0],mult=[1,1,1])=[for(i=[0:len(points)-1])[
  (points[i].x*mult.x)+tran.x,
  (points[i].y*mult.y)+tran.y,
  (points[i].z*mult.z)+tran.z
]];
function offsetPolygonPoints(points, offset=0)=
// Work sthe same as the offset does, except for the fact that instead of a 2d shape
// It works directly on polygon points
// It returns the same number of points just offset into or, away from the original shape.
// points= a series of x,y points[[x1,y1],[x2,y2],...]
// offset= amount to offset by, negative numbers go inwards into the shape, positive numbers go out
// return= a series of x,y points[[x1,y1],[x2,y2],...]
let(
  isCWorCCW=sign(offset)*CWorCCW(points)*-1,
  lp=len(points)
)
[for(i=[0:lp-1]) parallelFollow([
  points[listWrap(i-1,lp)],
  points[i],
  points[listWrap(i+1,lp)],
],thick=offset,mode=isCWorCCW)];

function makeCurvedPartOfPolyHedron(radiiPoints,r,fn,minR=0.01)=
// this is a private function that I'm not expecting library users to use directly
// radiiPoints= serise of x, y, r points
// r= radius of curve that will be put on the end of the extrusion
// fn= amount of subdivisions
// minR= if one of the points in radiiPoints is less than r, it's likely to converge and form a sharp edge,
//     the min radius on these converged edges can be controled with minR, though because of legacy reasons it can't be 0, but can be a very small number.
// return= array of [polyhedronPoints, Polyhedronfaces, theLength of a singe layer in the curve]
let(
  lp=len(radiiPoints),
  radii=[for(i=[0:lp-1])radiiPoints[i].z],
  isCWorCCWOverall=CWorCCW(radiiPoints),
  dir=sign(r),
  absR=abs(r),
  fractionOffLp=1-1/fn,
  allPoints=[for(fraction=[0:1/fn:1])
    let(
      iterationOffset=dir*sqrt(sq(absR)-sq(fraction*absR))-dir*absR,
      theOffsetPoints=offsetPolygonPoints(radiiPoints,iterationOffset),
      polyRoundOffsetPoints=[for(i=[0:lp-1])
        let(
          pointsAboutCurrent=[
            theOffsetPoints[listWrap(i-1,lp)],
            theOffsetPoints[i],
            theOffsetPoints[listWrap(i+1,lp)]
          ],
          isCWorCCWLocal=CWorCCW(pointsAboutCurrent),
          isInternalRadius=(isCWorCCWLocal*isCWorCCWOverall)==-1,
          // the radius names are only true for positive r,
          // when are r is negative increasingRadius is actually decreasing and vice-vs
          // increasingRadiusWithPositiveR is just to verbose of a variable name for my liking
          increasingRadius=max(radii[i]-iterationOffset, minR),
          decreasingRadius=max(radii[i]+iterationOffset, minR)
        )
        [theOffsetPoints[i].x, theOffsetPoints[i].y, isInternalRadius? increasingRadius: decreasingRadius]
      ],
      pointsForThisLayer=polyRound(polyRoundOffsetPoints,fn)
    )
    addZcoord(pointsForThisLayer,fraction*absR)
  ],
  polyhedronPoints=flatternArray(allPoints),
  allLp=len(allPoints),
  layerLength=len(allPoints[0]),
  loopToSecondLastLayer=allLp-2,
  sideFaces=[for(layerIndex=[0:loopToSecondLastLayer])let(
    currentLayeroffset=layerIndex*layerLength,
    nextLayeroffset=(layerIndex+1)*layerLength,
    layerFaces=[for(subLayerIndex=[0:layerLength-1])
      [
        currentLayeroffset+subLayerIndex, currentLayeroffset + listWrap(subLayerIndex+1,layerLength), nextLayeroffset+listWrap(subLayerIndex+1,layerLength), nextLayeroffset+subLayerIndex]
    ]
  )layerFaces],
  polyhedronFaces=flatternArray(sideFaces)
)
[polyhedronPoints, polyhedronFaces, layerLength];

function flatternRecursion(array, init=[], currentIndex)=
// this is a private function, init and currentIndex are for the function's use 
// only for when it's calling itself, which is why there is a simplified version flatternArray that just calls this one
// array= array to flattern by one level of nesting
// init= the array used to cancat with the next call, only for when the function calls itself
// currentIndex= so the function can keep track of how far it's progressed through the array, only for when it's calling itself
// returns= flatterned array, by one level of nesting
let(
  shouldKickOffRecursion=currentIndex==undef?1:0,
  isLastIndex=currentIndex+1==len(array)?1:0,
  flatArray=shouldKickOffRecursion?flatternRecursion(array,[],0):
    isLastIndex?concat(init,array[currentIndex]):
    flatternRecursion(array,concat(init,array[currentIndex]),currentIndex+1)
)
flatArray;

function flatternArray(array)=
// public version of flatternRecursion, has simplified params to avoid confusion
// array= array to be flatterned
// return= array that been flatterend by one level of nesting
flatternRecursion(array);

function offsetAllFacesBy(array,offset)=[
  // polyhedron faces are simply a list of indices to points, if your concat points together than you probably need to offset
  // your faces array to points to the right place in the new list
  // array= array of point indicies
  // offset= number to offset all indecies by
  // return= array of point indices (i.e. faces) with offset applied
  for(faceIndex=[0:len(array)-1])[
    for(pointIndex=[0:len(array[faceIndex])-1])array[faceIndex][pointIndex]+offset
  ]
];

function extrudePolygonWithRadius(radiiPoints,h=5,r1=1,r2=1,fn=4)=
// this basically calls makeCurvedPartOfPolyHedron twice to get the curved section of the final polyhedron
// and then goes about assmbling them, as the side faces and the top and bottom face caps are missing
// radiiPoints= series of [x,y,r] points,
// h= height of the extrude (total including radius sections)
// r1,r2= define the radius at the top and bottom of the extrud respectively, negative number flange out the extrude
// fn= number of subdivisions
// returns= [polyhedronPoints, polyhedronFaces]
let(
  // top is the top curved part of the extrude
  top=makeCurvedPartOfPolyHedron(radiiPoints,r1,fn),
  topRadiusPoints=translate3Dcoords(top[0],[0,0,h-r1]),
  singeLayerLength=top[2],
  topRadiusFaces=top[1],
  radiusPointsLength=len(topRadiusPoints), // is the same length as bottomRadiusPoints
  // bottom is the bottom curved part of the extrude
  bottom=makeCurvedPartOfPolyHedron(radiiPoints,r2,fn),
  // Z axis needs to be multiplied by -1 to flip it so the radius is going in the right direction [1,1,-1]
  bottomRadiusPoints=translate3Dcoords(bottom[0],[0,0,abs(r2)],[1,1,-1]),
  // becaues the points will be all concatenated into the same array, and the bottom points come second, than
  // the original indices the faces are points towards are wrong and need to have an offset applied to them
  bottomRadiusFaces=offsetAllFacesBy(bottom[1],radiusPointsLength),
  // all of the side panel of the extrusion, connecting points from the inner layers of each
  // of the curved sections
  sideFaces=[for(i=[0:singeLayerLength-1])[
    i,
    listWrap(i+1,singeLayerLength),
    radiusPointsLength + listWrap(i+1,singeLayerLength),
    radiusPointsLength + i
  ]],
  // both of these caps are simple every point from the last layer of the radius points
  topCapFace=[for(i=[0:singeLayerLength-1])radiusPointsLength-singeLayerLength+i],
  bottomCapFace=[for(i=[0:singeLayerLength-1])radiusPointsLength*2-singeLayerLength+i],
  finalPolyhedronPoints=concat(topRadiusPoints,bottomRadiusPoints),
  finalPolyhedronFaces=concat(topRadiusFaces,bottomRadiusFaces, sideFaces, [topCapFace], [bottomCapFace])
)
[
  finalPolyhedronPoints,
  finalPolyhedronFaces
];

module polyRoundExtrude(radiiPoints,length=5,r1=1,r2=1,fn=10,convexity=10) {
  polyhedronPointsNFaces=extrudePolygonWithRadius(radiiPoints,length,r1,r2,fn);
  polyhedron(points=polyhedronPointsNFaces[0], faces=polyhedronPointsNFaces[1], convexity=convexity);
}


// testingInternals();
module testingInternals(){
  //example of rounding random points, this has no current use but is a good demonstration
  random=[for(i=[0:20])[rnd(0,50),rnd(0,50),/*rnd(0,30)*/1000]];
  R =polyRound(random,7);
  translate([-25,25,0]){
    polyline(R);
  }
  
  //example of different modes of the CentreN2PointsArc() function 0=shortest arc, 1=longest arc, 2=CW, 3=CCW
  p1=[0,5];p2=[10,5];centre=[5,0];
  translate([60,0,0]){
    color("green"){
      polygon(CentreN2PointsArc(p1,p2,centre,0,20));//draws the shortest arc
    }
    color("cyan"){
      polygon(CentreN2PointsArc(p1,p2,centre,1,20));//draws the longest arc
    }
  }
  translate([75,0,0]){
    color("purple"){
      polygon(CentreN2PointsArc(p1,p2,centre,2,20));//draws the arc CW (which happens to be the short arc)
    }
    color("red"){
      polygon(CentreN2PointsArc(p2,p1,centre,2,20));//draws the arc CW but p1 and p2 swapped order resulting in the long arc being drawn
    }
  }
  
  radius=6;
  radiipoints=[[0,0,0],[10,20,radius],[20,0,0]];
  tangentsNcen=round3points(radiipoints);
  translate([10,0,0]){
    for(i=[0:2]){
      color("red")translate(getpoints(radiipoints)[i])circle(1);//plots the 3 input points
      color("cyan")translate(tangentsNcen[i])circle(1);//plots the two tangent poins and the circle centre
    }
    translate([tangentsNcen[2][0],tangentsNcen[2][1],-0.2])circle(r=radius,$fn=25);//draws the cirle
    %polygon(getpoints(radiipoints));//draws a polygon
  }
}

function polyRound(radiipoints,fn=5,mode=0)=
  /*Takes a list of radii points of the format [x,y,radius] and rounds each point
    with fn resolution
    mode=0 - automatic radius limiting - DEFAULT
    mode=1 - Debug, output radius reduction for automatic radius limiting
    mode=2 - No radius limiting*/
  let(
    p=getpoints(radiipoints), //make list of coordinates without radii
    Lp=len(p),
    //remove the middle point of any three colinear points, otherwise adding a radius to the middle of a straigh line causes problems
    radiiPointsWithoutTrippleColinear=[
      for(i=[0:len(p)-1]) if(
        // keep point if it isn't colinear or if the radius is 0
        !isColinear(
          p[listWrap(i-1,Lp)],
          p[listWrap(i+0,Lp)],
          p[listWrap(i+1,Lp)]
        )||
        p[listWrap(i+0,Lp)].z!=0
      ) radiipoints[listWrap(i+0,Lp)] 
    ],
    newrp2=processRadiiPoints(radiiPointsWithoutTrippleColinear),
    plusMinusPointRange=mode==2?1:2,
    temp=[
      for(i=[0:len(newrp2)-1]) //for each point in the radii array
      let(
        thepoints=[for(j=[-plusMinusPointRange:plusMinusPointRange])newrp2[listWrap(i+j,len(newrp2))]],//collect 5 radii points
        temp2=mode==2?round3points(thepoints,fn):round5points(thepoints,fn,mode)
      )
      mode==1?temp2:newrp2[i][2]==0?
        [[newrp2[i][0],newrp2[i][1]]]: //return the original point if the radius is 0
        CentreN2PointsArc(temp2[0],temp2[1],temp2[2],0,fn) //return the arc if everything is normal
    ]
  )
  [for (a = temp) for (b = a) b];//flattern and return the array

function round5points(rp,fn,debug=0)=
	rp[2][2]==0&&debug==0?[[rp[2][0],rp[2][1]]]://return the middle point if the radius is 0
	rp[2][2]==0&&debug==1?0://if debug is enabled and the radius is 0 return 0
	let(
    p=getpoints(rp), //get list of points
    r=[for(i=[1:3]) abs(rp[i][2])],//get the centre 3 radii
    //start by determining what the radius should be at point 3
    //find angles at points 2 , 3 and 4
    a2=cosineRuleAngle(p[0],p[1],p[2]),
    a3=cosineRuleAngle(p[1],p[2],p[3]),
    a4=cosineRuleAngle(p[2],p[3],p[4]),
    //find the distance between points 2&3 and between points 3&4
    d23=pointDist(p[1],p[2]),
    d34=pointDist(p[2],p[3]),
    //find the radius factors
    F23=(d23*tan(a2/2)*tan(a3/2))/(r[0]*tan(a3/2)+r[1]*tan(a2/2)),
    F34=(d34*tan(a3/2)*tan(a4/2))/(r[1]*tan(a4/2)+r[2]*tan(a3/2)),
    newR=min(r[1],F23*r[1],F34*r[1]),//use the smallest radius
    //now that the radius has been determined, find tangent points and circle centre
    tangD=newR/tan(a3/2),//distance to the tangent point from p3
      circD=newR/sin(a3/2),//distance to the circle centre from p3
    //find the angle from the p3
    an23=getAngle(p[1],p[2]),//angle from point 3 to 2
    an34=getAngle(p[3],p[2]),//angle from point 3 to 4
    //find tangent points
    t23=[p[2][0]-cos(an23)*tangD,p[2][1]-sin(an23)*tangD],//tangent point between points 2&3
    t34=[p[2][0]-cos(an34)*tangD,p[2][1]-sin(an34)*tangD],//tangent point between points 3&4
    //find circle centre
    tmid=getMidpoint(t23,t34),//midpoint between the two tangent points
    anCen=getAngle(tmid,p[2]),//angle from point 3 to circle centre
    cen=[p[2][0]-cos(anCen)*circD,p[2][1]-sin(anCen)*circD]
  )
    //circle center by offseting from point 3
    //determine the direction of rotation
	debug==1?//if debug in disabled return arc (default)
    (newR-r[1]):
	[t23,t34,cen];

function round3points(rp,fn)=
  rp[1][2]==0?[[rp[1][0],rp[1][1]]]://return the middle point if the radius is 0
	let(
    p=getpoints(rp), //get list of points
	  r=rp[1][2],//get the centre 3 radii
    ang=cosineRuleAngle(p[0],p[1],p[2]),//angle between the lines
    //now that the radius has been determined, find tangent points and circle centre
	  tangD=r/tan(ang/2),//distance to the tangent point from p2
    circD=r/sin(ang/2),//distance to the circle centre from p2
    //find the angles from the p2 with respect to the postitive x axis
    angleFromPoint1ToPoint2=getAngle(p[0],p[1]),
    angleFromPoint2ToPoint3=getAngle(p[2],p[1]),
    //find tangent points
    t12=[p[1][0]-cos(angleFromPoint1ToPoint2)*tangD,p[1][1]-sin(angleFromPoint1ToPoint2)*tangD],//tangent point between points 1&2
    t23=[p[1][0]-cos(angleFromPoint2ToPoint3)*tangD,p[1][1]-sin(angleFromPoint2ToPoint3)*tangD],//tangent point between points 2&3
    //find circle centre
    tmid=getMidpoint(t12,t23),//midpoint between the two tangent points
    angCen=getAngle(tmid,p[1]),//angle from point 2 to circle centre
    cen=[p[1][0]-cos(angCen)*circD,p[1][1]-sin(angCen)*circD] //circle center by offseting from point 2 
  )
	[t12,t23,cen];

function parallelFollow(rp,thick=4,minR=1,mode=1)=
    //rp[1][2]==0?[rp[1][0],rp[1][1],0]://return the middle point if the radius is 0
    thick==0?[rp[1][0],rp[1][1],0]://return the middle point if the radius is 0
	let(
    p=getpoints(rp), //get list of points
	  r=thick,//get the centre 3 radii
    ang=cosineRuleAngle(p[0],p[1],p[2]),//angle between the lines
    //now that the radius has been determined, find tangent points and circle centre
    tangD=r/tan(ang/2),//distance to the tangent point from p2
  	sgn=CWorCCW(rp),//rotation of the three points cw or ccw?let(sgn=mode==0?1:-1)
    circD=mode*sgn*r/sin(ang/2),//distance to the circle centre from p2
    //find the angles from the p2 with respect to the postitive x axis
    angleFromPoint1ToPoint2=getAngle(p[0],p[1]),
    angleFromPoint2ToPoint3=getAngle(p[2],p[1]),
    //find tangent points
    t12=[p[1][0]-cos(angleFromPoint1ToPoint2)*tangD,p[1][1]-sin(angleFromPoint1ToPoint2)*tangD],//tangent point between points 1&2
	  t23=[p[1][0]-cos(angleFromPoint2ToPoint3)*tangD,p[1][1]-sin(angleFromPoint2ToPoint3)*tangD],//tangent point between points 2&3
    //find circle centre
    tmid=getMidpoint(t12,t23),//midpoint between the two tangent points
    angCen=getAngle(tmid,p[1]),//angle from point 2 to circle centre
    cen=[p[1][0]-cos(angCen)*circD,p[1][1]-sin(angCen)*circD],//circle center by offseting from point 2 
    outR=max(minR,rp[1][2]-thick*sgn*mode) //ensures radii are never too small.
  )
	concat(cen,outR);

function findPoint(ang1,refpoint1,ang2,refpoint2,r=0)=
  let(
    m1=tan(ang1),
    c1=refpoint1.y-m1*refpoint1.x,
	  m2=tan(ang2),
    c2=refpoint2.y-m2*refpoint2.x,
    outputX=(c2-c1)/(m1-m2),
    outputY=m1*outputX+c1
  )
	[outputX,outputY,r];

function beamChain(radiiPoints,offset1=0,offset2,mode=0,minR=0,startAngle,endAngle)= 
  /*This function takes a series of radii points and plots points to run along side at a consistant distance, think of it as offset but for line instead of a polygon
  radiiPoints=radii points,
  offset1 & offset2= The two offsets that give the beam it's thickness. When using with mode=2 only offset1 is needed as there is no return path for the polygon
  minR=min radius, if all of your radii are set properly within the radii points this value can be ignored
  startAngle & endAngle= Angle at each end of the beam, different mode determine if this angle is relative to the ending legs of the beam or absolute.
  mode=1 - include endpoints startAngle&2 are relative to the angle of the last two points and equal 90deg if not defined
  mode=2 - Only the forward path is defined, useful for combining the beam with other radii points, see examples for a use-case.
  mode=3 - include endpoints startAngle&2 are absolute from the x axis and are 0 if not defined
  negative radiuses only allowed for the first and last radii points
  
  As it stands this function could probably be tidied a lot, but it works, I'll tidy later*/
  let(
    offset2undef=offset2==undef?1:0,
    offset2=offset2undef==1?0:offset2,
    CWorCCW1=sign(offset1)*CWorCCW(radiiPoints),
    CWorCCW2=sign(offset2)*CWorCCW(radiiPoints),
    offset1=abs(offset1),
    offset2b=abs(offset2),
    Lrp3=len(radiiPoints)-3,
    Lrp=len(radiiPoints),
    startAngle=mode==0&&startAngle==undef?
      getAngle(radiiPoints[0],radiiPoints[1])+90:
      mode==2&&startAngle==undef?
      0:
      mode==0?
      getAngle(radiiPoints[0],radiiPoints[1])+startAngle:
      startAngle,
    endAngle=mode==0&&endAngle==undef?
            getAngle(radiiPoints[Lrp-1],radiiPoints[Lrp-2])+90:
        mode==2&&endAngle==undef?
            0:
        mode==0?
            getAngle(radiiPoints[Lrp-1],radiiPoints[Lrp-2])+endAngle:
            endAngle,
    OffLn1=[for(i=[0:Lrp3]) offset1==0?radiiPoints[i+1]:parallelFollow([radiiPoints[i],radiiPoints[i+1],radiiPoints[i+2]],offset1,minR,mode=CWorCCW1)],
    OffLn2=[for(i=[0:Lrp3]) offset2==0?radiiPoints[i+1]:parallelFollow([radiiPoints[i],radiiPoints[i+1],radiiPoints[i+2]],offset2b,minR,mode=CWorCCW2)],  
    Rp1=abs(radiiPoints[0].z),
    Rp2=abs(radiiPoints[Lrp-1].z),
    endP1a=findPoint(getAngle(radiiPoints[0],radiiPoints[1]),         OffLn1[0],              startAngle,radiiPoints[0],     Rp1),
    endP1b=findPoint(getAngle(radiiPoints[Lrp-1],radiiPoints[Lrp-2]), OffLn1[len(OffLn1)-1],  endAngle,radiiPoints[Lrp-1], Rp2),
    endP2a=findPoint(getAngle(radiiPoints[0],radiiPoints[1]),         OffLn2[0],              startAngle,radiiPoints[0],     Rp1),
    endP2b=findPoint(getAngle(radiiPoints[Lrp-1],radiiPoints[Lrp-2]), OffLn2[len(OffLn1)-1],  endAngle,radiiPoints[Lrp-1], Rp2),
    absEnda=getAngle(endP1a,endP2a),
    absEndb=getAngle(endP1b,endP2b),
    negRP1a=[cos(absEnda)*radiiPoints[0].z*10+endP1a.x,        sin(absEnda)*radiiPoints[0].z*10+endP1a.y,       0.0],
    negRP2a=[cos(absEnda)*-radiiPoints[0].z*10+endP2a.x,       sin(absEnda)*-radiiPoints[0].z*10+endP2a.y,      0.0],
    negRP1b=[cos(absEndb)*radiiPoints[Lrp-1].z*10+endP1b.x,    sin(absEndb)*radiiPoints[Lrp-1].z*10+endP1b.y,   0.0],
    negRP2b=[cos(absEndb)*-radiiPoints[Lrp-1].z*10+endP2b.x,   sin(absEndb)*-radiiPoints[Lrp-1].z*10+endP2b.y,  0.0],
    OffLn1b=(mode==0||mode==2)&&radiiPoints[0].z<0&&radiiPoints[Lrp-1].z<0?
        concat([negRP1a],[endP1a],OffLn1,[endP1b],[negRP1b])
      :(mode==0||mode==2)&&radiiPoints[0].z<0?
        concat([negRP1a],[endP1a],OffLn1,[endP1b])
      :(mode==0||mode==2)&&radiiPoints[Lrp-1].z<0?
        concat([endP1a],OffLn1,[endP1b],[negRP1b])
      :mode==0||mode==2?
        concat([endP1a],OffLn1,[endP1b])
      :
        OffLn1,
    OffLn2b=(mode==0||mode==2)&&radiiPoints[0].z<0&&radiiPoints[Lrp-1].z<0?
        concat([negRP2a],[endP2a],OffLn2,[endP2b],[negRP2b])
      :(mode==0||mode==2)&&radiiPoints[0].z<0?
        concat([negRP2a],[endP2a],OffLn2,[endP2b])
      :(mode==0||mode==2)&&radiiPoints[Lrp-1].z<0?
        concat([endP2a],OffLn2,[endP2b],[negRP2b])
      :mode==0||mode==2?
        concat([endP2a],OffLn2,[endP2b])
      :
        OffLn2
    )//end of let()
  offset2undef==1?OffLn1b:concat(OffLn2b,revList(OffLn1b));
    
function revList(list)=//reverse list
  let(Llist=len(list)-1)
  [for(i=[0:Llist]) list[Llist-i]];

function CWorCCW(p)=
	let(
    Lp=len(p),
	  e=[for(i=[0:Lp-1]) 
      (p[listWrap(i+0,Lp)].x-p[listWrap(i+1,Lp)].x)*(p[listWrap(i+0,Lp)].y+p[listWrap(i+1,Lp)].y)
    ]
  )  
  sign(sum(e));

function CentreN2PointsArc(p1,p2,cen,mode=0,fn)=
  /* This function plots an arc from p1 to p2 with fn increments using the cen as the centre of the arc.
  the mode determines how the arc is plotted
  mode==0, shortest arc possible 
  mode==1, longest arc possible
  mode==2, plotted clockwise
  mode==3, plotted counter clockwise
  */
	let(
    isCWorCCW=CWorCCW([cen,p1,p2]),//determine the direction of rotation
    //determine the arc angle depending on the mode
    p1p2Angle=cosineRuleAngle(p2,cen,p1),
    arcAngle=
      mode==0?p1p2Angle:
      mode==1?p1p2Angle-360:
      mode==2&&isCWorCCW==-1?p1p2Angle:
      mode==2&&isCWorCCW== 1?p1p2Angle-360:
      mode==3&&isCWorCCW== 1?p1p2Angle:
      mode==3&&isCWorCCW==-1?p1p2Angle-360:
      cosineRuleAngle(p2,cen,p1),
    r=pointDist(p1,cen),//determine the radius
	  p1Angle=getAngle(cen,p1) //angle of line 1
  )
  [for(i=[0:fn])
  let(angleIncrement=(arcAngle/fn)*i*isCWorCCW)
  [cos(p1Angle+angleIncrement)*r+cen.x,sin(p1Angle+angleIncrement)*r+cen.y]];

function translateRadiiPoints(radiiPoints,tran=[0,0],rot=0)=
	[for(i=radiiPoints) 
		let(
      a=getAngle([0,0],[i.x,i.y]),//get the angle of the this point
		  h=pointDist([0,0],[i.x,i.y]) //get the hypotenuse/radius
    )
		[h*cos(a+rot)+tran.x,h*sin(a+rot)+tran.y,i.z]//calculate the point's new position
	];

module round2d(OR=3,IR=1){
  offset(OR,$fn=100){
    offset(-IR-OR,$fn=100){
      offset(IR,$fn=100){
        children();
      }
    }
  }
}

module shell2d(offset1,offset2=0,minOR=0,minIR=0){
	difference(){
		round2d(minOR,minIR){
      offset(max(offset1,offset2)){
        children(0);//original 1st child forms the outside of the shell
      }
    }
		round2d(minIR,minOR){
      difference(){//round the inside cutout
        offset(min(offset1,offset2)){
          children(0);//shrink the 1st child to form the inside of the shell 
        }
        if($children>1){
          for(i=[1:$children-1]){
            children(i);//second child and onwards is used to add material to inside of the shell
          }
        }
      }
		}
	}
}

module internalSq(size,r,center=0){
    tran=center==1?[0,0]:size/2;
    translate(tran){
      square(size,true);
      offs=sin(45)*r;
      for(i=[-1,1],j=[-1,1]){
        translate([(size.x/2-offs)*i,(size.y/2-offs)*j])circle(r);
      }
    }
}

module extrudeWithRadius(length,r1=0,r2=0,fn=30){
  n1=sign(r1);n2=sign(r2);
  r1=abs(r1);r2=abs(r2);
  translate([0,0,r1]){
    linear_extrude(length-r1-r2){
      children();
    }
  }
  for(i=[0:fn-1]){
    translate([0,0,i/fn*r1]){
      linear_extrude(r1/fn+0.01){
        offset(n1*sqrt(sq(r1)-sq(r1-i/fn*r1))-n1*r1){
          children();
        }
      }
    }
    translate([0,0,length-r2+i/fn*r2]){
      linear_extrude(r2/fn+0.01){
        offset(n2*sqrt(sq(r2)-sq(i/fn*r2))-n2*r2){
          children();
        }
      }
    }
  }
}

function mirrorPoints(radiiPoints,rot=0,endAttenuation=[0,0])= //mirrors a list of points about Y, ignoring the first and last points and returning them in reverse order for use with polygon or polyRound
  let(
    a=translateRadiiPoints(radiiPoints,[0,0],-rot),
    temp3=[for(i=[0+endAttenuation[0]:len(a)-1-endAttenuation[1]])
      [a[i][0],-a[i][1],a[i][2]]
    ],
    temp=translateRadiiPoints(temp3,[0,0],rot),
    temp2=revList(temp3)
  )    
  concat(radiiPoints,temp2);

function processRadiiPoints(rp)=
  [for(i=[0:len(rp)-1])
    processRadiiPoints2(rp,i)
  ];

function processRadiiPoints2(list,end=0,idx=0,result=0)=
  idx>=end+1?result:
  processRadiiPoints2(list,end,idx+1,relationalRadiiPoints(result,list[idx]));

function cosineRuleBside(a,c,C)=c*cos(C)-sqrt(sq(a)+sq(c)+sq(cos(C))-sq(c));

function absArelR(po,pn)=
  let(
    th2=atan(po[1]/po[0]),
    r2=sqrt(sq(po[0])+sq(po[1])),
    r3=cosineRuleBside(r2,pn[1],th2-pn[0])
  )
  [cos(pn[0])*r3,sin(pn[0])*r3,pn[2]];

function relationalRadiiPoints(po,pi)=
  let(
    p0=pi[0],
    p1=pi[1],
    p2=pi[2],
    pv0=pi[3][0],
    pv1=pi[3][1],
    pt0=pi[3][2],
    pt1=pi[3][3],
    pn=
      (pv0=="y"&&pv1=="x")||(pv0=="r"&&pv1=="a")||(pv0=="y"&&pv1=="a")||(pv0=="x"&&pv1=="a")||(pv0=="y"&&pv1=="r")||(pv0=="x"&&pv1=="r")?
        [p1,p0,p2,concat(pv1,pv0,pt1,pt0)]:
        [p0,p1,p2,concat(pv0,pv1,pt0,pt1)],
    n0=pn[0],
    n1=pn[1],
    n2=pn[2],
    nv0=pn[3][0],
    nv1=pn[3][1],
    nt0=pn[3][2],
    nt1=pn[3][3],
    temp=
      pn[0]=="l"?
        [po[0],pn[1],pn[2]]
      :pn[1]=="l"?
        [pn[0],po[1],pn[2]]
      :nv0==undef?
        [pn[0],pn[1],pn[2]]//abs x, abs y as default when undefined
      :nv0=="a"?
        nv1=="r"?
          nt0=="a"?
            nt1=="a"||nt1==undef?
              [cos(n0)*n1,sin(n0)*n1,n2]//abs angle, abs radius
            :absArelR(po,pn)//abs angle rel radius
          :nt1=="r"||nt1==undef?
            [po[0]+cos(pn[0])*pn[1],po[1]+sin(pn[0])*pn[1],pn[2]]//rel angle, rel radius 
          :[pn[0],pn[1],pn[2]]//rel angle, abs radius
        :nv1=="x"?
          nt0=="a"?
            nt1=="a"||nt1==undef?
              [pn[1],pn[1]*tan(pn[0]),pn[2]]//abs angle, abs x
            :[po[0]+pn[1],(po[0]+pn[1])*tan(pn[0]),pn[2]]//abs angle rel x
            :nt1=="r"||nt1==undef?
              [po[0]+pn[1],po[1]+pn[1]*tan(pn[0]),pn[2]]//rel angle, rel x 
            :[pn[1],po[1]+(pn[1]-po[0])*tan(pn[0]),pn[2]]//rel angle, abs x
          :nt0=="a"?
            nt1=="a"||nt1==undef?
              [pn[1]/tan(pn[0]),pn[1],pn[2]]//abs angle, abs y
            :[(po[1]+pn[1])/tan(pn[0]),po[1]+pn[1],pn[2]]//abs angle rel y
          :nt1=="r"||nt1==undef?
            [po[0]+(pn[1]-po[0])/tan(90-pn[0]),po[1]+pn[1],pn[2]]//rel angle, rel y 
          :[po[0]+(pn[1]-po[1])/tan(pn[0]),pn[1],pn[2]]//rel angle, abs y
      :nv0=="r"?
        nv1=="x"?
          nt0=="a"?
            nt1=="a"||nt1==undef?
              [pn[1],sign(pn[0])*sqrt(sq(pn[0])-sq(pn[1])),pn[2]]//abs radius, abs x
            :[po[0]+pn[1],sign(pn[0])*sqrt(sq(pn[0])-sq(po[0]+pn[1])),pn[2]]//abs radius rel x
          :nt1=="r"||nt1==undef?
            [po[0]+pn[1],po[1]+sign(pn[0])*sqrt(sq(pn[0])-sq(pn[1])),pn[2]]//rel radius, rel x 
          :[pn[1],po[1]+sign(pn[0])*sqrt(sq(pn[0])-sq(pn[1]-po[0])),pn[2]]//rel radius, abs x
        :nt0=="a"?
          nt1=="a"||nt1==undef?
            [sign(pn[0])*sqrt(sq(pn[0])-sq(pn[1])),pn[1],pn[2]]//abs radius, abs y
          :[sign(pn[0])*sqrt(sq(pn[0])-sq(po[1]+pn[1])),po[1]+pn[1],pn[2]]//abs radius rel y
        :nt1=="r"||nt1==undef?
          [po[0]+sign(pn[0])*sqrt(sq(pn[0])-sq(pn[1])),po[1]+pn[1],pn[2]]//rel radius, rel y 
        :[po[0]+sign(pn[0])*sqrt(sq(pn[0])-sq(pn[1]-po[1])),pn[1],pn[2]]//rel radius, abs y
      :nt0=="a"?
        nt1=="a"||nt1==undef?
          [pn[0],pn[1],pn[2]]//abs x, abs y
        :[pn[0],po[1]+pn[1],pn[2]]//abs x rel y
      :nt1=="r"||nt1==undef?
        [po[0]+pn[0],po[1]+pn[1],pn[2]]//rel x, rel y 
      :[po[0]+pn[0],pn[1],pn[2]]//rel x, abs y
  )
  temp;

function invtan(run,rise)=
  let(a=abs(atan(rise/run)))
  rise==0&&run>0?
    0:rise>0&&run>0?
    a:rise>0&&run==0?
    90:rise>0&&run<0?
    180-a:rise==0&&run<0?
    180:rise<0&&run<0?
    a+180:rise<0&&run==0?
    270:rise<0&&run>0?
    360-a:"error";

function cosineRuleAngle(p1,p2,p3)=
  let(
    p12=abs(pointDist(p1,p2)),
    p13=abs(pointDist(p1,p3)),
    p23=abs(pointDist(p2,p3))
  )
  acos((sq(p23)+sq(p12)-sq(p13))/(2*p23*p12));

function sum(list, idx = 0, result = 0) = 
	idx >= len(list) ? result : sum(list, idx + 1, result + list[idx]);

function sq(x)=x*x;
function getGradient(p1,p2)=(p2.y-p1.y)/(p2.x-p1.x);
function getAngle(p1,p2)=p1==p2?0:invtan(p2[0]-p1[0],p2[1]-p1[1]);
function getMidpoint(p1,p2)=[(p1[0]+p2[0])/2,(p1[1]+p2[1])/2]; //returns the midpoint of two points
function pointDist(p1,p2)=sqrt(abs(sq(p1[0]-p2[0])+sq(p1[1]-p2[1]))); //returns the distance between two points
function isColinear(p1,p2,p3)=getGradient(p1,p2)==getGradient(p2,p3)?1:0;//return 1 if 3 points are colinear
module polyline(p, width=0.3) {
  for(i=[0:max(0,len(p)-1)]){
    color([i*1/len(p),1-i*1/len(p),0,0.5])line(p[i],p[listWrap(i+1,len(p) )],width);
  }
} // polyline plotter
module line(p1, p2 ,width=0.3) { // single line plotter
  hull() {
    translate(p1){
      circle(width);
    }
    translate(p2){
      circle(width);
    }
  }
}

function getpoints(p)=[for(i=[0:len(p)-1])[p[i].x,p[i].y]];// gets [x,y]list of[x,y,r]list
function listWrap(x,x_max=1,x_min=0) = (((x - x_min) % (x_max - x_min)) + (x_max - x_min)) % (x_max - x_min) + x_min; // wraps numbers inside boundaries
function rnd(a = 1, b = 0, s = []) = 
  s == [] ? 
    (rands(min(a, b), max(   a, b), 1)[0]):(rands(min(a, b), max(a, b), 1, s)[0]); // nice rands wrapper 
