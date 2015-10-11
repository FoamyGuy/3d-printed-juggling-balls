include <polyScrewThread_r1.scad>
$fn=40;

/**********
* Variables
***********/
BALL_DIAMETER = 44;
INSERT_DRILL_DIAMETER = 5.556;
INSERT_DRILL_DEPTH = 10;



/****************
* Modules
*****************/
module threaded_insert_cutout(h=INSERT_DRILL_DEPTH){
    cylinder(r=(INSERT_DRILL_DIAMETER/2),h, $fn=30);
}

module countersink_end(chg,cod,clf,crs,hg)
{
    translate([0,0,-0.1])
    cylinder(h=chg+0.01, 
             r1=cod/2, 
             r2=cod/2-(chg+0.1)*cos(clf)/sin(clf),
             $fn=floor(cod*PI/crs), center=false);
}


module peel_off_cutout(){
    
    difference(){
        cylinder(d=BALL_DIAMETER, h=.38);
        cylinder(d=BALL_DIAMETER-3, h=.38);
     }
             
     
    difference(){
        union(){
            for(r=[0:(360/6):360]){
                rotate([0,0,r]){
                   translate([0,0,0]){
                        cube([BALL_DIAMETER/2,2,.38]);
                   }
                }
            }
            
            // buffer around insert
            cylinder(d=INSERT_DRILL_DIAMETER+2, h=.38);
        }

        threaded_insert_cutout(h=INSERT_DRILL_DEPTH);
        
    }
    

     

    
}


/************
* Main Render
*************/
translate([0,0,.38]){
    difference(){
        sphere(d=BALL_DIAMETER);
        
        //Cut the floor
        translate([-1*(BALL_DIAMETER/2), 
                    -1*(BALL_DIAMETER/2), 
                    -1*(BALL_DIAMETER)]){
            cube([BALL_DIAMETER,BALL_DIAMETER,BALL_DIAMETER]);
        }
        
        // Threaded Insert hole
        threaded_insert_cutout(h=INSERT_DRILL_DEPTH);

         
    }
}

peel_off_cutout();



