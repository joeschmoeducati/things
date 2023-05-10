
rVac = 25/2;
rJointer = 31/2;
taperJointer = 1;
taper = 1;
thickness = 1.5;

translate([0,0,-40]) {
    difference() {
        #cylinder(h = 10, r1 = rVac+, r2 = rJointer, center = true);
        cylinder(h = 10, r1 = rVac+taper, r2 = rVac, center = true);
    };
}

difference() {
    cylinder(h = 60, r1 = rJointer+taperJointer, r2 = rVac+thickness, center = true);
    cylinder(h = 60, r1 = rJointer+taperJointer-thickness, r2 = rVac, center = true);
};

translate([0,0,40]) {
    difference() {
        cylinder(h = 20, r1 = rVac+thickness, r2 = rVac+thickness, center = true);
        cylinder(h = 20, r1 = rVac, r2 = rVac, center = true);
    };
}
translate([0,0,31]) {
    difference() {
        cylinder(h = 2, r1 = rVac+thickness, r2 = rVac+thickness, center = true);
        cylinder(h = 2, r1 = rVac, r2 = rVac-1, center = true);
    };
}
