
// This include file makes things more organized and smaller.
//'allFurniture();

include <furniture.scad>;
include <kitchenFurnishings.scad>;
SecondFloorWallHeight = 96;
FirstFloorWallHeight = 96;
//([position],scale,angle,[length, width, height])
//kitchenOne([[553,0,0],180]);
downstairs();
//upstairs();
//kitchen([[5,  bin(barn);53,0,0],270]);
//barnAndWindows();
//allGables();
//roof([barnLength + 50, barnWidth,barnHeight,gableHeight,wallThickness,barnLength+20]);
//bathroom1();
// beams 16
// upstairs ceiling height 96
// downstairs ceiling height 108


//translate([100,-100,124])
//  rotate([0,0,90])
//  upstairs();


//translate([600,-100,124])
//  rotate([0,0,90])
//  upstairs();
  //Desk([[17+55,47,0],0,61,25.5, 25.5, 2, 3, 1]);


module downstairs(){
  briarmanorKitchen([[132,-65,0],90,FirstFloorWallHeight]);
  briarmanorHall([[132,-65,0],90,FirstFloorWallHeight]);


}
module upstairs(){
  bathroom2([[132,-65,0],90,SecondFloorWallHeight]);
  bathroomMaster([[0,0,0],0,SecondFloorWallHeight]);
  closetMaster([[112+5,-2,0],0,SecondFloorWallHeight]);
  bedroomMaster([[5,113,0],180,SecondFloorWallHeight]);
  bedroom1([[127,-156,0],0,SecondFloorWallHeight]);
  closet1([[127,-151,0],270,SecondFloorWallHeight]);
  bedroom2([[127,-369.5,0],0,SecondFloorWallHeight]);
  closet2([[280,-221.5,0],90,SecondFloorWallHeight]);
  bedroom3([[-25,-369.5,0],0,SecondFloorWallHeight]);
  loft([[-25,-369.5,0],0,SecondFloorWallHeight]);
}


//Chair(seatWidth, seatDepth, seatThickness, backHeight, backwidth, legWidth, legHeight, legOffset){
//Chair([[0,0,0],0,30, 30, 5, 35, 3, 3, 30, 1]);
//Chair(30, 30, 5, 35, 3, 3, 30, 1);

//dimensions = in[2];
//Chair(seatWidth, seatDepth, seatThickness, backHeight, legWidth, legHeight, legOffset)
module barnAndWindows(){
  difference(){
    bin(barn);
    allWindows();
  }
}
module briarmanorHall(in){
  position = in[0];           
  angle = in[1];
  wallH = in[2];
  width = 20;
  length = 60;

  translate(position)
    rotate([0,0,angle]){


  livingWall = [[267.5,176.5,0],90,[5,116.5,wallH]];
  doorWall = [[267-4.5,176.5+5,0],0,[5,37,wallH],[30,81],3.75];
  bathWall = [[267.5,176.5+37+5,0],90,[5,158+5,wallH],[30,81],29.5+5];
  stairsWall = [[99.5+5,176.5+37+5,0],0,[5,108,wallH]];
  insideStairsWall = [[99.5+5+42,176.5+37+5,0],0,[5,230,wallH]];
  

  wall(livingWall);
  wallAndDoor(doorWall);
  wall(stairsWall);
  wall(insideStairsWall);
  doorToBasement = [[267.5-5-117,176.0+37+5,0],90,[6,30,81]];
  difference(){ 
    wallAndDoor(bathWall);
    box(doorToBasement);
    }
  room([[121.5,378.5,0],0,[width,length,wallH],5,[60,81],0]);

  }
}




module briarmanorKitchen(in){
  position = in[0];           
  angle = in[1];
  wallH = in[2];
  width = 176.5;
  length = 472;

  translate(position)
    rotate([0,0,angle]){

      doorToPatio = [[-84 + 143.5,0.5,0],270,[6,70,78.5]];
      difference(){ 
        room([[-89,181.5,0],270,[width,length,wallH],5,[104,wallH],235-104]);
        box(doorToPatio);
      }
      counterCup([[0,0,0],55,0,36]);
      SinkDouble([[0,0,0],0,42,2]);
      counterCup([[-30-42,0,],55,0,30]);
      counterCorner([[-84,0,0],270]);
      counterCup([[-84,44+12,0],55,270,44]);
      stove([[-84,56,0],270]);
      cupboard([[-72,56,0 + 60],90,30]);
      counterCup([[-84,120,0],55,270,34]);
      refrigerator([[-25,141.5,0],0,[36,35,70]]);
      counterCup([[-84 + 150 -34 + 13,176.5,0],55,180,34]);
      island([[1-19,75+35,0],270,[50,36,37]]);
      Table([[17+55,47,0],0,42, 94, 5, 4, 36, 1]);
      Table([[129.5 + 48,20,0],0,18, 20, 3, 1.5, 19, 1]);
      Couch([[291,17,0],0,95]);
      Table([[129.5 + 48 + 95 + 20,20,0],0,18, 20, 3, 1.5, 19, 1]);
      Couch([[360,30,0],20,37]);
      flatScreen = [[227.5 + 77,width -4,32],90,[3.5,76.5,44]];
      color("gray")
          box(flatScreen);


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


module bathroom1(){
 //     pos     a  inside rm  wl  door  pos 
  floorHeight = 6;
  room([[0,0,floorHeight],0,[42,93,108],5,[30,81],26]);
  Toilet([[34,93+5-3,floorHeight],180]);
  Sink([[44,5,floorHeight],0,36]);
}

module bathroom2(in){
  position = in[0];           
  angle = in[1];
  wallH = in[2];
  width = 58;
  length = 122;

  translate(position)
    rotate([0,0,angle]){
      room([[0,0,0],0,[width,length,wallH],5,[30,81],4]);
      Toilet([[width+5,60+5+7,0],90]);
      SinkDouble([[width+5,60+5,0],90,60,8]);
      Tub([[width+5,122+5,0],180,[58,29.5,15]]);
  }
}




module bedroomMaster(in){
  position = in[0];           
  angle = in[1];
  wallH = in[2];
  width = 173;
  length = 231.75;

  translate(position)
    rotate([0,0,angle]){
      difference(){ 
        room([[0,0,0],0,[width,length,wallH],5,[30,81],47.5]);
        wall([[-0.5,length-30+5-24.5,0],0,[6,30,81]]);
      }

      BedKing([[60,7,0],0]);
//pos an Width Depth seatThickness backHeight backWidth legWidth legHeight legOffset
      Dresser = [[120,235,0],180,59.5,16.5, 44.5, 24, 2.5, 3, 0, 1];
        Thing(Dresser);
      NightStand = [[23,7,0],0,24,18.5, 29.5, 0, 2.5, 3, 0, 1];
        Thing(NightStand);
      mikesNightStand = [[150,7,0],0,24,18.5, 29.5, 0, 2.5, 3, 0, 1];
        Thing(mikesNightStand);

  } 
}
module bathroomMaster(in){
  position = in[0];           
  angle = in[1];
  wallH = in[2];
  width = 103;
  length = 112;

  translate(position)
    rotate([0,0,angle]){
      difference(){ 
        room([[0,0,0],0,[length,width,wallH],5,[30,81],25.5]);
        wall([[length+4.5,25.5+5,0],0,[6,30,81]]);
      }
      Toilet([[60+5+17,5+3,0],0]);
      SinkDouble([[60+5,5,0],0,60,8]);
      Tub([[5,width+5-41.5,0],0,[59,41.5,15]]);
      wall([[59+5,width-44+5,0],0,[7,44,wallH]]);

  }
}
module closetMaster(in){
  position = in[0];           
  angle = in[1];
  wallH = in[2];
  width = 105;
  length = 152;

  translate(position)
    rotate([0,0,angle]){
      room([[0,0,0],0,[length,width,wallH],5,[30,81],27.5]);
    Dresser = [[155,45,0],90,25,16.5, 49.5, 0, 2.5, 3, 0, 1];
      Thing(Dresser);
    }
}


module bedroom1(in){
  position = in[0];           
  angle = in[1];
  wallH = in[2];
  width = 143;
  length = 149;

  translate(position)
    rotate([0,0,angle]){
      difference(){ 
        room([[0,0,0],0,[width,length,wallH],5,[30,81],3.5]);
        wall([[5+36,5.5,0],270,[6,30,81]]);


      }
      BedTwin([[110,152,0],180]);

//pos an Width Depth seatThickness backHeight backWidth legWidth legHeight legOffset
      Dresser = [[80,7,0],0,63,19.5, 34, 0, 2.5, 3,3, 1];
        Thing(Dresser);
      Dresser2 = [[25,110,0],90,42.5,19.5, 48, 0, 2.5, 3,3, 1];
        Thing(Dresser2);
      NightStand = [[120,134,0],0,21,15, 22, 0, 2.5, 3, 3, 1];
        Thing(NightStand);
      Desk([[35,45,0],90,61,25.5, 25.5, 17, 17, 2, 3, 1]);

  } 
}
module closet1(in){
  position = in[0];           
  angle = in[1];
  wallH = in[2];
  width = 60.5;
  length = 69.5;

  translate(position)
    rotate([0,0,angle])
      room([[0,0,0],0,[width,length,wallH],5,[30,81],36]);
}


module bedroom2(in){
  position = in[0];           
  angle = in[1];
  wallH = in[2];
  width = 143;
  length = 143;

  translate(position)
    rotate([0,0,angle]){
      difference(){ 
        room([[0,0,0],0,[width,length,wallH],5,[30,81],143-30-3.5]);
        wall([[width-25-35.5,length + 5 + 5.5,0],270,[6,30,81]]);
      }

      BedTwin([[147,73,0],90]);

      //pos an Width Depth seatThickness backHeight backWidth legWidth legHeight legOffset
      Dresser = [[60,7,0],0,42,19.5, 34, 0, 2.5, 3,3, 1];
        Thing(Dresser);
      backDresser = [[103,7,0],0,42,19.5, 48, 0, 2.5, 3,3, 1];
        Thing(backDresser);
      NightStand = [[145,124,0],90,21,15, 22, 0, 2.5, 3, 3, 1];
        Thing(NightStand);
      //position, angle, topW, topD, modThick, modW1, modW2 legW, legH, legOffset
      Desk([[35,27,0],90,61,25.5, 25.5, 17, 17, 2, 3, 1]);

  } 
}
module closet2(in){
  position = in[0];           
  angle = in[1];
  wallH = in[2];
  width = 60.5;
  length = 69.5;

  translate(position)
    rotate([0,0,angle])
      room([[0,0,0],0,[width,length,wallH],5,[30,81],36]);
}

module bedroom3(in){
  position = in[0];           
  angle = in[1];
  wallH = in[2];
  width = 143;
  length = 143;

  translate(position)
    rotate([0,0,angle]){

  closetWall = [[-41.5-5,203+5,0],90,[5,96.5+10,wallH],[60,81],18.5+5];
  windowWall = [[-143-5,203+5,0],180,[5,203,wallH],[83.5,wallH],94];
  doorWall = [[0,189+5,0],180,[5,189,wallH],[30,81],3.5];
  backWall = [[0,0,0],90,[5,143+10,wallH]];
  miniWall = [[0,189+5,0],90,[5,46.5,wallH]];
  miniWall2 = [[-51.5,189+5,0],0,[5,18.5,wallH]];
  window = [[-148,119,0],180,[6,83.5,wallH],5,[83.5,wallH],0];
  closet = [[-46.5,208,0],90,[27.5,96.5,wallH],5,[60,81],18.5];
  

  wall(backWall);
  wallAndDoor(doorWall);
  wallAndDoor(windowWall);
  wallAndDoor(closetWall);
  wall(miniWall);
  wall(miniWall2);
  room(window);
  room(closet);

  BedQueen([[-100,7,0],0]);
  //pos an Width Depth seatThickness backHeight backWidth legWidth legHeight legOffset
  nightStand = [[-31,9,0],0,24,18.5, 26.5, 0, 2.5, 3, 3, 1];
    Thing(nightStand);


  }
}


module loft(in){
  position = in[0];           
  angle = in[1];
  wallH = in[2];
  width = 143;
  length = 143;

  translate(position)
    rotate([0,0,angle]){

  
  loftWall = [[152,0,0],90,[5,152,wallH]];
    wall(loftWall);
  endTable = [[18,7,0],90,21,15, 22, 0, 2.5, 3, 3, 1];
    Thing(endTable);
  endTableDoor = [[18,120,0],90,21,15, 22, 0, 2.5, 3, 3, 1];
    Thing(endTableDoor);

   //position, angle, topW, topD, modThick, modW1, modW2 legW, legH, legOffset
  Desk([[150,47,0],90,58,15.5, 28, 17.5, 17.5, 2, 0, 1]);

  Couch([[15,33,0],270,84]);
 
  flatScreen = [[140,47,32],0,[3,57.5,35]];
    box(flatScreen);

  }
}





module closet3(in){
  position = in[0];           
  angle = in[1];
  wallH = in[2];
  width = 60.5;
  length = 69.5;

  translate(position)
    rotate([0,0,angle])
      room([[0,0,0],0,[width,length,wallH],5,[30,81],38]);
}


module wallAndDoor(in){
  position = in[0];           
  angle = in[1];
  wall = in[2];
  door = in[3];
  doorPosition = in[4];
  translate(position)
    rotate([0,0,angle])
      difference(){
        cube(wall); 
        translate([-0.5,doorPosition,0])
          cube([wall[0]+1,door[0],door[1]]); 
        }
}

module wall(in){
  position = in[0];           
  angle = in[1];
  wall = in[2];
  color("Wheat")
  translate(position)
    rotate([0,0,angle])
      cube(wall); 
}


module room(in){
  position = in[0];           
  angle = in[1];
  insideDim = in[2];
  wallThick = in[3];
  door = in[4];
  doorPosition = in[5];
  outsideDim = [insideDim[0]+2*wallThick,insideDim[1]+2*wallThick,insideDim[2]];
 
  color("Wheat")
  translate(position)
    rotate([0,0,angle])
      difference(){
        cube(outsideDim); {
          translate([wallThick,wallThick,-1])
            cube([insideDim[0],insideDim[1],insideDim[2]+2]); 
        translate([-1,doorPosition + wallThick,0])
          cube([wallThick+2,door[0],door[1]]); 
          }
      }
}





module kitchen(in){
  position = in[0];           
  a = in[1];  //angle

  translate(position){
    rotate([0,0,a]){
//  lamp(70,20,50)Stirling PDF app;
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
;
module kitchenOne(in){
  position = in[0];           
  a = in[1];  //angle
  translate(position){
    rotate([0,0,a]){
       counterCup([[0,0,wallThickness],55,0,36]);

       SinkDouble([[0,0,wallThickness],0,42,2]);
       counterCup([[-42-30,0,wallThickness],55,0,30]);
       counterCup([[-42-30-44,0,wallThickness],55,0,44]);
       stove([[-42-30-44,0,wallThickness],0]);
       cupboard([[-42-30-44-30,0,wallThickness + 60],0,30]);
       counterCup([[-42-30-44-30-34,0,wallThickness],55,0,34]);
       counterCup([[-42-30-44-30-34-34,0,wallThickness],55,0,34]);
       refrigerator([[-42-30-44-30-34-34-36,0,wallThickness],0,[36,35,70]]);
       kimsIsland = [[-155,27+40,wallThickness],0,[60,48,37]];
       brairmanorIsland = [[-155,27+40,wallThickness],0,[50,36,37]];
       island(kimsIsland);
       Table([[27,26+54,0],90,42, 94, 5, 4, 36, 1]);
        Couch([[-150,233,0],180,95]);
        Couch([[-250,233,0],180,37]);

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
//Barn length 83', width 50', garage length 39', 
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

harborfreightXY = ([560,490]); //w
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



