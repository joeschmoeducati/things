
r_sander = 25/2;
r_vac = 31/2;
taper = 1;
thickness = 1.5;

translate([0,0,-10]) {
    difference() {
        cylinder(h = 20, r1 = r_sander+taper+thickness, r2 = r_vac+thickness, center = true);
        cylinder(h = 20, r1 = r_sander+taper, r2 = r_sander, center = true);
    };
}

translate([0,0,10]) {
    difference() {
        cylinder(h = 20, r1 = r_vac+thickness, r2 = r_vac+taper+thickness, center = true);
        cylinder(h = 20, r1 = r_vac, r2 = r_vac+taper, center = true);
    };
}
