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
      bed = [[0,0,0],0,65,85.5, 22, 30, 3, 3, 5, 1];
      Chair(bed);
  }
}

module BedTwin(in){
  position = in[0];           
  angle = in[1];
  translate(position)
    rotate([0,0,angle]){
      bed = [[0,0,0],0,43,78.5, 15, 22, 3, 3, 7, 1];
      Chair(bed);
  }
}


//pos an Width Depth seatThickness backHeight backWidth legWidth legHeight legOffset

module Thing(in){
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

translate(position)
    rotate([0,0,angle]){
    Table([[0,0,0],0,seatWidth, seatDepth, seatThickness, legWidth, legHeight, legOffset]);

    translate([0, 0, legHeight + seatThickness])
      cube([seatWidth, backWidth, backHeight]);
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



//position, angle, topW, topD, modThick, modW1, modW2 legW, legH, legOffset
module Desk(in){
  position = in[0];           
  angle = in[1];
  topW = in[2];
  topD = in[3];
  modThick = in[4];
  modW1 = in[5]; 
  modW2 = in[6]; 

  legW = in[7];
  legH = in[8];
  legOffset = in[9];

  legSpace = topW - modW1;
  translate(position)
    rotate([0,0,angle]){
      Table([[0,0,0],0,modW1,topD,modThick,legW,legH,legOffset]);
      Table([[legSpace,0,0],0,modW2,topD,modThick,legW,legH,legOffset]);
      top = [[0,0,modThick],0,[topW,topD,3]];
        box(top);
    }
}


module Couch(in){
  position = in[0];           
  angle = in[1];
  length = in[2];
  color("Sienna")

  translate(position)
    rotate([0,270,angle]){
  linear_extrude(4){ polygon([[0,0], [0, 30], [20,30],[20,7],[38,0],[38,-7],[0,0] ]); } 
  translate([0,0,4]) 
  linear_extrude(length - 8){ polygon([[0,0], [0, 30], [17,30],[17,7],[38,0],[38,-7],[0,0] ]);} 
  translate([0,0,length - 4]) 
  linear_extrude(4){ polygon([[0,0], [0, 30], [22,30],[22,7],[38,0],[38,-7],[0,0] ]); } 
  }
}



//position, angle, topWidth, topDepth, topThickness, legWidth, legHeight, legOffset
module Table(in){
  position = in[0];           
  angle = in[1];
  topWidth = in[2];
  topDepth = in[3];
  topThickness = in[4];
  legWidth = in[5];
  legHeight = in[6];
  legOffset = in[7];

  color("SaddleBrown")
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


module box(in){
  position = in[0];           
  angle = in[1];
  wall = in[2];
  translate(position)
    rotate([0,0,angle])
      cube(wall); 
}




//radius = 20;
//angles = [45, 135];
//fn = 24;

module sector(radius, angles, fn = 24) {
    r = radius / cos(180 / fn);
    step = -360 / fn;

    points = concat([[0, 0]],
        [for(a = [angles[0] : step : angles[1] - 360]) 
            [r * cos(a), r * sin(a)]
        ],
        [[r * cos(angles[1]), r * sin(angles[1])]]
    );

    difference() {
        circle(radius, $fn = fn);
        polygon(points);
    }
}

//sector(radius, angles, fn);  
