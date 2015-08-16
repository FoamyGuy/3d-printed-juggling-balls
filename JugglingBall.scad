include <polyScrewThread_r1.scad>
$fn=40;

/****************
* Modules
*****************/
module countersink_end(chg,cod,clf,crs,hg)
{
    translate([0,0,-0.1])
    cylinder(h=chg+0.01, 
             r1=cod/2, 
             r2=cod/2-(chg+0.1)*cos(clf)/sin(clf),
             $fn=floor(cod*PI/crs), center=false);
}

/**********
* Variables
***********/
BALL_DIAMETER = 44;
THREAD_HOLE_DIAMETER = 9;
THREAD_HOLE_DEPTH = 16;

ROD_DIAMETER = 7;
ROD_HEIGHT = (THREAD_HOLE_DEPTH * 2) + 1;


/************
* Main Render
*************/
difference(){
    sphere(d=BALL_DIAMETER);
    
    //Cut the floor
    translate([-1*(BALL_DIAMETER/2), 
                -1*(BALL_DIAMETER/2), 
                -1*(BALL_DIAMETER)]){
        cube([BALL_DIAMETER,BALL_DIAMETER,BALL_DIAMETER]);
    }
    
    // Thread hole
    screw_thread(THREAD_HOLE_DIAMETER,4,55,
                 THREAD_HOLE_DEPTH,PI/2,2);
    
    
    countersink_end(4,THREAD_HOLE_DIAMETER,55,0.5,0);
     
    // 1 layer lip to aide removing from build plate.
     difference(){
        cylinder(d=BALL_DIAMETER+2, h=.3);
        cylinder(d=BALL_DIAMETER-1, h=.3);
     }
     
     
     // 1 layer cutouts to aide removing from build plate.
     for(r=[0:(360/6):360]){
        rotate([0,0,r]){
           translate([4,4,0]){
                cube([10,10,.3]);
           }
        }
    }
     
} 


// Threaded Rod Connector
//screw_thread(ROD_DIAMETER,4,55,ROD_HEIGHT,PI/2,2);