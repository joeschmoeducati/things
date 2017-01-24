

difference() {
    cube([22,14,15], true);
    for(i=[-1,1]) {
        translate([1,i*2.5,0]) {
            cube([5,1.6,15], true);
        }
    }
    for(i=[-1,1]) {
        translate([1,i*3.75,-4.5]) {
            cube([5,4.5,10], true);
        }
    }
}

translate([7,0,12]) {
    cube([3,8,10], true);
}

