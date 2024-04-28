// Kitchen Furnishings

module island(in){
  position = in[0];           //in[0] position
  s = in[1];  //Scale
  a = in[2];  //angle
  size = in[3];  //[length, width, height]
 
  translate(position)
    rotate([0,0,a]){
  cube([size[0]-2, size[1]-11, size[2]-1.75]);
  translate([-1,-1,size[2]-1.75])
    cube([size[0], size[1], 1.75]);
    }
}


module cupboard(in){
  position = in[0];           //in[0] position
  s = in[1];  //Scale
  a = in[2];  //angle
  l = in[3];  //[length
  translate(position)
    rotate([0,0,a])
      cube([l,12,51]);
}

module counterCup(in){
  p = in[0]; //position
  h = in[1];//cupbaard hieght
  s = in[2];//Scale
  r = in[3];//angle
  l = in[4];//length

  translate(p)
    rotate([0,0,r]){
      translate([l,0,0])
        rotate([0,270,0])
          linear_extrude(l){ polygon([[0,0], [0, 21*s], [4.5*s,21*s], [4.5*s,24*s],
          [35.5*s,24*s], [35.5*s,26*s],[36.75*s,26*s],
          [36.75*s,1.5*s], [41*s,1.5*s], [41*s,0*s],
          [0,0]
          ]); } 
      translate([0,0,h])
        cube([l,12,51]);
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

module counterCorner(in){
  r = in[2];
  s = in[1];
  
  rotate([0,0,r]){
    counter([[0,0,wallThickness],1,0,21]);
    counter([[0,21,wallThickness],1,90,21]);
  }
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

module refrigerator(in){
  position = in[0];           //in[0] position
  s = in[1];  //Scale
  a = in[2];  //angle
  size = in[3];  //[length, width, height]
  translate(position)
    rotate([0,0,a])
      cube(size);
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
        translate([19,-20,28])
          linear_extrude(9){ polygon([[0,2*s], [0, 14*s],   [2*s,16*s], [12.5*s,16*s],
          [14.5*s,14*s], [14.5*s,2*s],  [12.5*s,0*s], [2*s,0*s], [0*s,2*s] ]); } 
        translate([2.5,-20,28])
        linear_extrude(9){ polygon([[0,2*s], [0, 14*s],   [2*s,16*s], [12.5*s,16*s],
          [14.5*s,14*s], [14.5*s,2*s],  [12.5*s,0*s], [2*s,0*s], [0*s,2*s] ]); } 
      }
    }
  }
}


