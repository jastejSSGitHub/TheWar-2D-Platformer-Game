class Lava extends Block {
  
  PImage [] Imgfire = new PImage [4];   // create Array of 4 PImages
  int imageListI = 0;                     //imageList Index, to indicate at which point in the list we are
  
  
  
  int timeOfLastFrame = 0;                //remember the value of millis() at the point of the last frame switch
  final int DELAY = int(1000/60);         //= 4 FPS
  
  Lava(PVector pos, PVector dim){
    super(pos, dim);
    for (int i=0; i<Imgfire.length; i++){             
      Imgfire[i] = new PImage();       //initialize each PImage
      
      if (i< 10) Imgfire[i] = loadImage("fire-0000" + i + "-min"+ ".png");    //load the according image. Use i to determine which of the 5 images to load for each one
      //if (i>= 10) Imgfire[i] = loadImage("front-000" + i + ".png");    //load the according image. Use i to determine which of the 5 images to load for each one
  }
  
  }
  
  void drawMe(){
   
    if (millis() > timeOfLastFrame + DELAY){                   
      timeOfLastFrame = millis();
      imageListI++;  
        if (imageListI > 2) imageListI = 0;  
    }
    noStroke();
   fill(color(200,35,19));
   pushMatrix();
     translate(pos.x, pos.y);
     rect(-dim.x/2 , -dim.y/2 , dim.x , dim .y);
     
     for(int i = 0; i< ((int)dim.x / Imgfire[0].width) ; i++ ){
     //image(Imgfire[imageListI], -dim.x/2 + i*Imgfire[0].width, -dim.y/2); //draw current image
     
     }
   popMatrix();
   
   

        
  }
}