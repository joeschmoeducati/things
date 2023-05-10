r1 = 20/2;
r2 = 21/2;
tl = 20; // taper length
T = 3;

translate([40,-105,110]) rotate([0,-90,0]) import("Male-90.stl", convexity=3);


translate([-6,0,14.7]) rotate([0,90,0])
difference() {
    cylinder(tl, 15, r2+T);
    cylinder(tl+1, r1, r2);
}