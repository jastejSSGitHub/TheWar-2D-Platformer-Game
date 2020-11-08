////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  ASSIGNMENT 4 FINAL
//  JASTEJ SINGH , 301294753
//
///                                                                       " THE WAR "
//                                                                         
//Created by me , Its a platformer where our Character Alexios (Defender of Mankind) has to fight his way through the Greek devil - The Titan , and his little 
//      warrior minions . Evade through the minions and reach the final level (level 2 ) to kill the titan and save your city from these devils
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//The game is inspired by greek mythology (my favourite), the spartans and games like God of War 
//The image of the destroyed city is taken from the internet link : http://resizing.info/edit.html and merged into an illustrator file where I drew the 
//face of my character and edited the whole image into a pImage

final color brown = color (210,105,30);
final color red = color (255,0,0);
final color skyblue = color (140,239,233);
final color orange = color (255,140,0);
final color mountain = color(213,108,15);
final color black = color(0);       //colors
final color white = color (255);
final color bloodRed = color (220, 0, 0);
final color skin = color (255,173,96);
final color menucolor = color(248,185,105);
final color floorColor = color(202,200,151);
final color Enemycolor = color(122,157,59);
final color yellow = color(255,255,0);


PImage bckgrnd;
PImage dead;
PImage pause;
PImage instructionsImg;

boolean up, left, right;                                                 //for down, using downForce
final float GRAVITY=0.98;
final PVector DOWNFORCE = new PVector (0, GRAVITY);
final float DAMP = 0.95;                                                 //dampening factor
PVector offset= new PVector(0,0);                                        //for moving the screen, side scrolling /////2222222222222222222222222////////////////////////////////// 

int curLevel=1;   
int redFlashHUD=0;
int score=0;

 PFont myfont ;
 boolean KeyPressed=true;
 
 final int start = 0;               //Gamestates 
 final int play = 1;
 final int gameOver=2;
 final int gamePaused =3; //when game paused
 final int instructions = 4;
 int gameState = 0;       //change to start later!!



///////////////////////////////declaring objects/////////////////////////////////////////////////////////////////////////////////////////

Character player;
BasicEnemy enemyG;  //general basic enemy
BossEnemy boss; 
ArrayList <Block> blocks = new ArrayList <Block>();    //make an arrayList of block objects 
ArrayList <Lava> lavas = new ArrayList <Lava>(); 
ArrayList <AccessoryDeisgn> headsUpDisplay = new ArrayList <AccessoryDeisgn>(); 
ArrayList <Pickup> pickups = new ArrayList <Pickup>();  ///////////NEW FEATURE IN LEVEL 2////////////////
ArrayList <Pickup> gCoins = new ArrayList <Pickup>();  //general coins
ArrayList <BasicEnemy> enemyGList = new ArrayList <BasicEnemy>(); //arrayList for basic enemy
//ArrayList <int> totalCoins = new ArrayList <int>();
Level lvl;                   //////////////////33333333333333333333333333333333333333333333333333333333333
LevelControl lvlCtrl;        //////////////////33333333333333333333333333333333333333333333333333333333333


/////////////////////////////Key controls////////////////////////////////////////////////////////////////////////////////////////////

void keyPressed (){
 if(key==CODED){
    if(keyCode == UP) up = true;       //setting booleans to true  
    else if(keyCode == LEFT) left = true;
    else if(keyCode == RIGHT) right = true;
    
    //else if(keyCode == UP && keyCode == RIGHT){
    // up=true;
    // right=true;
    //}
    
 }
}

void keyReleased (){
 if(key==CODED){
    if(keyCode == UP) up = false;       //setting booleans to false  
    else if(keyCode == LEFT) left = false;
    else if(keyCode == RIGHT) right = false;
    
    //else if(keyCode == UP && keyCode == RIGHT){
    // up=false;
    // right=false;
    //}
    
 }
}

void mousePressed () {
  if (mouseY < height/2) up = true;
  if (mouseY > height/2 && mouseX < width/2) left = true; 
  if (mouseY > height/2 && mouseX > width/2) right = true; 
}

void mouseReleased () {
  if (mouseY < height/2) up = false;
  if (mouseY > height/2 && mouseX < width/2) left = false; 
  if (mouseY > height/2 && mouseX > width/2) right = false; 
}

//////////////////////////////setup//////////////////////////////////////////////////////////////////////////////////
void setup(){
  //size(1600,900);
  orientation(LANDSCAPE);
  fullScreen();
  
  //initializing lvl and lvlctrl objects 
  lvl = new Level();                     //////////////////33333333333333333333333333333333333333333333333333333333333
  lvlCtrl = new LevelControl();          //////////////////33333333333333333333333333333333333333333333333333333333333
  
  myfont=loadFont("ScreamReal-48.vlw");
  bckgrnd= new PImage();
  bckgrnd= loadImage("back-min.jpg");
  
  dead= new PImage();
  dead= loadImage("dead-min.jpg");
  
  pause= new PImage();
  pause= loadImage("pause-min.jpg");
  
  instructionsImg=new PImage();
  dead= loadImage("inst.jpg");
}

void draw(){
  
  
  if (gameState == start)
  {
    background(menucolor);
    
    imageMode(CORNER);
  image(bckgrnd, 0, 0, width, height);
 
    
    textFont(myfont,60);
    fill(255);
    stroke(0);
    strokeWeight(3);
    text("Welcome , to the War ", 110,150);
    
    strokeWeight(0);
    textFont(myfont,30);
    text("Your C ity has been taken over by the evil  ", 120,230);
    
    textFont(myfont,35);
    text("TITAN ", 90,290);
    
    textFont(myfont,30);
    text(",who is going to destroy it with  his ", 220,290);
    fill(0);
    
    fill(255);
    textFont(myfont,30);
    text(" army of warrior minions ", 230,350);
    
    strokeWeight(5);
    textFont(myfont,35);
    text("You, the gladiator have to  ", 230,450);
    
    fill(bloodRed);
    textFont(myfont,55);
    text("KILL ", 420,510);
    fill(255);
    textFont(myfont,55);
    text("KILL ", 429,519);
    
    
    fill(255);
    textFont(myfont,35);
    text("To save you planet !! ", 280,570);
    
    //textFont(myfont,25);
    ////text("1. Collect Ammo for Speed in level 2", 30,300);
    //text("Use ",30,420);
    //fill(bloodRed);
    //text("up,down,left,right ",90,420);
    //fill(black);
    //text("to move player ", 410,420);
    
    fill(255);
    rect(110,610 , 500,50);
    fill(bloodRed);
    textFont(myfont,35);
    text("Press Space to play !", 170,650);
    
    if(KeyPressed){
      if(key == ' ' ){
        gameState=play;              //change gamestate to play game
      }
    }
    if(mousePressed) gameState = play;
  }
  
  //if(gameState ==instructions){
  //  imageMode(CORNER);
  //  image(instructionsImg, 0, 0, width, height);
  //  if(key == ' ' ){
  //      gameState=play;              //change gamestate to play game
  //    }
  //}
  
  if(gameState==play)
  {
    checkIfInitializeLevel();
    lvl.drawLevel();
    if(KeyPressed){
      if(key == 'p' || key=='P')
      {
        gameState=gamePaused;
      }
    
  }
  }
  
  if(gameState==gamePaused){
    imageMode(CORNER);
      image(pause, 0, 0, width, height);
      if(key == ' ' ){
        gameState=play;              //change gamestate to play game
      }
  }
  
  if(gameState== gameOver){
      imageMode(CORNER);
      image(dead, 0, 0, width, height);
      if(KeyPressed){
      if(key == ' ' ){
        gameState=play;              //change gamestate to play game
        lvlCtrl.resetLevel();
      }
      if(mousePressed) {
        gameState=play;              //change gamestate to play game
        lvlCtrl.resetLevel();
      }
    }
    if(KeyPressed){
      if(key == 'q' || key=='Q' ){
        //exit();
    }
    
  }
  }
}
  
  
/////////////////////////////////////////////////////////////////////////////general method()///////////////////////////////////////////////////////////

  void checkIfInitializeLevel(){
 
  if(!lvl.initialized){
     if( curLevel == 1){
       lvlCtrl.resetLevel();        //reset it first before every level
       lvlCtrl.initializeLv1();

     }else if (curLevel == 2){
       lvlCtrl.resetLevel();        //reset it first before every level
       lvlCtrl.initializeLv2();
     }
     
     }
  }