void intro(){
 if (mousePressed==true) init=1;

      background(0);   
    //img2 = loadImage("logoapp.png");
    //tint(255, alphahtl);
    //println(height+" "+img2.height);
    if(img2.height<height)image(img2,width/2,height/2); else image(img2,width/2,height/2,height*0.8,height*0.8);
    fill(0, alphahtl);
    rect(0,0,width*2,height*2);
    
    if(alphahtl>0)alphahtl=alphahtl-2; else {//alphahtl=255;
              background(0);
              //
              //ysize=img3.width;
              if(img3.width<width)image(img3,width/2,height/2); else image(img3,width/2,height/2,width*0.8,width*0.8);
              fill(0, alphalib);
              rect(0,0,width*2,height*2);
              

              
              if(alphalib>0) {
              alphalib=alphalib-2; 
            

          
        }else {alphahtl=255; alphalib=255; startmsg=true;}


    }
                //println(alphalib+" "+alphahtl); 
                
                                                          //fill(random(50,255),random(50,255),random(50,255),alphahtl);
                   //fill(125, (255-alphahtl)*2);  
                  //if(alphahtl==0) fill(125,alphalib*2);  
              if(ipalpha<250){
                ipalpha=ipalpha+5;
                fill(90, ipalpha);
              //text("IP: "+ip,2,height-10);
              text("Game Licence: GLP3 ",2,height-10);
             } else ipalpha=0;
          //println(ip);
 
              if(startmsg==true){ 
                  fill(0,0,255, 255-alphahtl);  
                  if(alphahtl==0) fill(0,0,255,alphalib);  
                  fill(random(50,255),random(50,255),random(50,255), 255-alphahtl);  
                  //if(alphahtl==0) fill(random(50,255),random(50,255),random(50,255),alphalib);                    
              //text("Haga click en la pantalla para iniciar", width/4-10, height-(height*0.15));
              textAlign(CENTER);
              text("Oprima A o B para iniciar", width/2, height-10);
              textAlign(LEFT);

              //text("Oprima A o B para iniciar", width/3.3, height-10);

              }
   

// END INTRO ----------------------   

 if (mousePressed==true) init=1;
  if(botones>0) {init=1; botones=0;}


}
