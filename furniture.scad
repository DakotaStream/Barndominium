numberOfFaces = 20;


module Chair(seatWidth, seatDepth, seatThickness, backHeight, legWidth, legHeight, legOffset){
  //Seat portion is just a table, so just use Table to build it.
  Table(seatWidth, seatDepth, seatThickness, legWidth, legHeight, legOffset);
 
  //Chair Back
  translate([0, 0, legHeight + seatThickness])
    cube([seatWidth, seatThickness, backHeight]);
}


module Table(topWidth, topDepth, topThickness, legWidth, legHeight, legOffset){
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