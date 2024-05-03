// Kitchen Furnishings

module island(in){
  position = in[0];           //in[0] position
  a = in[1];  //angle
  size = in[2];  //[length, width, height]
 
  translate(position)
    rotate([0,0,a]){
      cube([size[0]-2, size[1]-11, size[2]-1.75]);
      translate([-1,-1,size[2]-1.75])
        cube([size[0], size[1], 1.75]);
        }
}



module stove(in){
  r = in[1];
  translate(in[0])
    rotate([0,270,r])
        linear_extrude(30){ polygon([[0,0], [0, 26], [32,26],
        [32,28], [34,28], [34,26], 
        [37,26], [37,4], 
        [48,2],[48,0],[0,0]
        ]); } 
}

module refrigerator(in){
  position = in[0];           //in[0] position
  a = in[1];  //angle
  size = in[2];  //[length, width, height]
  translate(position)
    rotate([0,0,a])
      cube(size);
}


module Sink(in){
  position  = in[0];
  angle = in[1];
  length = in[2];

  translate(position)
    rotate([0,0,angle])
      difference()
      {
        counter([[0,0,0],0,length]);
        {
          rotate([0,0,180])
          {
            translate([length/2-7.25,-20,28])
              linear_extrude(9){ polygon([[0,2], [0, 14],   [2,16], [12.5,16],
              [14.5,14], [14.5,2],  [12.5,0], [2,0], [0,2] ]); } 
          }
        }
      }
}



module SinkDouble(in){
  position  = in[0];
  angle = in[1];
  length = in[2];
  gapBetween = in[3];

  translate(position)
    rotate([0,0,angle])
      difference()
      {
        counter([[0,0,0],0,length]);
        {
          rotate([0,0,180])
          {
            translate([length/2+1+gapBetween,-20,28])
              linear_extrude(9){ polygon([[0,2], [0, 14],   [2,16], [12.5,16],
              [14.5,14], [14.5,2],  [12.5,0], [2,0], [0,2] ]); } 
            translate([length/2-15.75-gapBetween,-20,28])
            linear_extrude(9){ polygon([[0,2], [0, 14],   [2,16], [12.5,16],
              [14.5,14], [14.5,2],  [12.5,0], [2,0], [0,2] ]); } 
          }
        }
      }
}

module counter(in){
  r = in[1];
  l = in[2];
  translate(in[0])
    rotate([0,270,r])
      linear_extrude(l){ polygon([[0,0], [0, 21], [4.5,21], [4.5,24],
      [35.5,24], [35.5,26],[36.75,26],
      [36.75,1.5], [41,1.5], [41,0],
      [0,0]
      ]); } 
}

module cupboard(in){
  position = in[0];           //in[0] position
  a = in[1];  //angle
  l = in[2];  //[length
  translate(position)
    rotate([0,0,a])
      cube([l,12,51]);
}

module counterCup(in){
  p = in[0]; //position
  h = in[1];//cupbaard hieght
  r = in[2];//angle
  l = in[3];//length

  translate(p)
    rotate([0,0,r]){
      translate([l,0,0])
        rotate([0,270,0])
          linear_extrude(l){ polygon([[0,0], [0, 21], [4.5,21], [4.5,24],
          [35.5,24], [35.5,26],[36.75,26],
          [36.75,1.5], [41,1.5], [41,0],
          [0,0]
          ]); } 
      translate([0,0,h])
        cube([l,12,51]);
    }
}


module counterCorner(in){
  position = in[0];           
  angle = in[1];
  
  translate(position)
    rotate([0,0,angle]){
      counter([[0,0,0],0,21]);
      counter([[0,21,0],90,21]);
  }
}


module Toilet(in){
  position = in[0];           
  angle = in[1];
  
  translate(position)
    rotate([0,0,angle]){
      translate([0,0,18])
        cube([18,9,15]); 
      translate([9,18.2,0])
        difference(){
          scale([7,10.5]) 
            cylinder(18,0.6,1,$fn=40);
          {
            translate([0,2.5,6])
              scale([4,6]) 
                cylinder(13,0.6,1,$fn=40);
            translate([0,2.5,0])
              cylinder(18,2,2,$fn=40);  
          }
    }
  }
}


module Tub(in){
  position = in[0];           
  angle = in[1];
  dim = in[2];
  
  translate([0,0,0])
    rotate([0,270,0])
          cylinder(3,2,3,$fn=10); 

  translate(position)
    rotate([0,0,angle]){
      difference(){
        cube(dim); 
         translate([dim[0]/2,dim[1]/2,3])
         scale([dim[0]-3,dim[1]-3])
          cylinder(dim[2],0.5,0.5,$fn=30); 
      }
      }
}

