include <polyScrewThread_r1.scad>

$fn=40;

module countersink_end(chg,cod,clf,crs,hg)
{
    translate([0,0,-0.1])
    cylinder(h=chg+0.01, 
             r1=cod/2, 
             r2=cod/2-(chg+0.1)*cos(clf)/sin(clf),
             $fn=floor(cod*PI/crs), center=false);


}

//module hex_nut(df,hg,sth,clf,cod,crs)
// hex_nut(14,18,4,55,9,0.5);
/*
difference(){
    sphere(d=44);
    translate([-30, -30, -55]){
        cube([60,60,55]);
    }
    
    screw_thread(9,4,55,16,PI/2,2);
    countersink_end(4,9,55,0.5,0);
     
     difference(){
        cylinder(d=46, h=.2);
        cylinder(d=41, h=.2);
     }
} 

*/


//connector
screw_thread(7,4,55,30,PI/2,2);