class BasicEnemy extends Player{
 float range = 250; //checks if player is within the range 
 int health= 20;
 int neckUpX= 20;
int torsoUpX=100;
int neckDownX= 100;
int torsoDownX =60;
int thighUpX= 40;
int thighDownX=20;
int calfUpX=20;
int calfDownX= 10;
color zombieGreen= color(164,204,140);
float DAMP=0.8;

 BasicEnemy(PVector pos){
    super(pos); 
    dim= new PVector (40,67);   //setting x and y parameters of the dimension PVector
    
    
 }
 
 void update(){
  super.update(); 
  artificialIntelliG(); // for the General AI for the basic enemy 
  
  if (hitCharacter (player) ) {
    player.decreaseHealth(10); 
    println("Basic hit");
  }
 }
 
 void drawBasicEnemy(){
  pushMatrix();
      fill(0);
        translate(pos.x, pos.y);
        //ellipse(0, 0, dim.x, dim.y);
  popMatrix();
  
  pushMatrix();
    translate(pos.x, pos.y); //pos
    
    if (vel.x > 0) scale(-1,1);                  // mirror
    
    scale(.12, .12);
    scale(.7, .67);
    translate(0, -30);
    
    
    //head 
   noStroke();
    fill(zombieGreen);
    strokeWeight(3);
    ellipse(0, -300, 120,150);
    
    stroke(0);
    fill(0);
    strokeWeight(3);
    ellipse(-38,-320, 25,5);
    
    noStroke();
    
    //neck
    fill(0);
   quad (-neckUpX, -250 ,   neckUpX, -250,    neckDownX, -200, -neckDownX,-200 );
   
       //RArm
    pushMatrix();
    translate(0,-200);
    rotate(radians(map(-sin((float)millis()/200) , -1 , 1 , -45 ,60)));
    fill(0);
    quad(-50, - 00, 50, -00, 20, 240, -20, 240);
    fill(bloodRed);
    ellipse(0,240,70,70); //hand
    popMatrix();
    
     //torso
    fill(brown);
    quad (-torsoUpX, -200 ,   torsoUpX, -200,    torsoDownX, 0, -torsoDownX,0 );
    
    //LArm
    pushMatrix();
    translate(0,-200);
    rotate(radians(map(sin((float)millis()/200) , -1 , 1 , -45 ,60)));
    fill(0);
    quad(-50, - 00, 50, -00, 20, 240, -20, 240);
    fill(bloodRed);
    ellipse(0,240,70,70); //hand
    popMatrix();
    
  
    
    ///////////////////////////////////////////////////foot////////////////////////
     //Lleg
    fill(brown);
    ellipse(0, 0, 120,50); //hip
    fill(zombieGreen);
    pushMatrix();
    fill(brown);
      rotate(radians(map(sin((float)millis()/200) , -1 , 1 , -45 ,45)));
      quad (-thighUpX, 20 ,   thighUpX, 20,    thighDownX, 200, -thighDownX,200 );
      
       fill(0,112,20);
      ellipse(0,200,40,40);  //knee cap
      
      pushMatrix();
         translate(0, 200);
         rotate(radians(map(constrain(sin((float)millis()/200-1.9), -1, 0) , -1 , 0 , -80, 0)));
      
         //calf
         fill(zombieGreen);
        quad (-calfDownX, 200 ,   calfDownX, 200,    calfUpX, 0, -calfUpX,0 );
        
         fill(217,112,20);
        ellipse(0,200,20,20);  //footcap
        
        //foot
        fill(0);
        quad(0, 200 , 0, 240, -100 , 240, -70, 200);
      popMatrix();
    popMatrix();
    
    pushMatrix();
    fill(zombieGreen);
      rotate(radians(map(sin((float)millis()/200-PI) , -1 , 1 , -45 ,45)));
      fill(brown);
      quad (-thighUpX, 20 ,   thighUpX, 20,    thighDownX, 200, -thighDownX,200 );
      
       fill(0,112,20);
      ellipse(0,200,40,40);  //knee cap
      
      pushMatrix();
         translate(0, 200);
         rotate(radians(map(constrain(sin((float)millis()/200-1.9-PI), -1, 0) , -1 , 0 , -80, 0)));
      
         //calf
         fill(zombieGreen);
        quad (-calfDownX, 200 ,   calfDownX, 200,    calfUpX, 0, -calfUpX,0 );
        
         fill(217,112,20);
        ellipse(0,200,20,20);  //footcap
        
        //foot
        fill(0);
        quad(0, 200 , 0, 240, -100 , 240, -70, 200);
      popMatrix();
    popMatrix();
 
  popMatrix();
  
   
 }
 
 void decreaseHealth (int amount) {
    super.decreaseHealth (amount);
    if(!alive) score += 1;
}

 void BasicEHit(){
   if(abs(player.pos.x - pos.x ) < abs(player.dim.x/2 - dim.x/2 )){
     println("Hi");
   }
   
 }
 void artificialIntelliG(){
  if(dist(pos.x , pos.y , player.pos.x , player.pos.y )< range){
    if (pos.x < player.pos.x){ //enemy on left
      move(new PVector(0.2,0));
      vel.mult(DAMP);
    }
    else{
     move(new PVector(-0.2,0));   //enemy on right of player(us) 
     vel.mult(DAMP);
    }
    
  }
   
 }
}