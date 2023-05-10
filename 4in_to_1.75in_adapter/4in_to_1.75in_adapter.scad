
translate([0,0,-40]) {
    difference() {
        cylinder(h = 20, r1 = 52.3, r2 = 52.1, center = true);
        cylinder(h = 20, r1 = 50.8, r2 = 50.6, center = true);
    };
}

translate([0,0,-49]) {
    difference() {
        cylinder(h = 2, r1 = 54, r2 = 54, center = true);
        cylinder(h = 2, r1 = 51, r2 = 51, center = true);
    };
}

difference() {
    cylinder(h = 60, r1 = 52.1, r2 = 24.0, center = true);
    cylinder(h = 60, r1 = 50.6, r2 = 22.7, center = true);
};

translate([0,0,40]) {
    difference() {
        cylinder(h = 20, r1 = 24, r2 = 24.2, center = true);
        cylinder(h = 20, r1 = 22.5, r2 = 22.7, center = true);
    };
}
translate([0,0,31]) {
    difference() {
        cylinder(h = 2, r1 = 24, r2 = 24, center = true);
        cylinder(h = 2, r1 = 22.5, r2 = 21.5, center = true);
    };
}
