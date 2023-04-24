hose_od = 15;
wall_w = 40;
T=3;

cube_w = wall_w + 2*hose_od + 3*T;
top_trim = 15;

intersection() {
    
    translate([0,0,-100])
    cylinder(200, cube_w/2, cube_w/2, $fn=100);

    difference() {
        translate([0,cube_w/4-top_trim/2,0])
        cube([cube_w, cube_w/2-top_trim, hose_od+2*T], center=true);
        rotate_extrude(convexity = 10, $fn = 100)
        translate([wall_w/2+hose_od/2+T, 0, 0])
        circle(r = hose_od/2, $fn = 100);
        
        cube([wall_w+T,T*2,100], center=true);
    }
    
}