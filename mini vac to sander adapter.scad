id_hose = 29;
od_port = 26;
T = 2;

difference() {
    union() {
        cylinder(20, od_port/2+T, od_port/2+T);
        translate([0,0,20]) cylinder(30, (id_hose+1)/2, (id_hose-1)/2);
    }
    cylinder(50, od_port/2, od_port/2);
}