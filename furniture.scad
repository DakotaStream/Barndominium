numberOfFaces = 20;



module BedKing(in){
  position = in[0];           
  angle = in[1];
  translate(position)
    rotate([0,0,angle]){
      bed = [[0,0,0],0,81,93, 22, 35, 3, 3, 5, 1];
      Chair(bed);
  }
}


module BedQueen(in){
  position = in[0];           
  angle = in[1];
  translate(position)
    rotate([0,0,angle]){
      bed = [[0,0,0],0,65,85.5, 22, 35, 3, 3, 5, 1];
      Chair(bed);
  }
}

module BedTwin(in){
  position = in[0];           
  angle = in[1];
  translate(position)
    rotate([0,0,angle]){
      bed = [[0,0,0],0,43,78.5, 22, 35, 3, 3, 5, 1];
      Chair(bed);
  }
}




module Chair(in){
  position = in[0];           
  angle = in[1];
  seatWidth = in[2];
  seatDepth = in[3];
  seatThickness = in[4];
  backHeight = in[5];
  backWidth = in[6];
  legWidth = in[7];
  legHeight = in[8];
  legOffset = in[9];


Table([[0,0,0],0,seatWidth, seatDepth, seatThickness, legWidth, legHeight, legOffset]);




  translate([0, 0, legHeight + seatThickness])
    cube([seatWidth, backWidth, backHeight]);
}



module ChairOld(seatWidth, seatDepth, seatThickness, backHeight, backWidth, legWidth, legHeight, legOffset){
  Table([[0,0,0],0,seatWidth, seatDepth, seatThickness, legWidth, legHeight, legOffset]);
 
  translate([0, 0, legHeight + seatThickness])
    cube([seatWidth, backWidth, backHeight]);
}




module Table(in){
  position = in[0];           
  angle = in[1];
  topWidth = in[2];
  topDepth = in[3];
  topThickness = in[4];
  legWidth = in[5];
  legHeight = in[6];
  legOffset = in[7];
 
  translate(position)
    rotate([0,0,angle]){
      //Table Top
      translate([0, 0, legHeight])
        cube([topWidth, topDepth, topThickness]);

      //Legs
      translate([legOffset, legOffset,0])
        cube([legWidth, legWidth, legHeight]);

      translate([topWidth - legWidth - legOffset, legOffset, 0])
        cube([legWidth, legWidth, legHeight]);

      translate([legOffset, topDepth - legWidth - legOffset, 0])
        cube([legWidth, legWidth, legHeight]);

      translate([topWidth - legWidth -legOffset, topDepth - legWidth -legOffset, 0])
        cube([legWidth, legWidth, legHeight]);    
    }
}


module lamp(h,w,f){
    


    //base
    translate([0,0,h/20])
      cylinder(h/20,w/1.5,w/7,$fn=numberOfFaces);
    cylinder(h/20,w/1.5,w/1.5,$fn=numberOfFaces);

    //neck
    cylinder(h,w/10,w/10,$fn=numberOfFaces);

    //shade
    translate([0,0,h])
        lampShade(h,w,f);
}


module lampShade(h,w,f){
  thin = 20;

  rotate([0,0,45]) 
    bulb(h);
    //Top of shade.
  difference(){
    //translate([0,0,1])
      cylinder(h/2,w,w/2,$fn=f);

    translate([0,0,-1])
      {
        cylinder(h/2,w,w/2,$fn=f);
        cylinder(h,w/2,w/2,$fn=f);
      }
  }

  //Lower bracket that looks like and X.
  difference(){
    cylinder(1,w-1/2,w-1/2,$fn=f);
    {
      translate([w/thin,w/thin,0])
        cube([w,w,1]);
      translate([-w-w/thin,-w-w/thin,0])
        cube([w,w,1]);
      translate([-w-w/thin,w/thin,0])
        cube([w,w,1]);
      translate([w/thin,-w-w/thin,0])
        cube([w,w,1]);
    }
  }
}


module bulb(h){
  f = 20;
  translate([0,0,h/6])
    sphere(r=h/15,$fn=f);
  translate([0,0,h/8])
    sphere(r=h/20,$fn=f);
  cylinder(h/10,h/40,h/40,$fn=f);

  //switch
  translate([0, 0, h/22]) 
    rotate([90,0,0]) {
      cylinder(h/8,h/90,h/90,$fn=f);
      translate([0, 0, h/9.5]) 
        cylinder(h/70,h/37,h/37,$fn=f);
    } 
}
