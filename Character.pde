class Character extends Player{
  //fields////////////////////////////////////////////////////////////////////
  
  int health = 100;
  
   PImage [] imgFront = new PImage [20];   // create Array of 15 PImages
 PImage [] imgLeft = new PImage [20];   // create Array of 15 PImages
 PImage [] imgRight = new PImage [12];   // create Array of 15 PImages
 PImage [] imgUp = new PImage[20];
 PImage [] curImg = new PImage [20];
 int imageListPeak = 0;
 
  boolean pickedUp=false;     //to test if Accpickup pickuped?
 boolean gPickedUp= false;    //to test if general coiin is picked up
 
 int timeOfPickup=0 , delay= 3000;  //to give acceleration pickup for 3 seconds a.ka 3000 milliseconds
 
 
 float SPEED = 0.5;
 PVector UPFORCE = new PVector (0 , -SPEED*50);   //up
 PVector LEFTFORCE = new PVector (-SPEED , 0);    //left
 PVector RIGHTFORCE = new PVector (SPEED ,0 );    //right
 

 
 int imageListI = 0;                     //imageList Index, to indicate at which point in the list we are
 int timeOfLastFrame = 0;                //remember the value of millis() at the point of the last frame switch
 final int DELAY = int(1000/20);         //= 20 FPS
 final int FW = 0;
 final int LE = 1;
 final int RI = 2;
 int imgState = FW;
 
  
  Character(PVector pos){
    super(pos);
      dim= new PVector (40,67);   //setting x and y parameters of the dimension PVector
 
  for (int i=0; i<imgFront.length; i++){             
    imgFront[i] = new PImage();       //initialize each PImage
    if (i< 10) imgFront[i] = loadImage("front-0000" + i +  "-min" + ".png");    //load the according image. Use i to determine which of the 5 images to load for each one
    if (i>= 10) imgFront[i] = loadImage("front-000" + i + "-min" +".png");    //load the according image. Use i to determine which of the 5 images to load for each one
  }
   for (int i=0; i<imgUp.length; i++){             
    imgUp[i] = new PImage();       //initialize each PImage
    if (i< 10) imgUp[i] = loadImage("up-0000" + i + "-min"+ ".png");    //load the according image. Use i to determine which of the 5 images to load for each one
    if (i>= 10) imgUp[i] = loadImage("up-000" + i + "-min" + ".png");    //load the according image. Use i to determine which of the 5 images to load for each one
  }
  for (int i=0; i<imgLeft.length; i++){             
    imgLeft[i] = new PImage();                      //initialize each PImage
    if (i< 10) imgLeft[i] = loadImage("Left-0000" + i + "-min"  + ".png");    //load the according image. Use i to determine which of the 5 images to load for each one
    if (i>= 10) imgLeft[i] = loadImage("Left-000" + i  +"-min"+ ".png");    //load the according image. Use i to determine which of the 5 images to load for each one
  }
  for (int i=0; i<imgRight.length; i++){             
    imgRight[i] = new PImage();                      //initialize each PImage
    if (i< 10) imgRight[i] = loadImage("right-0000" + i + "-min" + ".png");    //load the according image. Use i to determine which of the 5 images to load for each one
    if (i>= 10) imgRight[i] = loadImage("right-000" + i + "-min"  + ".png");    //load the according image. Use i to determine which of the 5 images to load for each one
  }
  curImg = imgFront;
    

  } //end of constructor 
  
  
  ///////////////////////update()/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  void update(){
    super.update();
    
   if(pos.x > width/2 )offset.x = abs(pos.x- width/2);         //setthing the x paarameter of offset        ///////////////////2222222222222////////////////////////////////// 
   if(pos.y < height/2 )offset.y = abs(height/2- pos.y);       //setting the y vertical parameter of offset ////////////////////222222222222////////////////////////
   
   if(up && !jumping){     //when UP key is pressed, boolean turns 'up' to true
     jump(UPFORCE); 
   }
   if(left) move(LEFTFORCE);   //goLEFT
   if(right) move(RIGHTFORCE); //goRIGHT
   
   if(block != null){          
        if(!block.isOn(player))  //set jumping
        {
         jumping=true; 
        }
    }
    ///////////////////////////////////////////////////////////////////////////////////////
    
    if(millis() < timeOfPickup + delay && pickedUp){    //to give acceleration pickup in round 2
       if(SPEED==0.5){
         SPEED=1.5;
         UPFORCE.set(0 , -SPEED*50);   //up
         LEFTFORCE.set(-SPEED , 0);    //left
         RIGHTFORCE.set(SPEED ,0 );    //right
         
       }
    } else {
      pickedUp=false;
      SPEED=0.5;
      UPFORCE.set(0 , -SPEED*50);   //up
      LEFTFORCE.set(-SPEED , 0);    //left
      RIGHTFORCE.set(SPEED ,0 );    //right
      
    }
    
    
    if(millis() < timeOfPickup  && gPickedUp){    //to give general coin pickup (yellow coins)
       //empty
    } else {
      gPickedUp=false;
    }
    
    if(jumping){
    
     move(DOWNFORCE);                 //move it down by using gravity 
     
     for(int i =0 ; i<blocks.size(); i++){
      Block tempB = blocks.get(i);
      if(tempB.bump(player)){
        
         if(vel.y > 0){
           landOn(tempB); //land on Block
         }
         else{
          fall(); 
         }
      }
     } 
     
     
     for(int i =0 ; i<lavas.size(); i++){
      Lava tempL = lavas.get(i);
      if(tempL.bump(player)){
        lvlCtrl.resetLevel();        //reset it first before every level
       lvlCtrl.initializeLv1();
       lvlCtrl.initializeLv2();
       
       gameState=gameOver;
      }
     } 
    }
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    void decreaseHealth (int amount) {                                            
    if (millis() - lastHealthDecrease > 500) {
      health -= amount;
      lastHealthDecrease = millis();
      redFlashHUD = millis();
      
    }
    
    if (health < 0) gameState=gameOver; 
  }
  

////////////////////////////////////////////////////// drawCharacter()////draws our main player
 void drawCharacter(){
    pushMatrix();
      fill(0);
        translate(pos.x, pos.y);
        //oellipse(0, 0, dim.x, dim.y);
        
        
        if (left) {
          imageListPeak=20;
          curImg= imgLeft ;
          
        } else if (right) {
          imageListPeak=12;
          curImg= imgRight;
        } else if (up) {
          imageListPeak=20;
          curImg= imgUp;
        } 
          else {
            imageListPeak=20;
          curImg= imgFront;
        }
        
        if (millis() > timeOfLastFrame + DELAY){                   
          timeOfLastFrame = millis();
          imageListI++;  
        }
        if (imageListI > imageListPeak -1) imageListI = 0;  
    
        
        image(curImg[imageListI], -dim.x/2, -dim.y/2); //draw current image
     
    popMatrix();
 }
 
  
 ///////////////////////////////////////////////////////// PICKED UP Pickup()//////////////////////////////////////////////////////////
  void speedPickup(){   
   if(!pickedUp){
      timeOfPickup=millis();
      pickedUp=true; 
   }
 }
 
   void gCoinPickup(){   
   if(!pickedUp){
      timeOfPickup=millis();
      gPickedUp=true; 
   }
 }
}
    
  
  
  