//size in mm
height = 450;
width  = 900;
depth  = 150;

//Set Explode variable to crate space between parts
Explode = 0;

//material standard sizes
plywoodSize1 = 5;
plywoodSize2 = 10;
plywoodSize3 = 15;

//Computing sizes
ExaustExtHeight = 50;

//outer bounderies
$cube([width,depth, height]);

//Module Part definition
module BackPanel(){
    cube([
        width - (plywoodSize2*2),
        plywoodSize2, 
        height
    ]);
}

module Pegboard(){
    cube([
        width - plywoodSize2,
        plywoodSize1,
        height-(ExaustExtHeight*2)
    ]);
}

module SidePanel(){
    cube([
        plywoodSize2,
        depth  - plywoodSize2,
        height - plywoodSize1,
    ]);
}

module FloorPanel(){
    cube([
        width,
        depth - plywoodSize2,
        plywoodSize1
    ]);
}

module BottonExhaustCelling(){
    cube([
    width - plywoodSize2,
    depth-ExaustExtHeight - plywoodSize1 - plywoodSize2,
    plywoodSize1
    ]);
}

module BottonExhaustEntrande(){
    translate([0, plywoodSize2, 0])
        FloorPanel();
    translate([plywoodSize1,
        plywoodSize2,
        ExaustExtHeight])
        BottonExhaustCelling();
}
//

//Mounting parts
    //Backpanel
translate([plywoodSize2,
    depth - plywoodSize2,
    0])
    BackPanel();

    //Pegboard
translate([plywoodSize1,
    depth - plywoodSize2 - ExaustExtHeight,
    ExaustExtHeight])
    Pegboard();

    //Right Side Panel
translate([0, plywoodSize2 , plywoodSize1])
    SidePanel();

    //Left Side Panel
translate([width-plywoodSize2, plywoodSize2 , plywoodSize1])
    SidePanel();

BottonExhaustEntrande();