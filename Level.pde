
class Level{
  
  color backgroundColor= color(0);
  boolean initialized= false;                                       /////3333333333333333333333//////////////////////////////////
  float finshLine = 0;
  int scoreC=0;
  
  int timeOfInit = 0;
  int delay = 2000; //2 seconds delay for displaying level number
  
  Level(){
    stroke(200);
    strokeWeight(2);
    fill(0);
  }
  
  void drawLevel(){
     background(backgroundColor);   
     
     if(player.pos.x > finshLine ){
        curLevel++;
        if (curLevel == 3) {
          //exit();
          curLevel = 1;
          //gameState = start; 
        }
       
        initialized = false;
        lvlCtrl.resetLevel();
        println(curLevel);
      }


         
      fill(black);
      textFont(myfont,20);
      text("X : "+ (int)player.pos.x,1400, height-800);
      text("Y : "+ (int) abs(height- player.pos.y),1400, height-770);
      textFont(myfont,30);
      text("Coins: " + scoreC,130,200);
      
      
      
         
      pushMatrix();                                                 /////2222222222222222222222222//////////////////////////////////
        translate(-offset.x , offset.y);            /////2222222222222222222222222//////////////////////////////////
      
      if(curLevel==1){
        textFont(myfont,70);
        fill(255);
        stroke(0);
        strokeWeight(3);
        text("GO TO LEVEL 2!", 8300,height-2230);
      }
      if(curLevel==2){
        textFont(myfont,70);
        fill(255);
        stroke(0);
        strokeWeight(3);
        text("KEEP RUNNING!", 3800,-260);
        text("STOP!", 6000,-130);
        textFont(myfont,120);
        text("RUN !!", 9200,-520);
      }
    
        for (int i = 0; i < blocks.size(); i++)
            blocks.get(i).drawMe();
        for (int i = 0; i < lavas.size(); i++)
            lavas.get(i).drawMe();        
        for (int i = pickups.size() - 1 ; i > 0; i--){
            pickups.get(i).drawPickup();
            if(!pickups.get(i).alive){
              pickups.remove(i);
            }
        }
        for (int i = enemyGList.size() - 1 ; i > 0; i--){
            enemyGList.get(i).drawBasicEnemy();
            enemyGList.get(i).update();
            enemyGList.get(i).BasicEHit();
        }
        for (int i = gCoins.size() - 1 ; i > 0; i--){
            gCoins.get(i).drawGenCoin();
            if(!gCoins.get(i).alive){
              gCoins.remove(i);
              scoreC++; 
            }
        }
        
        
        if(boss!=null){
        boss.drawBossEnemy();
        boss.update();
        }
        player.drawCharacter();
        player.update();
        


      popMatrix();                                                  /////2222222222222222222222222////////////////////////////////// 
    displayLvlNumber();
           
        fill(34,177,76); //green health 
        rect(165,75, map(player.health  , 0,100, 0,220),40);
        for (int i = 0; i < headsUpDisplay.size(); i++)
         headsUpDisplay.get(i).drawSwordHUD();
         
         
  }
  
  void displayLvlNumber(){
   
   if(millis()< timeOfInit+ delay ){
     textFont(myfont,50);
     textAlign(CENTER);
     fill(255);
     text("LEVEL " + curLevel+  "!!", width/2, height/4);
     
   }
  }
  
}