// This include file makes things more organized and smaller.
allFurniture();
//barnAndWindows();
//allGables();
//:roof([barnLength + 50, barnWidth,barnHeight,gableHeight,wallThickness,barnLength+20]);

module barnAndWindows(){
  difference(){
    bin(barn);
    allWindows();
  }
}

module allFurniture(){
//  sink([[700,0,wallThickness],1,180,36]);
//  counter([[858,0,wallThickness],1,180,200]);
//  counter([[0,71,wallThickness],1,90,50]);
//  counter([[-21,0,wallThickness],1,0,50]);
 // counter([[0,0,wallThickness],1,0,21]);
  counterCorner([[0,21,wallThickness],1,90,]);
//  counter([[0,0,wallThickness],1,90,50]);
  //counterCorner([[0,0,wallThickness],1,180]);
//  stove([[800,0,wallThickness],1,180]);
}



module allGables(){
  gable([barnWidth,barnHeight,gableHeight,wallThickness,0]);
  gable([barnWidth,barnHeight,gableHeight,wallThickness,garageWidth+wallThickness]);
  gable([barnWidth,barnHeight,gableHeight,wallThickness,barnLength-wallThickness]);
}



module sink(in){
  m = in[0];
  x = m[0];
  y = m[1];
  z = m[2];
  s = in[1];
  r = in[2];
  l = in[3];

  difference()
  {
    counter(in);
    {
      rotate([0,0,r+180])
      {
        translate([x+19,y-20,z+28])
          linear_extrude(9){ polygon([[0,2*s], [0, 14*s],   [2*s,16*s], [12.5*s,16*s],
          [14.5*s,14*s], [14.5*s,2*s],  [12.5*s,0*s], [2*s,0*s], [0*s,2*s] ]); } 
        translate([x+2.5,y-20,z+28])
        linear_extrude(9){ polygon([[0,2*s], [0, 14*s],   [2*s,16*s], [12.5*s,16*s],
          [14.5*s,14*s], [14.5*s,2*s],  [12.5*s,0*s], [2*s,0*s], [0*s,2*s] ]); } 
      }
    }
  }
}
 

module counterCorner(in){
  r = in[2];
  s = in[1];
  
  rotate([0,0,r]){
    counter([[0,0,wallThickness],1,0,21]);
    counter([[0,21,wallThickness],1,90,21]);
  }

}



module counter(in){
  s = in[1];
  r = in[2];
  l = in[3];
translate(in[0])
  rotate([0,270,r])
      linear_extrude(l){ polygon([[0,0], [0, 21*s], [4.5*s,21*s], [4.5*s,24*s],
      [35.5*s,24*s], [35.5*s,26*s],[36.75*s,26*s],
      [36.75*s,1.5*s], [41*s,1.5*s], [41*s,0*s],
      [0,0]
      ]); } 
}

module stove(in){
  s = in[1];
  r = in[2];
  translate(in[0])
    rotate([0,270,r])
        linear_extrude(30*s){ polygon([[0,0], [0, 26*s], [32*s,26*s],
        [32*s,28*s], [34*s,28*s], [34*s,26*s], 
        [37*s,26*s], [37*s,4*s], 
        [48*s,2*s],[48*s,0],[0,0]
        ]); } 
}

module roof(s){
  l = s[0];
  w = s[1];
  bh = s[2];
  gh = s[3];
  t = s[4];
  p = s[5];
  translate([t+p,-w/2,bh])
    rotate([0,180,0])
      rotate([0,90,0])
        linear_extrude(l){ polygon([[0,0], [gh, w/2], [0,w],
        [0,w+t], [t,w+t], [gh+t,w/2], [t,-t], [0,-t], [0,0]
        ]); } 

}


module gable(s){
  w = s[0];
  bh = s[1];
  gh = s[2];
  t = s[3];
  p = s[4];
translate([t+p,-w/2,bh])
  rotate([0,180,0])
    rotate([0,90,0])
      linear_extrude(t){ polygon([[0,0], [0, w], [gh, w/2], [0,0]]); } 

}

//window([[120,160,wallThickness],[3,3,3]]);
//translate([-40,0,0])bin(e);
//bin(f);

wallThickness = 6;
barnLength = 1000;
barnWidth = 600;
barnHeight = 264;
garageWidth = 464;
gableHeight = 120;
roofFront = [[barnLength+12,barnWidth/2+48,wallThickness],60,[-6,barnWidth/2-wallThickness,barnHeight]];
roofBack = [[barnLength+12,barnWidth/2+48,wallThickness],300,[-6,-barnWidth/2-wallThickness,barnHeight]];


barn = [[barnLength,barnWidth,barnHeight,wallThickness],[garageWidth]];
RvDoorFront = [[120,160,wallThickness],0,[42,-barnWidth/2,2]];
RvDoorBack = [[120,160,wallThickness],0,[42,barnWidth/2-wallThickness,2]];
TruckDoorFront = [[120,96,wallThickness],0,[42+120+36,-barnWidth/2,2]];
TruckDoorBack = [[120,96,wallThickness],0,[42+120+36,barnWidth/2-wallThickness,2]];
HumanDoorGarageBack = [[36,80,wallThickness],0,[42+120+36+120+36,barnWidth/2-wallThickness,2]];
HumanDoorGarageFront = [[36,80,wallThickness],0,[42+120+36+120+36,-barnWidth/2,2]];

CurrentGarageDoor = [[192,84,wallThickness],0,[42+120+36,barnWidth/2-wallThickness,2]];

module allWindows(){
  window(RvDoorFront);
  window(RvDoorBack);
  window(TruckDoorFront);
  window(TruckDoorBack);
  window(HumanDoorGarageFront);
  window(HumanDoorGarageBack);
}


module window(size){
  d = size[0];
  l = d[0];
  w = d[1];
  h = d[2];

  orientation = size[1];
  translate(size[2])
    rotate([0,0,90 * orientation])
      cube([l,h,w]);
}


module bin(in){
    d = in[0];
    l = d[0];
    w = d[1];
    h = d[2];
    wall = d[3];
    dv = getDividers(l,wall,in[1]);
    numDv = len(dv);
    dvSpace = add(sumlist(dv),wall);
    totCompart = dvSpace[numDv]-(numDv*wall+wall);
    totWall = numDv*wall+wall;
    totLen = totCompart + totWall;
    spaceLeftOver = hasDividers(dv[0],l,totLen,wall);
    message(in,numDv,dvSpace,totCompart,totWall,totLen,spaceLeftOver);
    //message(l,w,h,wall,in[1],lenDv,dvSpace,totCompart,totWall,totLen,spaceLeftOver);
    difference(){
        outerShell(l,w,h);
        insideShells(numDv,dv,w,h,wall,dvSpace,spaceLeftOver); 
    }
}

module outerShell(l,w,h){
    translate([0,-w/2]) 
        cube([l,w,h]);
}

module insideShells(numDv,dv,w,h,wall,dvSpace,spaceLeftOver) {
    for(i = [0:numDv-1]){
        insideShell(dv[i],w,h,wall,dvSpace[i]);
    }
    if (spaceLeftOver>0){
        insideShell(spaceLeftOver,w,h,wall,offset(dv,dvSpace,numDv,wall));
    }
}

module insideShell(l,w,h,wall,dvSpace) {
    iw = w - wall * 2; 
    translate([dvSpace,-iw/2,wall])
        cube([l, iw, h]);
}

module message(in,numDv,dvSpace,totCompart,totWall,allIn,spaceLeftOver){
    d = in[0];
    stars = "\n************************************************************";
    header = "\n*************************Bins!*******************************";
    cls = "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
    msg1 = "\n bin([Length, Width, Height, WallThickness],[Compartments])";
    msg2 = str("\n Bin exterior:  Length=", d[0] ,", Width=", d[1], ", Height=", d[2], ", Wall Thickness=", d[3]);
    msg3 = str("    Size of all Compartments =", totCompart);
    msg4 = str("\n                             Size of all Walls =", totWall);
    msg5 = str("\n                  Compartments + Walls =", allIn);
    msg6 = str("\nLeft over space for commpartments =", spaceLeftOver);
    echo (str(cls,stars, header, stars, msg1, msg2));
    for (a =[0:numDv-1])echo(compartmentString(a,in[1],dvSpace));
    echo (str(msg3,msg4,msg5,msg6,stars));
} 

harborfreightXY = ([560,490]); //w,d
harborfreightXYRef1 = ([562,492]); //w,d
harborfreightXYRef2 = ([568,494]);
harborfreightDrawerHeightRef = ([41.77 ,41.04 ,41.24 ,69.54 ,69.32 ,90.45 ,146.07 ,144.91]);
harborfreightDrawerHeight = ([40 ,40 ,40 ,69 ,69 ,90 ,145 ,145]);
function compartmentString(a,c,e) = str("Compartment ",a+1," Length=",c[a]," Positioned at=",e[a],"mm");
function sumlist(l, al=[0], i=0, t=0) = i>=len(l) ? al : sumlist(l, concat(al, [t+l[i]]), i+1, t+l[i] );
function add(l,n) = [for (i = [0:len(l)-1]) l[i]+n+n*i];
function hasDividers(c,l,allIn,wall) = c>0?l - allIn - wall : l - allIn;
function offset(c,e,numC,wall) = c[0]>0 ?  e[numC-1]+c[numC-1]+wall:wall;
function equalBins(l,w,n) = [for(i = [1 : n]) (l-((n+2)*w))/(n+1)];
function getDividers(l,wall,c) = (c[0] == true) ? equalBins(l,wall,c[1]): c;
function s(s,x,y) = [s*x,x*y];
