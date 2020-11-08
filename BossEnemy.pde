class BossEnemy extends BasicEnemy{
 float range= 850; 
 int health = 100;
 
 BossEnemy(PVector pos){
  super( pos);   
  dim= new PVector (200,307);
   
 }
  
  void update(){
    super.update(); 
    artificialIntelliB(); // for the General AI for the basic enemy 
 }
 
 
  void drawBossEnemy(){
  pushMatrix();
      fill(255);
        translate(pos.x, pos.y);
        //ellipse(0, 0, dim.x, dim.y);
  popMatrix();
  
  pushMatrix();
    translate(pos.x, pos.y); //pos
    
    if (vel.x > 0) scale(-1,1);                  // mirror
    
    scale(.60, .60);
    scale(.7, .67);
    translate(0, -30);
    
    
    //head 
   noStroke();
    fill(0);
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
    fill(0);
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
    fill(0);
    ellipse(0, 0, 120,50); //hip
    fill(0);
    pushMatrix();
    fill(0);
      rotate(radians(map(sin((float)millis()/200) , -1 , 1 , -45 ,45)));
      quad (-thighUpX, 20 ,   thighUpX, 20,    thighDownX, 200, -thighDownX,200 );
      
       fill(0);
      ellipse(0,200,40,40);  //knee cap
      
      pushMatrix();
         translate(0, 200);
         rotate(radians(map(constrain(sin((float)millis()/200-1.9), -1, 0) , -1 , 0 , -80, 0)));
      
         //calf
         fill(0);
        quad (-calfDownX, 200 ,   calfDownX, 200,    calfUpX, 0, -calfUpX,0 );
        
         fill(0);
        ellipse(0,200,20,20);  //footcap
        
        //foot
        fill(0);
        quad(0, 200 , 0, 240, -100 , 240, -70, 200);
      popMatrix();
    popMatrix();
    
    pushMatrix();
    fill(0);
      rotate(radians(map(sin((float)millis()/200-PI) , -1 , 1 , -45 ,45)));
      fill(0);
      quad (-thighUpX, 20 ,   thighUpX, 20,    thighDownX, 200, -thighDownX,200 );
      
       fill(0);
      ellipse(0,200,40,40);  //knee cap
      
      pushMatrix();
         translate(0, 200);
         rotate(radians(map(constrain(sin((float)millis()/200-1.9-PI), -1, 0) , -1 , 0 , -80, 0)));
      
         //calf
         fill(0);
        quad (-calfDownX, 200 ,   calfDownX, 200,    calfUpX, 0, -calfUpX,0 );
        
         fill(0);
        ellipse(0,200,20,20);  //footcap
        
        //foot
        fill(0);
        quad(0, 200 , 0, 240, -100 , 240, -70, 200);
      popMatrix();
    popMatrix();
 
  popMatrix();
  
   
 }
 
 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
 
  void artificialIntelliB(){                                      //overwriting basicenemys artificial intelligence method
  if(dist(pos.x , pos.y , player.pos.x , player.pos.y )< range){
    if (pos.x < player.pos.x){ //boss on left
      move(new PVector(0.4,0));
      vel.mult(DAMP);
    }
    else{
     move(new PVector(-0.4,0));   //boss on right of player(us) 
     vel.mult(DAMP);
    }
    
  }
   
 }
  
}