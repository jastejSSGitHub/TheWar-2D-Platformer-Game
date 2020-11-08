class Pickup{
 PVector pos;
 boolean alive=true;
 int radius= 20;

 
 
 int timeOfInit = 0;
  int delay = 2000; //2 seconds delay for displaying level number
  
 Pickup(int x, int y){
   pos= new PVector (x,y);
 }
 
 void drawPickup(){
   pushMatrix();
   stroke(0);
   strokeWeight(3);
   fill(skyblue);
     translate(pos.x, pos.y);
     ellipse(0,0, radius*2, radius*2);
     fill(orange);
     ellipse(0,0, radius, radius);
     
       
        textFont(myfont,30);
        fill(0);
        strokeWeight(2);
        text("TURBO 3 SECONDS!", 30,120);
        
   popMatrix();
   
   updatePickup();
 }
 
  void drawGenCoin(){
   pushMatrix();
   stroke(0);
   strokeWeight(0.7);
     translate(pos.x, pos.y);
     fill(210,105,30);
     ellipse(0,0, radius/2+10, radius/2+10);
     fill(218,165,32);
     ellipse(0,0, radius/2+5, radius/2+5);

   popMatrix();
   updateGCoinPickup();
   
 }
 
 void updatePickup(){
    if(abs(player.pos.x - pos.x )< player.dim.x/2 + radius && abs(player.pos.y - pos.y )< player.dim.y/2 + radius){  //for checking if it touches
      if(timeOfInit==0)
        timeOfInit=millis();
        
      if(millis()< timeOfInit+ delay ){
        textFont(myfont,35);
         textAlign(CENTER);
         text("Acceleration 3 seconds!  " , width/2, height/4);
      }
     
    
     
      alive= false;
      player.speedPickup();
      player.gCoinPickup();
    }
   
 }
 
  void updateGCoinPickup(){
    if(abs(player.pos.x - pos.x )< player.dim.x/2 + radius && abs(player.pos.y - pos.y )< player.dim.y/2 + radius){  //for checking if it touches
      if(timeOfInit==0)
        timeOfInit=millis();
      alive= false;
      player.gCoinPickup();
    }
   
 }
 
 
 
}