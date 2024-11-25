include <nutsnbolts/cyl_head_bolt.scad>

hose_od = 11;
gap_w = 49;
T=3;

cube_w = gap_w + 2*hose_od + 3*T;
cube_h = hose_od+2*T;
top_trim = 15;

top_wall_w = 21;
lip_depth = 9;

gap = .6;

intersection() {

//translate([29,-15,0]) cube([20,27,cube_h]);

difference() {
    union() {

    // top part
    translate([cube_w/2-T-hose_od,0,cube_h/2])
    intersection() {
        
        translate([0,0,-100])
        cylinder(200, cube_w/2, cube_w/2, $fn=100);

        difference() {
            translate([0,cube_w/4-top_trim/2,0])
            cube([cube_w, cube_w/2-top_trim, cube_h], center=true);
            rotate_extrude(convexity = 10, $fn = 100)
            translate([gap_w/2+hose_od/2+T, 0, 0])
            circle(r = hose_od/2, $fn = 100);
            
            translate([-(gap_w+T)/2,0,-50])
            cube([top_wall_w+31,lip_depth,100]);

        // wheel cutout
        rotate([0,90,0])
        translate([0,0,-5])
        cylinder(14+5,cube_h/2+gap+1,cube_h/2+gap+1);

        }
        
    }

    // outside downpipe
    rotate([90,0,0])
    translate([-hose_od-T,0,0])
    difference() {
        cube([hose_od+T, hose_od+2*T, 25]);
        translate([(hose_od+T)/2,(hose_od+2*T)/2,-1])
        cylinder(100, hose_od/2, hose_od/2);
    }

    // inside downpipe
    rotate([90,0,0])
    translate([cube_w-hose_od-T-hose_od-T,0,0])
    difference() {
        cube([hose_od+T, hose_od+2*T, 9]);
        translate([(hose_od+T)/2,(hose_od+2*T)/2,-1])
        cylinder(100, hose_od/2, hose_od/2);
    }

    // lip capture
    translate([30,0,0])
    difference() {
        translate([0,-2.5*T,0])
        cube([T*4,lip_depth+2.5*T-gap,cube_h]);
        translate([0,-T-.5,-5])
        cube([T*1.5,T+1,cube_h+10]);
        translate([2*T,0,cube_h/2])
        rotate([0,90,0])
        union() {
            cylinder(T+2*gap,cube_h/2+gap,cube_h/2+gap);
            translate([0,-4,T]) cube([30,10,2*T], center=true);
            cylinder(10,7,7);
        }
    }

    //translate([30+2*T+gap,0,cube_h/2]) rotate([0,90,0]) // assembled position
    translate([15,-6,0]) // printed position
    union() {
        
        // knob
        difference() {
            cylinder(T,cube_h/2+gap,cube_h/2+gap);
            for (d=[0:45:360])
            rotate([0,0,d]) translate([cube_h/2+gap,0,-1]) cylinder(T+2,2,2, $fn=14);
        }
        
        // screw
        thread(7-1.5*gap, 16-gap, 3);
        
        
    }

    // nut 
    translate([30+2*T,0,cube_h/2])
    rotate([0,90,0])
    difference() {
        translate([-cube_h/2,-9,2*T+gap])
        cube([cube_h,18,13-T-gap]);
    }


}

// nut hole
translate([30+2*T,0,cube_h/2])
rotate([0,90,0])
thread(7, 17, 3);

}}
