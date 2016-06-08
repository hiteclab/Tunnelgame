void vibra(){
  OscMessage myMessage = new OscMessage("/vibra");
  //tilting
  myMessage.add(1); // add an int to the osc message 
  
    oscP5.send(myMessage, myRemoteLocation);

}
