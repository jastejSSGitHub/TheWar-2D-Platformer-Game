class LevelControl{
  
  //fields
  
  ///////////////////////////////////////////////////////////////////////
  
  
  LevelControl(){
    
  }
  
  void initializeLv1(){
      
    //player= new Character(new PVector (20, height/2)); charater at start of game
    
   
    
    
    headsUpDisplay.add( new AccessoryDeisgn( new PVector(250,100), new PVector(400, 100)) );
    lavas.add( new Lava( new PVector(2500,height -40), new PVector(6000, 80)) );
    
    
    
    blocks.add( new Block( new PVector(300,height -160), new PVector(200, 160)) );
    blocks.add( new Block( new PVector(700,height -160), new PVector(200, 160)) );
    blocks.add( new Block( new PVector(1050,height -220), new PVector(200, 280)) );
    blocks.add( new Block( new PVector(1300,height -390), new PVector(200, 40)) );
    blocks.add( new Block( new PVector(1800,height -390), new PVector(400, 40)) );
    blocks.add( new Block( new PVector(1900,height -430), new PVector(200, 40)) );
    blocks.add( new Block( new PVector(2050,height -350), new PVector(200, 50)) );
    blocks.add( new Block( new PVector(2350,height -500), new PVector(200, 40)) );
    blocks.add( new Block( new PVector(1550,height -800), new PVector(400, 40)) );        //Pickup 1
    blocks.add( new Block( new PVector(3050,height -640),   new PVector(1000, 80)) );     //basic enemy 1 fight //also a pickup 2 right above it,create arrow
    blocks.add( new Block( new PVector(2300,height -800),   new PVector(200, 40)) );
    blocks.add( new Block( new PVector(2050,height -960),   new PVector(200, 40)) );
    
    blocks.add( new Block( new PVector(3900,height -735),   new PVector(400, 40)) );  //after basic enemy 1 ,The vertical loop
    blocks.add( new Block( new PVector(4400,height -870),   new PVector(400, 40)) );
    blocks.add( new Block( new PVector(3900,height -1025),   new PVector(400, 40)) );
    blocks.add( new Block( new PVector(4400,height -1160),   new PVector(400, 40)) );
    blocks.add( new Block( new PVector(3900,height -1315),   new PVector(400, 40)) );
    blocks.add( new Block( new PVector(4400,height -1450),   new PVector(400, 40)) );
    blocks.add( new Block( new PVector(3900,height -1605),   new PVector(400, 40)) );
    blocks.add( new Block( new PVector(4400,height -1750),   new PVector(400, 40)) );
    
    blocks.add( new Block( new PVector(2850,height -1520),   new PVector(1200, 40)) );  //basic enemy 2 , reward 2
    
    blocks.add( new Block( new PVector(4900,height -1070),   new PVector(400, 1700)) );//big block
    blocks.add( new Block( new PVector(5900,height -1700),   new PVector(1600, 100)) );
    blocks.add( new Block( new PVector(7000,height -1030),   new PVector(600, 1700)) );
    blocks.add( new Block( new PVector(7550,height -1130),   new PVector(500, 1700)) );
    blocks.add( new Block( new PVector(7950,height -1230),   new PVector(300, 1700)) );
    
    gCoins.add( new Pickup(300,height -120 ));
    gCoins.add( new Pickup(650,height -270 ));
    gCoins.add( new Pickup(750,height -270 ));
    gCoins.add( new Pickup(1040,height -400 ));
    gCoins.add( new Pickup(1300,height -430 ));
    gCoins.add( new Pickup(1420,height -850 ));
    gCoins.add( new Pickup(1890,height -500 ));
    gCoins.add( new Pickup(1700,height -850 ));
    gCoins.add( new Pickup(2300,height -550 ));
    gCoins.add( new Pickup(2400,height -550 ));
    gCoins.add( new Pickup(2050,height -1000 ));
    gCoins.add( new Pickup(2600,height -725 ));
    gCoins.add( new Pickup(3000,height -775 ));
    gCoins.add( new Pickup(3200,height -775 ));
    gCoins.add( new Pickup(2800,height -725 ));
    gCoins.add( new Pickup(3400,height -725 ));
    gCoins.add( new Pickup(3779,height -800 ));
    gCoins.add( new Pickup(4000,height -800 ));
    gCoins.add( new Pickup(4280,height -950 ));
    gCoins.add( new Pickup(4500,height -950 ));
    gCoins.add( new Pickup(3779,height -1375 ));
    gCoins.add( new Pickup(4000,height -1375 ));
    gCoins.add( new Pickup(4789,height -1980 ));
    gCoins.add( new Pickup(4280,height -1500 ));
    gCoins.add( new Pickup(4500,height -1500 ));
    gCoins.add( new Pickup(4280,height -1210 ));
    gCoins.add( new Pickup(4500,height -1210 ));
    gCoins.add( new Pickup(4280,height -1800 ));
    gCoins.add( new Pickup(4500,height -1800 ));
    
    gCoins.add( new Pickup(2300,height -1600 ));
    gCoins.add( new Pickup(2500,height -1700 ));
    gCoins.add( new Pickup(3100,height -1700 ));
    gCoins.add( new Pickup(3300,height -1600 ));
    
    
    gCoins.add( new Pickup(4700,height -1980 ));
    gCoins.add( new Pickup(4900,height -1980 ));
    gCoins.add( new Pickup(5000,height -1980 ));
    gCoins.add( new Pickup(5090,height -1980 ));
    
    gCoins.add( new Pickup(5200,height -1800 ));
    gCoins.add( new Pickup(5400,height -1800 ));
    gCoins.add( new Pickup(5600,height -1800 ));
    gCoins.add( new Pickup(6100,height -1800 ));
    gCoins.add( new Pickup(6300,height -1800 ));
    gCoins.add( new Pickup(6500,height -1800 ));
    gCoins.add( new Pickup(6800,height -2000 ));
    gCoins.add( new Pickup(6900,height -2000 ));
    gCoins.add( new Pickup(7000,height -2000 ));
    gCoins.add( new Pickup(7100,height -2000 ));
    gCoins.add( new Pickup(7200,height -2000 ));
    enemyGList.add( new BasicEnemy(new PVector(1500,height-850) ));
    enemyGList.add( new BasicEnemy(new PVector(1700,height-850) ));
    enemyGList.add( new BasicEnemy(new PVector(1300,height -430) ));
    enemyGList.add( new BasicEnemy(new PVector(2800,height -700) ));
    enemyGList.add( new BasicEnemy(new PVector(3300,height -700) ));
    enemyGList.add( new BasicEnemy(new PVector(4500,height-920) ));
    enemyGList.add( new BasicEnemy(new PVector(3800,height-1075) ));
    enemyGList.add( new BasicEnemy(new PVector(4000,height-1365) ));
    enemyGList.add( new BasicEnemy(new PVector(4000,height-1645) ));
    enemyGList.add( new BasicEnemy(new PVector(2400,height-1575) ));
    enemyGList.add( new BasicEnemy(new PVector(2865,height-1575) ));
    enemyGList.add( new BasicEnemy(new PVector(5500,height-1775) ));
    enemyGList.add( new BasicEnemy(new PVector(5937,height-1775) ));
    enemyGList.add( new BasicEnemy(new PVector(7000,height-1905) ));
    lvl.finshLine=8106;
    lvl.backgroundColor = color (73,129,187);
    
     player= new Character(new PVector (280, height-400));//temp
    lvl.initialized = true;
    lvl.timeOfInit = millis();
  }
  
  
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
    void initializeLv2(){

    player= new Character(new PVector (200,height -300));
    
    headsUpDisplay.add( new AccessoryDeisgn( new PVector(250,100), new PVector(400, 100)) );
    lavas.add( new Lava( new PVector(width*5,height -40), new PVector(width*10, 80)) );
    
    blocks.add( new Block( new PVector(width*2,height -20), new PVector(width*4, 40)) );
    blocks.add( new Block( new PVector(200,height -100), new PVector(200, 120)) );
    gCoins.add( new Pickup(456,height -320 ));
    gCoins.add( new Pickup(456,height -320 ));
    gCoins.add( new Pickup(625,height -320 ));
    
    blocks.add( new Block( new PVector(550,height -160), new PVector(300, 240)) );
    gCoins.add( new Pickup(886,height -680 ));
    gCoins.add( new Pickup(1010,height -680 ));
    
    gCoins.add( new Pickup(886,height -480 ));
    gCoins.add( new Pickup(1010,height -480 ));
    
    gCoins.add( new Pickup(886,height -940 ));
    gCoins.add( new Pickup(1010,height -940 ));
    
    blocks.add( new Block( new PVector(950,height -150), new PVector(300, 420)) );
    blocks.add( new Block( new PVector(1350,height -480), new PVector(300, 40)) );
    blocks.add( new Block( new PVector(950,height -620), new PVector(250, 40)) );
    blocks.add( new Block( new PVector(420,height -740), new PVector(650, 40)) ); //reward
    gCoins.add( new Pickup(152,height -790 ));
    gCoins.add( new Pickup(200,height -790 ));
    gCoins.add( new Pickup(250,height -790 ));
    gCoins.add( new Pickup(300,height -790 ));
    
    //vertical loop
    blocks.add( new Block( new PVector(950,height -890), new PVector(250, 40)) );
    blocks.add( new Block( new PVector(1350,height -750), new PVector(300, 40)) );
    blocks.add( new Block( new PVector(700,height -1125), new PVector(700, 40)) ); //basic enemy and reward
    gCoins.add( new Pickup(400,height -1200 ));
    gCoins.add( new Pickup(450,height -1200 ));
    gCoins.add( new Pickup(500,height -1200 ));
    
    blocks.add( new Block( new PVector(3900,height -1125), new PVector(4600, 40)) );
    blocks.add( new Block( new PVector(6450,height -1280), new PVector(300, 40)) );
    blocks.add( new Block( new PVector(6950,height -1400), new PVector(400, 80)) );
    blocks.add( new Block( new PVector(7290,height -1500), new PVector(400, 40)) );
    pickups.add( new Pickup( 2300,height -1125) );
    pickups.add( new Pickup( 1801,height -1175) );
    
    blocks.add( new Block( new PVector(3700,height -1300), new PVector(3900, 120)) );
    gCoins.add( new Pickup(2400,height -1200 ));
    gCoins.add( new Pickup(2550,height -1200 ));
    gCoins.add( new Pickup(2700,height -1200 ));
    gCoins.add( new Pickup(2850,height -1200 ));
    gCoins.add( new Pickup(3000,height -1200 ));
    gCoins.add( new Pickup(3150,height -1200 ));
    
    gCoins.add( new Pickup(4400,height -1200 ));
    gCoins.add( new Pickup(4550,height -1200 ));
    gCoins.add( new Pickup(4700,height -1200 ));
    gCoins.add( new Pickup(4850,height -1200 ));
    gCoins.add( new Pickup(5000,height -1200 ));
    gCoins.add( new Pickup(5150,height -1200 ));
    
    gCoins.add( new Pickup(6800,height -1500 ));
    gCoins.add( new Pickup(7000,height -1500 ));
    
    gCoins.add( new Pickup(7100,height -1600 ));
    gCoins.add( new Pickup(7200,height -1600 ));
    gCoins.add( new Pickup(7300,height -1600 ));
    gCoins.add( new Pickup(7400,height -1600 ));
    
    gCoins.add( new Pickup(7500,height -1670 ));
    gCoins.add( new Pickup(7600,height -1670 ));
    gCoins.add( new Pickup(7700,height -1670 ));
    gCoins.add( new Pickup(7800,height -1670 ));
    gCoins.add( new Pickup(7900,height -1670 ));
    
    blocks.add( new Block( new PVector(1350,height -1000), new PVector(300, 40)) );
    
    
   
    blocks.add( new Block( new PVector(7700,height -810),   new PVector(400, 1620)) );//big block
    blocks.add( new Block( new PVector(8700,height -1320),   new PVector(1600, 100)) );
   // if(player.pos.x>9000){
    blocks.add( new Block( new PVector(12000,height -810),   new PVector(2500, 40)) );
     gCoins.add( new Pickup(12000,height -870 ));
    gCoins.add( new Pickup(12100,height -870 ));
    gCoins.add( new Pickup(12200,height -870 ));
    gCoins.add( new Pickup(12300,height -870 ));
    gCoins.add( new Pickup(12400,height -870 ));
    gCoins.add( new Pickup(12500,height -870 ));
    gCoins.add( new Pickup(12600,height -870 ));
    gCoins.add( new Pickup(12700,height -870 ));
    gCoins.add( new Pickup(12800,height -870 ));
    gCoins.add( new Pickup(12900,height -870 ));
    gCoins.add( new Pickup(1300,height -870 ));
    gCoins.add( new Pickup(13100,height -870 ));
    gCoins.add( new Pickup(13200,height -870 ));
    
    blocks.add( new Block( new PVector(13800,height -790),   new PVector(500, 40)) );
    
    pickups.add( new Pickup( 8300,height -1370) ); //second pickup
     
    blocks.add( new Block( new PVector(14500,height -70),   new PVector(400, 1700)) );//big block castle
    blocks.add( new Block( new PVector(15500,height -700),   new PVector(1600, 100)) );
    blocks.add( new Block( new PVector(16500,height -30),   new PVector(600, 1700)) );
    gCoins.add( new Pickup(14400,height -970 ));
    gCoins.add( new Pickup(14500,height -970 ));
    gCoins.add( new Pickup(14600,height -970 ));
    gCoins.add( new Pickup(15000,height -900 ));
    gCoins.add( new Pickup(15100,height -900 ));
    gCoins.add( new Pickup(15200,height -900 ));
    gCoins.add( new Pickup(16300,height -930 ));
    gCoins.add( new Pickup(16400,height -930 ));
    gCoins.add( new Pickup(16500,height -930 ));
    gCoins.add( new Pickup(16600,height -930 ));
    gCoins.add( new Pickup(16700,height -930 ));
    
    enemyGList.add( new BasicEnemy(new PVector(1000,height-393) ));
    enemyGList.add( new BasicEnemy(new PVector(1027,height-393) ));
    enemyGList.add( new BasicEnemy(new PVector(1425,height-533) ));
    enemyGList.add( new BasicEnemy(new PVector(405,height-793) ));
    enemyGList.add( new BasicEnemy(new PVector(532,height-793) ));
    enemyGList.add( new BasicEnemy(new PVector(800,height-1178) ));
    enemyGList.add( new BasicEnemy(new PVector(638,height-1178) ));
    enemyGList.add( new BasicEnemy(new PVector(532,height-793) ));
    for(int i = 0 ; i<4000 ; i=i+200){
      enemyGList.add( new BasicEnemy(new PVector(1843+i,height-1393) ));
    }
    
    for(int i = 0 ; i<300 ; i=i+100){
      gCoins.add( new Pickup(5700+i,height -1178 ));
      gCoins.add( new Pickup(6345+i,height -1333 ));
    }
    enemyGList.add( new BasicEnemy(new PVector(7950,height-1403) ));
     enemyGList.add( new BasicEnemy(new PVector(12994,height-863) ));
    enemyGList.add( new BasicEnemy(new PVector(13830,height-843) ));
    enemyGList.add( new BasicEnemy(new PVector(14457,height-953) ));

    enemyGList.add( new BasicEnemy(new PVector(14894,height-783) ));
    enemyGList.add( new BasicEnemy(new PVector(14139,height-783) ));
    
    boss = new BossEnemy(new PVector(15700 , height - 900));
    
    lvl.finshLine=16800;
    
    lvl.backgroundColor = color (255, 210, 200);
    
    lvl.initialized = true;
    lvl.timeOfInit = millis();
  }
  
  
    
    
  
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  
  
  
  
    void resetLevel(){                                                  //////////////////////////3333333333333333333333333
       blocks = new ArrayList <Block>(); 
       pickups = new ArrayList <Pickup>();
       gCoins = new ArrayList <Pickup>();
       player= new Character(new PVector(0,0));
       lvl.initialized=false;
       offset = new PVector(0,0);
       enemyGList = new ArrayList <BasicEnemy>();
       lvl.scoreC =0;
      
    }
  
  
}