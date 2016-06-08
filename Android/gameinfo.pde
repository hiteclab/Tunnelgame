void gameinfo(){
// Draw points area -----------------------

fill(0,210);
rect(width/2,0,width*2,75);
  fill(255,100);
/*
text("Meteoros:",10,30);
text(meteoros,170,30);
text("Hits:",300,30);
text(hits,400,30);
text("Level:",500,30);
text(level, 600,30);
text(missed, 700,30);
*/

text("Meteoros:"+meteoros,width*0.02,posytxt);
text("Hits:"+hits,width*0.305,posytxt);
text("Level:"+level, width*0.48,posytxt);
text("Missed:"+missed, width*0.6705,posytxt);


  //text("x: " + nfp(accelerometerX, 1, 3) + "\n" + "y: " + nfp(accelerometerY, 1, 3), width/2, height/2);
    
      //text("playerX: " + playerX + "\n" +"playerY: " + playerY, width/2+40, height/2+80);

// End points area --------------------------

}
