 //size in mm
height = 450;
width  = 900;
depth  = 150;

//Computing sizes
ExhaustExtHeight = 50;

//material standard sizes
plasticSize1 = 1;
glassSize1   = 5;
plywoodSize1 = 5;
plywoodSize2 = 10;

//Module Part definition
module BackPanel(){
    cube([
        width,
        plywoodSize2, 
        height
    ]);
}

module Pegboard(){
    cube([
        width - plywoodSize2,
        plywoodSize1,
        height-(ExhaustExtHeight*2)
    ]);
}

module SidePanel(){
    cube([
        plywoodSize2,
        depth-plywoodSize2,
        height-plywoodSize2+plywoodSize1,
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
        depth-plywoodSize2-plywoodSize2-plywoodSize1,
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

module FoldingDoor(){
    cube([
        plywoodSize2,
        width/2-plywoodSize2,
        height-plywoodSize2
    ]);
}

module FoldingCelling(){
    cube([
        width,
        height-plywoodSize2,
        plywoodSize2
    ]);
}

module BottonExhaustCover(){
    cube([
        width-(plywoodSize2*2),
        ExhaustExtHeight,
        plywoodSize1
    ]);
}

module SolderingFloor(){
    cube([
        width-(plywoodSize2*2),
        height-ExhaustExtHeight-plywoodSize2,
        plywoodSize1
    ]);
}

module PaintingFloor(){
    cube([
        width-(plywoodSize2*2),
        height-plywoodSize2,
        plasticSize1
    ]);
}

// ----------------
//  Mounting parts
// ----------------

//Fixed Body
    //Backpanel
translate([0,depth,0])
    BackPanel();

    //Pegboard
translate([plywoodSize1,
    depth - plywoodSize2 - (ExhaustExtHeight/2),
    ExhaustExtHeight - plywoodSize1])
    Pegboard();

    //Right Side Panel
translate([0, 
        plywoodSize2 , 
        plywoodSize1])
    SidePanel();

    //Left Side Panel
translate([width-plywoodSize2, 
            plywoodSize2 , 
            plywoodSize1])
    SidePanel();
    
    // Floor Panel
translate([0, 
        plywoodSize2*2+plywoodSize1,
        0])
    FloorPanel();
    
    // Top Panel
translate([0,0,height-plywoodSize2])
    CellingPanel();

// ------------------
//Internals
    //Top Exhaust Bottom Panel
translate([plywoodSize1,
        plywoodSize2+(ExhaustExtHeight/2),
        height-ExhaustExtHeight-plywoodSize1])
    ExhaustInternalPanel();
    
    //Botton Exhaust Top Panel
translate([plywoodSize1,
        (plywoodSize2*2)+(ExhaustExtHeight/2),
        ExhaustExtHeight-(plywoodSize1*2)])
    BottomExhaustTopPanel();
    
// ------------------
//Folding Parts
translate([0,
        -width/2+(plywoodSize2*2),
        0])
    FoldingDoor();

translate([width-plywoodSize2,
        -width/2+(plywoodSize2*2),
        0])
    FoldingDoor();

translate([0,
        plywoodSize2-height,
        height-plywoodSize2])
    FoldingCelling();
    
//FoldingFloor
    //Soldering floor
translate([plywoodSize2,
        plywoodSize2+ExhaustExtHeight/2-height,
        plasticSize1])
    SolderingFloor();
    
    //Soldering botton exhaust cover
translate([plywoodSize2,
        -ExhaustExtHeight/2,
        plasticSize1])
    BottonExhaustCover();
    
    //Painting floor
translate([plywoodSize2,
        ExhaustExtHeight-plywoodSize2
        -plywoodSize1-height,0])
    PaintingFloor();