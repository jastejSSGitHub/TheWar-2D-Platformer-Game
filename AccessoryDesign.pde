class AccessoryDeisgn {
 PVector pos, dim; 
 PImage ImgHUD = new PImage(); //for the HUD health var 
 //Inspired from my favourite game God of War (for citing purposes)
  
 AccessoryDeisgn(PVector pos, PVector dim){
  this.pos=pos;
  this.dim=dim;            
  
  ImgHUD = new PImage();       //initialize PImage
      
  ImgHUD = loadImage("swordDisplay3" +".png");    //load the according image. Use i to determine which of the 5 images to load for each one

 }
 
 void drawMe(){
   noStroke();
   pushMatrix();
   fill(color(139,69,19,0)); 
     translate(pos.x, pos.y);
     rect(-dim.x/2 , -dim.y/2 , dim.x , dim .y);               //transparent block behind the HUD Sword
     image(ImgHUD, -dim.x/2 , -dim.y/2);                       //draw Swordd image

   popMatrix();
   

  }
  
   void drawSwordHUD(){
   noStroke();
   pushMatrix();
   fill(color(139,69,19,0)); 
     translate(pos.x, pos.y);
     rect(-dim.x/2 , -dim.y/2 , dim.x , dim .y);               //transparent block behind the HUD Sword
     image(ImgHUD, -dim.x/2 , -dim.y/2);                       //draw Swordd image
     
        if (millis() - redFlashHUD < 500) {
      noStroke();
      fill(255, 0, 0, map(millis() - redFlashHUD, 0, 500, 150, 0));
      rect (-250, -100, width, height);
    }

   popMatrix();
   
  }
 
}