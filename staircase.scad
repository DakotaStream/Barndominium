//Model Staircase Generator
//Written by Madam Mim 2016 
//All dimensions in mm unless otherwise stated. Inches are used in ECHO returns for a sanity check of tread and riser sizes to make sure that humans can actually climb it! 

scaleratio=1025.4; //scale ratio. 2mmFS=152 Full size=1
//scaleratio=152; //scale ratio. 2mmFS=152 Full size=1

casewidth=15; //overall staircase width
caseangle=35; //Angle of staircase
caselength=30; //distance along the ground the staircase occupies

riserpresent=1; //set to 1 for risers to be included, 0 to be absent.
risersetback=0.25; //set back of the riser behind the tread edge.

treadwidth=3; //width of the tread timbers
treadthickness=0.5; //how thick the tread is
treads=12; //number of treads
pitch=(caselength-treadwidth)/(treads-2); //calculated distance between treads
sidedepth=3; //Depth of the staircase sides
sidethickness=1; //thickness of the timber of the sides.
riser=(pitch)*tan(caseangle); //height between treads
echo("Prototype Riser Height in inches", riser*scaleratio/25.4); //check riser height makes sense for human feet!
echo("Prototype Tread Pitch in inches", pitch*scaleratio/25.4); //check the space for feet to go makes sense!

//Calculate staircase height and length of side timbers.
caseheight=(caselength*tan(caseangle))+(sidedepth/cos(caseangle));
echo("Height of staircase mm",caseheight);
sidelength=(caselength/cos(caseangle))+(sidedepth*tan(caseangle));

//Place and rotate side timbers and subtract boxes at each end to get vertical ends.
difference()
{
    
    union() //Add two sides together to get one object to subtract from.
    {
        rotate([0,-caseangle,0]) translate([0,-casewidth/2]) cube([sidelength,sidethickness,sidedepth], center=false);

        rotate([0,-caseangle,0]) translate([0,casewidth/2-sidethickness]) cube([sidelength,sidethickness,sidedepth], center=false);
    }
    
    translate([-sidedepth/2,0,0.5*sidedepth/cos(caseangle)]) cube([sidedepth,2*casewidth,sidedepth/cos(caseangle)], center=true);
    
    translate([caselength,-casewidth,caselength*sin(caseangle)]) cube([sidedepth,2*casewidth,2*sidedepth/cos(caseangle)], center=false);
}

//Place the treads
for(t=[0:treads-2])
{
translate([pitch*t,-casewidth/2,t*riser+riser]) cube([treadwidth,casewidth,treadthickness], center=false);
}

//Place the risers
if (riserpresent==1) //check if risers should be included.
{
    for(r=[0:treads-1])
    {
        translate([pitch*r+risersetback,-casewidth/2,r*riser]) cube([treadthickness,casewidth,riser], center=false);
    }
}
