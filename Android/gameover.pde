void gameover(){

      background(0); 
      image(img2,width/2,height/2);
      fill(0, 220);
      rect(0,0,width*2,height*2);
   if(gameover==false)  {fail.start(); gameover=true; vibra();}
  
  // FINAL SCORE ----------------------
      /*
      fill(0,210);
      rect(width/2,0,width*2,75);
      fill(0,0,255,100);
      text("Meteoros:",10,30);
      text(meteoros,170,30);
      text("Hits:",300,30);
      text(hits,400,30);
      text("Level:",500,30);
      text(level, 600,30);
      text(missed, 700,30);
      */
      
      fill(0,210);
      rect(width/2,0,width*2,75);
      fill(0,0,255,100);
      
      text("Meteoros:"+meteoros,width*0.02,posytxt);
      text("Hits:"+hits,width*0.305,posytxt);
      text("Level:"+level, width*0.48,posytxt);
      //text("Missed:"+missed, width*0.6705,posytxt);
      
  // FINAL SCORE ----------------------
              textAlign(CENTER);
   
    fill(random(50,255),random(50,255),random(50,255));
    text("TRY AGAIN", width/2, height*0.5);    
    text("GAME OVER", width/2, height*0.4);
    
    // Guarda el archivo con si el puntaje es mayor al anterior
  oldrecord = int(record[0]);
  if( oldrecord < hits){
    newrecord=true;
  record[0]=str(hits);
  saveStrings("record", record);
  record = loadStrings("record");
    println("New record: "+record[0]);}
           fill(0,0,255);
    if(newrecord==true){
  text("CONGRATULATIONS! NEW RECORD: "+record[0],width/2, height*0.9);
  } else text("OLD RECORD: "+record[0],width/2, height*0.9);
// fin guarda

  if(botones>0) {inivar(); botones=0;}
              textAlign(LEFT);

}
