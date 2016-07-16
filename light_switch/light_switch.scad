use <../boxes.scad>

fudge = 0.1;


//roundedBox([27.5, 59, 3], 1.5, true);

translate([5,-33,0]) {
    difference() {
        translate([16.5,33,2]) roundedBox([33, 66, 4], 2, true);
        translate([2.5,3,0]) cube([28, 60, 4]);
    }
    translate([3,3.5,0]) cube([27, 59, 2]);
    translate([3,3.5,0]) cube([27, 4, 4]);
    translate([3,0,3.5]) cube([27, 7, .5]);
    
    // tabs
    translate([1,10,3.5]) cube([.5, 10, 1.5]);
    translate([1,46,3.5]) cube([.5, 10, 1.5]);
    translate([31.5,10,3.5]) cube([.5, 10, 1.5]);
    translate([31.5,46,3.5]) cube([.5, 10, 1.5]);
}

translate([-5-35,-53,0]) {
//    cube([35, 106, 1]);
    difference() {
        cube([35, 106, 1.5]);
        
        // slots
        translate([1.875,30,0]) cube([.75, 10, 1.5]);
        translate([1.875,66,0]) cube([.75, 10, 1.5]);
        translate([32.375,30,0]) cube([.75, 10, 1.5]);
        translate([32.375,66,0]) cube([.75, 10, 1.5]);
        
        // rocker travel
        translate([3.5,21,0]) cube([28, 50, 2]);
        
        // switch hole
//        translate([15.5,78,0]) cube([4, 4, 2]);
        translate([17.5,79,0]) cylinder(h=2, r=2, center=false);
        
        // 83 c2c
        translate([16.5,11.5,0]) cylinder(h=2, r=2.5, center=false);
        translate([18.5,11.5,0]) cylinder(h=2, r=2.5, center=false);
        translate([16.5,9,0]) cube([2, 5, 2]);
        translate([16.5,94.5,0]) cylinder(h=2, r=2.5, center=false);
        translate([18.5,94.5,0]) cylinder(h=2, r=2.5, center=false);
        translate([16.5,92,0]) cube([2, 5, 2]);
        
        // 97 c2c
        translate([17.5,4.5,0]) cylinder(h=2, r=1.25, center=false);
        translate([17.5,101.5,0]) cylinder(h=2, r=1.25, center=false);
    }
}
