

grinder_d = 100;
grinder_h = 4.5;
bracket_inner_w = 104;
bracket_inner_d = 34;
bracket_inner_h = 27;
T = 4;

grinder2_h = 14;
grinder2_top_d = 45;


shoot_w = 25;
shoot_h = 4;
shoot_d = 18;
shoot_oval = .8;


difference() {
    union() {
        cylinder(grinder2_h, bracket_inner_w/2, bracket_inner_w/2);
        //cylinder(grinder_h, bracket_inner_w/2, bracket_inner_w/2);
        
        difference() {
            union() {
                translate([-(grinder_d)/2, -(8)/2, 0])
                cube([grinder_d, 8, bracket_inner_d]);
                translate([-(bracket_inner_w+2*T)/2, -(bracket_inner_h+2*T)/2, 0])
                cube([bracket_inner_w+2*T, bracket_inner_h+2*T, 10]);
            }
            translate([-(bracket_inner_w+2*T)/2, -(bracket_inner_h)/2, 0])
            cube([bracket_inner_w+2*T, bracket_inner_h, 10]);
        }

        translate([0,0,grinder2_h])
        cylinder(bracket_inner_d-grinder2_h, bracket_inner_w/2, grinder2_top_d/2);
        
        // chute
        translate([-(shoot_w+2*T)/2,0,0])
        cube([shoot_w+2*T, shoot_h+grinder_d/2, shoot_d]);
        translate([0,0,shoot_d]) rotate([-90,0,0]) scale([1,shoot_oval,1])
        cylinder(shoot_h+grinder_d/2, shoot_w/2+T, shoot_w/2+T);
    }
    translate([0,0,-1]) cylinder(grinder2_h+1, grinder_d/2, grinder_d/2);
    //translate([0,0,grinder_h+3]) rotate_extrude() translate([grinder_d/2-3,0,0]) circle(4, $fn=20);
    
    // chute hole
    translate([-(shoot_w)/2,0,T])
    cube([shoot_w, shoot_h+10+grinder_d/2, shoot_d-1.5*T]);
    translate([0,0,shoot_d-T/2]) rotate([-90,0,0]) scale([1,shoot_oval*(shoot_w+T)/shoot_w,1])
    intersection() {
        translate([-shoot_w/2,-shoot_w/2,0])
        cube([shoot_w,shoot_w/2,shoot_h+grinder_d/2]);
        cylinder(shoot_h+grinder_d/2, shoot_w/2, shoot_w/2);
    }

    translate([0,0,grinder2_h])
    cylinder(bracket_inner_d-grinder2_h-T, grinder_d/2, grinder2_top_d/2);

    cylinder(100, grinder2_top_d/2, grinder2_top_d/2);
    
    translate([-300,-300,-300])
    cube([600,600,300]);

}