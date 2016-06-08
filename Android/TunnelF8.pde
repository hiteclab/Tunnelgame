
import apwidgets.*;  // for play sound
import ketai.net.*; // for check ip
//import ketai.sensors.*; // for acelerometer
//osc libs
import oscP5.*;
import netP5.*;

APMediaPlayer player, backsound, fail;
//KetaiSensor sensor;
//float accelerometerX, accelerometerY;

float angle=0, tam=0, efecto=5, incremento, posobj, posobjy=0, posobj2, posobjy2=0, fillcol=255, hit=0, playerX, playerY, posytxt, txtsize, xosc, yosc, aosc, micosc;
int meteoros, hits, init, objs=1, hit2, level, speed, missed, alphahtl=255, alphalib=255, ipalpha=0, oldrecord, imgsecuence=0, botones=0, bomb;
boolean gameover=false, startmsg=false, newrecord=false, oscmsg=false;
PImage img2, img3, tunnel0, tunnel1, tunnel2, tunnel3, tunnel4, tunnel5, tunnel6;
String ip;
String[] record = new String[1]; // Used to store the game score record from file

OscMessage theOscMessage;

OscP5 oscP5;
//NetAddressList myNetAddressList = new NetAddressList();
NetAddress myRemoteLocation;

/* listeningPort is the port the server is listening for incoming messages */
int myListeningPort = 7771;
/* the broadcast port is the port the clients should listen for incoming messages from the server*/
//int myBroadcastPort = 12000;

//String myConnectPattern = "/game/connect";
//String myDisconnectPattern = "/game/disconnect";

void setup(){
//size(800,600);
  //orientation(LANDSCAPE);
  //frameRate(6);
    oscP5 = new OscP5(this, myListeningPort);
        myRemoteLocation = new NetAddress("192.168.1.255",12000);

  
  inivar(); // inicializa variables
  
  File filecheck = new File(sketchPath,"/record"); // load game score record from file

  // Crea el archivo de puntaje si no existe
  if (filecheck.exists()) {
        println("File exists");
  } else {
        println("File do not exists");
        record[0]="0";
        saveStrings("record", record);
    }
// fin crea archivo

//  carga el puntaje almacenado
  record = loadStrings("record");
    println(record[0]);
// fin carga

println(width);
println(height);

// muestra IP
ip=KetaiNet.getIP();
println(ip);
// fin muestra IP


  //sensor = new KetaiSensor(this);
  //sensor.start();

playerX=width/2;
playerY=height/2;
  tunnel0 = loadImage("0.png");
  tunnel1 = loadImage("1.png");
  tunnel2 = loadImage("2.png");
  tunnel3 = loadImage("3.png");
  tunnel4 = loadImage("4.png");
  tunnel5 = loadImage("5.png");
  tunnel6 = loadImage("6.png");


    img2 = loadImage("logoapp.png");
    img3 = loadImage("logowhite.png");

  imageMode(CENTER);
  rectMode(CENTER);

posobj= random(10,width-10);
posytxt=(height*0.05)-2;
noStroke();
txtsize=(32*height)/552;
println(txtsize);
textSize(txtsize);
//ysize= (width*img3.height)/img3.width;


  backsound = new APMediaPlayer(this); //create new APMediaPlayer
  backsound.setMediaFile("background.mp3");
  backsound.start(); //start play back
  backsound.setLooping(true); //restart playback end reached
  backsound.setVolume(0.7, 0.7); //Set left and right volumes. Range is from 0.0 to 1.0


  player = new APMediaPlayer(this); //create new APMediaPlayer
  player.setMediaFile("impact.mp3");
  player.setVolume(1.0, 1.0); //Set left and right volumes. Range is from 0.0 to 1.0
  
  fail = new APMediaPlayer(this); //create new APMediaPlayer
  fail.setMediaFile("fail.mp3");
  fail.setVolume(0.5, 0.5); //Set left and right volumes. Range is from 0.0 to 1.0
  


  
}
// --------------------------------------


void draw(){
// BEGINNING INTRO ---------------------------  

  if(init==0){ 
intro();

} else 

// BEGINNING GAME OVER

if(missed <= 0){
gameover();
}

// END GAME OVER

// PLAY GAME
else {
  newrecord=false;
  background(0);
  //pushMatrix();
  //translate(playerX,playerY);
  //rotate(-angle+(PI/2));
 
  // SPEED INCREASE -------------------------------------
  
  if(meteoros>5*level) {
    level++;
    speed++;
  }
  
  // SPEED INCREASE --------------------------------------
  
 // HIT Lights --------------------------------
  if(hit>0){
    background(255); 
    hit--;
    //meteoros++;
    //posobjy=0;
    //posobj= random(10,790);
  }
  
    if(hit2>0){
    background(255); 
    hit2--;
    //meteoros++;
    //posobjy=0;
    //posobj= random(10,790);
  }

 // END HIT Lights --------------------------------
 
  if(angle<360)angle++; else angle=0;
    if(tam<(200-incremento))tam=tam+incremento; else tam=0;
//for(int i=0;i<100;i=i+200)
  //tunnel = loadImage(imgsecuence+".png");
switch(imgsecuence) {
case 0:
  image(tunnel0,playerX,playerY,tam,tam);
  ///*
    //image(img,efecto,efecto,tam+100,tam+100);  
    image(tunnel0,playerX,playerY,tam+200,tam+200);
    image(tunnel0,playerX,playerY,tam+400,tam+400);
    image(tunnel0,playerX,playerY,tam+600,tam+600);
        image(tunnel0,playerX,playerY,tam+800,tam+800);
            image(tunnel0,playerX,playerY,tam+1000,tam+1000);
                        image(tunnel0,playerX,playerY,tam+1200,tam+1200);
                        image(tunnel0,playerX,playerY,tam+1400,tam+1400);
                        image(tunnel0,playerX,playerY,tam+1600,tam+1600);
                        break;
case 1:
  image(tunnel1,playerX,playerY,tam,tam);
  ///*
    //image(img,efecto,efecto,tam+100,tam+100);  
    image(tunnel1,playerX,playerY,tam+200,tam+200);
    image(tunnel1,playerX,playerY,tam+400,tam+400);
    image(tunnel1,playerX,playerY,tam+600,tam+600);
        image(tunnel1,playerX,playerY,tam+800,tam+800);
            image(tunnel1,playerX,playerY,tam+1000,tam+1000);
                        image(tunnel1,playerX,playerY,tam+1200,tam+1200);
                        image(tunnel1,playerX,playerY,tam+1400,tam+1400);
                        image(tunnel1,playerX,playerY,tam+1600,tam+1600);
                        break;
case 2:
  image(tunnel2,playerX,playerY,tam,tam);
  ///*
    //image(img,efecto,efecto,tam+100,tam+100);  
    image(tunnel2,playerX,playerY,tam+200,tam+200);
    image(tunnel2,playerX,playerY,tam+400,tam+400);
    image(tunnel2,playerX,playerY,tam+600,tam+600);
        image(tunnel2,playerX,playerY,tam+800,tam+800);
            image(tunnel2,playerX,playerY,tam+1000,tam+1000);
                        image(tunnel2,playerX,playerY,tam+1200,tam+1200);
                        image(tunnel2,playerX,playerY,tam+1400,tam+1400);
                        image(tunnel2,playerX,playerY,tam+1600,tam+1600);
                        break;
case 3:
  image(tunnel3,playerX,playerY,tam,tam);
  ///*
    //image(img,efecto,efecto,tam+100,tam+100);  
    image(tunnel3,playerX,playerY,tam+200,tam+200);
    image(tunnel3,playerX,playerY,tam+400,tam+400);
    image(tunnel3,playerX,playerY,tam+600,tam+600);
        image(tunnel3,playerX,playerY,tam+800,tam+800);
            image(tunnel3,playerX,playerY,tam+1000,tam+1000);
                        image(tunnel3,playerX,playerY,tam+1200,tam+1200);
                        image(tunnel3,playerX,playerY,tam+1400,tam+1400);
                        image(tunnel3,playerX,playerY,tam+1600,tam+1600);
                        break;                        
case 4:
  image(tunnel4,playerX,playerY,tam,tam);
  ///*
    //image(img,efecto,efecto,tam+100,tam+100);  
    image(tunnel4,playerX,playerY,tam+200,tam+200);
    image(tunnel4,playerX,playerY,tam+400,tam+400);
    image(tunnel4,playerX,playerY,tam+600,tam+600);
        image(tunnel4,playerX,playerY,tam+800,tam+800);
            image(tunnel4,playerX,playerY,tam+1000,tam+1000);
                        image(tunnel4,playerX,playerY,tam+1200,tam+1200);
                        image(tunnel4,playerX,playerY,tam+1400,tam+1400);
                        image(tunnel4,playerX,playerY,tam+1600,tam+1600);
                        break;
case 5:
  image(tunnel5,playerX,playerY,tam,tam);
  ///*
    //image(img,efecto,efecto,tam+100,tam+100);  
    image(tunnel5,playerX,playerY,tam+200,tam+200);
    image(tunnel5,playerX,playerY,tam+400,tam+400);
    image(tunnel5,playerX,playerY,tam+600,tam+600);
        image(tunnel5,playerX,playerY,tam+800,tam+800);
            image(tunnel5,playerX,playerY,tam+1000,tam+1000);
                        image(tunnel5,playerX,playerY,tam+1200,tam+1200);
                        image(tunnel5,playerX,playerY,tam+1400,tam+1400);
                        image(tunnel5,playerX,playerY,tam+1600,tam+1600);
                        break;
case 6:
  image(tunnel6,playerX,playerY,tam,tam);
  ///*
    //image(img,efecto,efecto,tam+100,tam+100);  
    image(tunnel6,playerX,playerY,tam+200,tam+200);
    image(tunnel6,playerX,playerY,tam+400,tam+400);
    image(tunnel6,playerX,playerY,tam+600,tam+600);
        image(tunnel6,playerX,playerY,tam+800,tam+800);
            image(tunnel6,playerX,playerY,tam+1000,tam+1000);
                        image(tunnel6,playerX,playerY,tam+1200,tam+1200);
                        image(tunnel6,playerX,playerY,tam+1400,tam+1400);
                        image(tunnel6,playerX,playerY,tam+1600,tam+1600);
                        break;
}

if (bomb>0){
for (int i=bomb; i>0; i--){
  fill(#03FF04);
  rect(10*i,posytxt+20,5,10);
}
}

if (missed>0){
for (int i=missed; i>0; i--){
  fill(#FF030B);
  rect(width-10*i,posytxt+20,5,10);
}
}


if(imgsecuence<6)imgsecuence++; else imgsecuence=0;
//*/

//ellipse(10,10,posobj,posobj);

  //popMatrix();

// draw Metoritos --------------------------------------------

if(posobjy<height){
  fill(#FEFF03);
  rect(posobj, posobjy,20,20);
posobjy=posobjy+speed;
} else {
  meteoros++;
  posobjy=0;
  posobj= random(10,width-20);
  missed--;
  vibra();
  background(255,0,0);
  fail.start();
  }
  
 if (objs>1) 
     if(posobjy2<height){
      fill(#FEFF03);
      rect(posobj2, posobjy2,20,20);
    posobjy2=posobjy2+speed;
    } else {
      meteoros++;
      posobjy2=0;
      posobj2= random(10,width-20);
        missed--;
        vibra();
        background(255,0,0);
        fail.start();
      }

// End Meteoritos -----------------------------------------------------------

// PLAYER PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP

 //if(oscmsg==true) oscdata();

if (playerX>=width-20) playerX=1;
if (playerY>=height-20) playerY=1;


  if(yosc > 1.0) if(playerX<width-20) playerX=playerX+20; 
  if(yosc < -1.0) if(playerX>20) playerX=playerX-20;

///*
  if(xosc > 0.5) if(playerY<height-20) playerY=playerY+20; 
  if(xosc < -0.5) if(playerY>20) playerY=playerY-20;
//*/
  if(micosc>2000)rect(10,10,20,20);

if (playerX<21) playerX=width-21;
if (playerY<21) playerY=height-21;


/*

println("Y: "+accelerometerY+" "+"X: "+accelerometerX);
  if(accelerometerY > 0.2) if(playerX<width-20) playerX=playerX+20; 
  if(accelerometerY < -0.2) if(playerX>20) playerX=playerX-20;

  if(accelerometerX > 0.2) if(playerY<height-20) playerY=playerY+20; 
  if(accelerometerX < -0.2) if(playerY>20) playerY=playerY-20;
*/
  fill(0,0,255,100);
  ellipse(playerX,playerY,40,40);

// PLAYER PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP

  if(botones>0 && bomb>0) {
  background(0,255,0);
    botones=0;
  bomb--;
  println(bomb);
  hit=1;
  hits++;
  objs=2;
  sound();
      meteoros++;
      posobjy=0;
      posobj= random(10,width-20);

  hit2=1;
  hits++;
  sound();
      meteoros++;
      posobjy2=0;
      posobj2= random(10,width-20);

      
}


if(((posobj>playerX-30)&&(posobj<playerX+30))&&((posobjy>playerY-32)&&(posobjy<playerY+30))){ 
  hit=1;
  hits++;
  objs=2;
  sound();
      meteoros++;
      posobjy=0;
      posobj= random(10,width-20);
//fillcol=random(10,255);
  //fill(fillcol,0,0);  
} else if(((posobj2>playerX-30)&&(posobj2<playerX+30))&&((posobjy2>playerY-32)&&(posobjy2<playerY+30))){ 
  hit2=1;
  hits++;
  sound();
      meteoros++;
      posobjy2=0;
      posobj2= random(10,width-20);
//fillcol=random(10,255);
  //fill(fillcol,0,0);  
}

// Draw points area -----------------------

gameinfo();

// End points area --------------------------

}
} // fin draw

void sound(){
              player.pause(); //start playing sound file
      player.seekTo(0); //"rewind"
            player.start(); //start playing sound file

}

void mousePressed(){
  playerX=mouseX;
  playerY=mouseY;
  //init=1;
  if(gameover==true) inivar();
  
}


void keyPressed(){
showcredits();
  /*
if (key == CODED) {
    if (keyCode == UP) {
      posobj++;
    } else if (keyCode == DOWN) {
      posobj--;
    } 
    if (keyCode == LEFT) {
      x1--;
    } else if (keyCode == RIGHT) {
      x1++;
    }  
  } // fin if coded
 */ 
}

/*
void onAccelerometerEvent(float x, float y, float z)
{
  accelerometerX = x;
  accelerometerY = y;
}
*/

public void onDestroy() {
  backsound.setLooping(false); //restart playback end reached

  super.onDestroy(); //call onDestroy on super class
  if(player!=null) { //must be checked because or else crash when return from landscape mode
    player.release(); //release the player

  }
    if(backsound!=null) { //must be checked because or else crash when return from landscape mode
    backsound.release(); //release the player

  }
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  //print("### received an osc message.");
  //print(" addrpattern: "+theOscMessage.addrPattern());
  //println(" typetag: "+theOscMessage.typetag());
  //oscmsg=true;
 //theOscMessage =theOscMessageori;
 //println(theOscMessage); 
 /*
 if(theOscMessage.checkAddrPattern("/x")==true) {
    // check if the typetag is the right one. 
      // parse theOscMessage and extract the values from the osc message arguments. 
      float firstValue = theOscMessage.get(0).floatValue();
    xosc=firstValue;  
      //print("### received an osc message /test with typetag ifs.");
      println(" values x: "+firstValue);
      //return;
      
  } else */

 if(theOscMessage.checkAddrPattern("/x")==true) {
    // check if the typetag is the right one. 
      // parse theOscMessage and extract the values from the osc message arguments. 
      float firstValue2 = theOscMessage.get(0).floatValue(); 
     xosc=firstValue2; 
      //print("### received an osc message /test with typetag ifs.");
      println(" values x: "+firstValue2);
      
     float secondValue2 = theOscMessage.get(1).floatValue(); 
     yosc=secondValue2; 
      //print("### received an osc message /test with typetag ifs.");
      println(" values y: "+secondValue2);

     secondValue2 = theOscMessage.get(2).floatValue(); 
     micosc=secondValue2; 
      //print("### received an osc message /test with typetag ifs.");
      println(" values mic: "+secondValue2);
      
     botones = theOscMessage.get(3).intValue(); 
     //micosc=secondValue2; 
      //print("### received an osc message /test with typetag ifs.");
      println(" values botones: "+botones);
      //return;
      
  }   /*else
  
   if(theOscMessage.checkAddrPattern("/a")==true) {
    // check if the typetag is the right one. 
      // parse theOscMessage and extract the values from the osc message arguments. 
      float firstValue3 = theOscMessage.get(0).floatValue(); 
     aosc=firstValue3; 
      //print("### received an osc message /test with typetag ifs.");
      println(" values a: "+firstValue3);
      //return;
      
  } else
  
  if(theOscMessage.checkAddrPattern("/micin")==true) {
      float firstValue4 = theOscMessage.get(0).floatValue(); 
     micosc=firstValue4;      
     println(" mic: "+firstValue4);
   background(0);
      //return;
      
  } else

 if(theOscMessage.checkAddrPattern("/z")==true) {
     
   background(0);
      //return;
      
  } 
 */ 
}

