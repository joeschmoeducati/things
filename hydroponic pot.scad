
pot_d = 50;
pot_d2 = 40;
pot_h = 25*4;
T = 3;
hole_d = 8;

brim_h = 20;

difference() {
    union() {
        cylinder(pot_h, pot_d/2, pot_d2/2);
        translate([0,0,-brim_h]) cylinder(brim_h, pot_d/2+10, pot_d/2+10);
        translate([0,0,pot_h]) cylinder(15, pot_d2/2, hole_d+T);
    }
    translate([0,0,-T-100]) cylinder(pot_h+100+T, pot_d/2-T, pot_d2/2-T);

    translate([0,0,pot_h]) cylinder(15, pot_d2/2-T, hole_d);
    
    for(d=[0:30:360]) for(h=[0:hole_d:pot_h-10])
    translate([0,0,hole_d+h-2]) rotate([90,0,d+h/hole_d*15])
    cylinder(100, hole_d/2, hole_d/2);
}