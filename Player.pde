/////////////////////////////////////////////////////////////                                            ///////////////////////////////////////////////////////////// 
/////////////////////////////////////////////////////////////  THIS IS THE SUPER CLASS (not character)   ///////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////                                            /////////////////////////////////////////////////////////////////


class Player{ 
 PVector pos, vel, dim; 
 boolean jumping = true;    //false as initial , not jumping
 boolean alive ;
  Block block=null;           // a null block object
  
  int health; //initializing health of every player including 
  int lastHealthDecrease;
  int amountBasic =5; //decreases our health by 5 when collided with basic enemy 
  int amountBoss = 15; //decreaaes our health by 10 when hit by Boss
  
 Player(PVector pos){      //constructor for player
  this.pos = pos;
  vel= new PVector();         //going to create an instance 
   
   alive=true;
   health = 100;
   lastHealthDecrease = millis();
 }
 
 void move (PVector acc){
  vel.add(acc); 
 }
 
 void jump(PVector upAcc){
  move(upAcc);
  jumping =true;
 }
 
 ////////////////////////////////////////////////////// update()
 void update(){
   vel.mult(DAMP);
   pos.add(vel);
 }
  ////////////////////////////////////////////////////// landOn (Block)
  void landOn(Block b){
    block = b;
    pos.y = b.pos.y -dim.y/2 - b.dim.y/2; //land the character on the block by setting its position on the block
    jumping= false;
    vel.y=0;
  }
  
  ////////////////////////////////////////////////////// fall()
  void fall(){
   vel.y*=-1; //reversing the velocity
 }
 
   void drawCharacter()            //dummy drawCharacter , draws a placeholder shape
  {
   ellipseMode(CENTER);
   ellipse(0,0,50,50);
   ellipseMode(CORNER);
  }
  
  boolean hitCharacter (Player hit_player) {                               //hitCharacter ()    METHOD
    if((dist (pos.x, 0, hit_player.pos.x, 0) < dim.x/2 + hit_player.dim.x/2) && (dist (0, pos.y, 0, hit_player.pos.y) < dim.y/2 + hit_player.dim.y/2)) {
    println("player is  hit ");
    return true;
    } else {
    return false;
    }
  }
  
void decreaseHealth (int amount) {
  if (millis() - lastHealthDecrease > 500) {
    health -= amount;
    lastHealthDecrease = millis();
  }
  if (health <= 0) alive = false; 
}
  
 
}