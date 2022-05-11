//size in mm
height = 450;
width  = 900;
depth  = 150;

//material standard sizes
plywoodSize1 = 5;
plywoodSize2 = 10;
plywoodSize3 = 15;

//Computing sizes
ExhaustExtHeight = 50;

//Module Part definition
module BackPanel(){
    cube([
        width - (plywoodSize2*2),
        plywoodSize2, 
        height - plywoodSize1
    ]);
}

module Pegboard(){
    cube([
        width - plywoodSize2,
        plywoodSize1,
        height-(ExhaustExtHeight*2) - (plywoodSize1*2)
    ]);
}

module SidePanel(){
    cube([
        plywoodSize2,
        depth  - plywoodSize2,
        height - plywoodSize1,
    ]);
}

module CellingPanel(){
    cube([
        width,
        depth,
        plywoodSize2
    ]);
}
module FloorPanel(){
    cube([
        width,
        depth-plywoodSize2,
        plywoodSize1
    ]);
}

module ExhaustInternalPanel(){
    cube([
        width - plywoodSize2,
        depth - ExhaustExtHeight - plywoodSize1 - plywoodSize2,
        plywoodSize1
    ]);
}

module BottomExhaustTopPanel(){
    cube([
        width - plywoodSize2,
        depth - ExhaustExtHeight - plywoodSize2*2 - plywoodSize1,
        plywoodSize1
    ]);
}

module BottonExhaustSupport(){
    cube([
        plywoodSize1,
        depth-ExhaustExtHeight - plywoodSize2,
        ExhaustExtHeight - (plywoodSize1*2)
    ]);
}

module TopExhaustEntrance(){
    translate([0,0,height])
        CellingPanel();
    translate([plywoodSize1,plywoodSize2,
        height- ExhaustExtHeight - plywoodSize2 + plywoodSize1])
        ExhaustInternalPanel();
}

module BottonExhaustEntrande(){
    translate([0, plywoodSize2, 0])
        FloorPanel();
    translate([plywoodSize1,
        plywoodSize2*2,
        ExhaustExtHeight])
        BottomExhaustTopPanel();
}
//

//Mounting parts
    //Backpanel
translate([plywoodSize2,
    depth - plywoodSize2,
    plywoodSize1])
    BackPanel();

    //Pegboard
translate([plywoodSize1,
    depth - plywoodSize2 - ExhaustExtHeight,
    ExhaustExtHeight + plywoodSize1])
    Pegboard();

    //Right Side Panel
translate([0, plywoodSize2 , plywoodSize1])
    SidePanel();

    //Left Side Panel
translate([width-plywoodSize2, plywoodSize2 , plywoodSize1])
    SidePanel();

BottonExhaustEntrande();
TopExhaustEntrance();