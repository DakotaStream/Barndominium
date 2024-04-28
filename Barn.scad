// This include file makes things more organized and smaller.
//'allFurniture();

include <furniture.scad>;
include <kitchenFurnishings.scad>;
//([position],scale,angle,[length, width, height])
//kitchen([[653,-205,0],90]);
kitchen([[653,-205,0],90]);
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
 // counterCorner([[0,21,wallThickness],1,90,]);
//([position],scale,angle,[length, width, height])
 // island([[0,21,wallThickness],1,90,[60,48,37]]);
//  counter([[0,0,wallThickness],1,90,50]);
  //counterCorner([[0,0,wallThickness],1,180]);
//  stove([[800,0,wallThickness],1,180]);
}



module allGables(){
  gable([barnWidth,barnHeight,gableHeight,wallThickness,0]);
  gable([barnWidth,barnHeight,gableHeight,wallThickness,garageWidth+wallThickness]);
  gable([barnWidth,barnHeight,gableHeight,wallThickness,barnLength-wallThickness]);
}




module kitchen(in){
  position = in[0];           
  a = in[1];  //angle

  translate(position){
    rotate([0,0,a]){
//  lamp(70,20,50);
       counterCup([[0,0,wallThickness],55,0,36]);
       sink([[0,0,wallThickness],0,42]);
       counterCup([[-30-42,0,wallThickness],55,0,30]);
       counterCorner([[-84,0,wallThickness],270]);
       counterCup([[-84,44+12,wallThickness],55,270,44]);
       stove([[-84,56,wallThickness],270]);
       cupboard([[-72,56,wallThickness + 60],90,30]);
       counterCup([[-84,120,wallThickness],55,270,34]);
       refrigerator([[-25,142,wallThickness],0,[36,35,70]]);
       counterCup([[-84 + 150 -34 + 13,177,wallThickness],55,180,34]);
       island([[1-19,75+35,wallThickness],270,[50,36,37]]);
       Table([[17+55,47,0],0,42, 94, 5, 4, 36, 1]);
    }
  }
}

module kitchenOne(in){
  position = in[0];           
  a = in[1];  //angle


  translate(position){
    rotate([0,0,a]){
    
//       counterCup([[0,0,wallThickness],55,1,0,36]);

       //translate([1,0,wallThickness])
         sink([[0,0,0],1,270,44]);
//       counterCup([[-30-42,0,wallThickness],55,1,0,30]);

       counterCup([[-85,0,wallThickness],55,0,14]);
       stove([[-84,56,wallThickness],1,270]);

      cupboard([[-72,56,wallThickness + 60],90,30]);

      counterCup([[-84,120,wallThickness],55,270,34]);

      refrigerator([[-25,142,wallThickness],1,0,[36,35,70]]);
      
      counterCup([[-84 + 150 -34 + 13,177,wallThickness],55,180,34]);
//      island([[1-19,75+35,wallThickness],1,270,[50,36,37]]);
//    island([[0,21,wallThickness],1,90,[60,48,37]]);

       Table([[17+55,47,0],0,42, 94, 5, 4, 36, 1]);
    }
  }
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

