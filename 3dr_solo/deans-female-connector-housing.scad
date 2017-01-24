use <../boxes.scad>

module deansFemaleHousing() {
    outsideHeight = 16;
    outsideWidth = 11;
    openingTop = 7;
    openingTopH = 8;
    openingBottom = 8.5;
    openingBottomH = 8;
    deep = 6;
    tall = 14;

    difference() {
        cube([outsideWidth, outsideHeight, deep], true);
        translate([0,(tall-openingBottomH)/2,0]) {
            roundedBox([openingBottom, openingBottomH, deep], 1, true);
        }
        translate([0,-(tall-openingTopH)/2,0]) {
            roundedBox([openingTop, openingTopH, deep], 1, true);
        }
    }
}

/*
rotate([-90,0,0]) {
    deansFemaleHousing();
} 
//*/