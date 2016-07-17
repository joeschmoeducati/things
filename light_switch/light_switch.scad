use <../boxes.scad>

fudge = 0.1;

slotWidth = 2;
mountHeight = 2;

//roundedBox([27.5, 59, 3], 1.5, true);

translate([5,-33,0]) {
    difference() {
        translate([16.5,33,2]) roundedBox([33, 66, 4], 2, true);
        translate([2.5,3,0]) cube([28, 60, 4]);
    }
    
    // switch
    translate([4,4.5,0]) cube([25, 57, 2]);
    translate([4,4.5,0]) cube([1, 48, 4]);
    translate([28,4.5,0]) cube([1, 48, 4]);
    
    // switch hinge
    translate([4,4.5,0]) cube([25, 2, 4]);
    translate([4,0,3]) cube([25, 6, 1]);
    
    // tabs
    translate([.5,11,3.5]) cube([1, 8, mountHeight]);
    translate([.5,47,3.5]) cube([1, 8, mountHeight]);
    translate([31.5,8,3.5]) cube([1, 8, mountHeight]);
    translate([31.5,47,3.5]) cube([1, 8, mountHeight]);
}

translate([-5-35,-53,0]) {
    difference() {
        cube([35, 106, mountHeight]);
        
        // slots
        translate([2-slotWidth/2,30,0]) cube([slotWidth, 10, mountHeight]);
        translate([2-slotWidth/2,66.5,0]) cube([slotWidth, 10, mountHeight]);
        translate([33-slotWidth/2,27,0]) cube([slotWidth, 10, mountHeight]);
        translate([33-slotWidth/2,66.5,0]) cube([slotWidth, 10, mountHeight]);
        
        // rocker travel
        translate([3.5,21,0]) cube([28, 53.5, mountHeight]);
        
        // switch hole
        translate([14,75.5,1]) cube([7, 7, 2]);
        translate([17.5,79,0]) cylinder(h=mountHeight, r=2.5, center=false);
        
        // 85 c2c box screw holes
        translate([15.5,10.5,0]) cylinder(h=mountHeight, r=2.5, center=false);
        translate([19.5,10.5,0]) cylinder(h=mountHeight, r=2.5, center=false);
        translate([15.5,8,0]) cube([4, 5, mountHeight]);
        translate([10.5,6.5,0]) cube([14, 8, 1]);
        translate([15.5,95.5,0]) cylinder(h=mountHeight, r=2.5, center=false);
        translate([19.5,95.5,0]) cylinder(h=mountHeight, r=2.5, center=false);
        translate([15.5,93,0]) cube([4, 5, mountHeight]);
        translate([10.5,91.5,0]) cube([14, 8, 1]);
        
        // 97 c2c faceplate screw holes
        translate([17.5,4.5,0]) cylinder(h=mountHeight, r=1.75, center=false);
        translate([17.5,101.5,0]) cylinder(h=mountHeight, r=1.75, center=false);

        // save plastic
        translate([1,92,1]) cube([8, 13, 2]);
        translate([26,92,1]) cube([8, 13, 2]);
        translate([1,83,1]) cube([33, 8, 2]);
        translate([4,75.5,1]) cube([9, 6.5, 2]);
        translate([22,75.5,1]) cube([9, 6.5, 2]);
        translate([1,15,1]) cube([33, 5, 2]);
        translate([1,1,1]) cube([8, 13, 2]);
        translate([26,1,1]) cube([8, 13, 2]);

    }
}
