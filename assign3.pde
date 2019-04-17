final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;
final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;
PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage bg,life;
PImage soil0, soil1, soil2, soil3, soil4, soil5;
PImage stone1,stone2;
int soilX,soilY,lifeX,lifeY;
int stoneX,stoneY,stone1X,stone1Y,stone2X,stone2Y=2000;
//groundhog
PImage groundhogIdle;
PImage groundhogDown,groundhogLeft,groundhogRight;
int groundhogX1,groundhogY1;//position
int speed=80/16;//15change to 16
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
boolean hogIdle=false;
// For debug function; DO NOT edit or remove this!
int playerHealth = 0;
float cameraOffsetY = 0;
boolean debugMode = false;

void setup() {
	size(640, 480, P2D);
	bg = loadImage("img/bg.jpg");
	title = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	startNormal = loadImage("img/startNormal.png");
	startHovered = loadImage("img/startHovered.png");
	restartNormal = loadImage("img/restartNormal.png");
	restartHovered = loadImage("img/restartHovered.png");
	soil0=loadImage("img/soil0.png");
  soil1=loadImage("img/soil1.png");
  soil2=loadImage("img/soil2.png");
  soil3=loadImage("img/soil3.png");
  soil4=loadImage("img/soil4.png");
  soil5=loadImage("img/soil5.png");
  life=loadImage("img/life.png");
  stone1=loadImage("img/stone1.png");
  stone2=loadImage("img/stone2.png");
  //groundhog
  groundhogIdle=loadImage("img/groundhogIdle.png");//groundhog
  groundhogRight=loadImage("img/groundhogRight.png");
  groundhogLeft=loadImage("img/groundhogLeft.png");
  groundhogDown=loadImage("img/groundhogDown.png");
  groundhogX1=320;
  groundhogY1=80;
  if(hogIdle){
    image(groundhogIdle,groundhogX1,groundhogY1);
  }
}

void draw() {
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.

    */
    if (debugMode) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    /* ------ End of Debug Function ------ */

    
	switch (gameState) {
    case GAME_START: // Start Screen
		image(title, 0, 0);
    if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {
      image(startHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
			}
    }else{
      image(startNormal, START_BUTTON_X, START_BUTTON_Y);
  	}
		break;

		case GAME_RUN: // In-Game
		// Background
		image(bg, 0, 0);
    // Sun
	    stroke(255,255,0);
	    strokeWeight(5);
	    fill(253,184,19);
	    ellipse(590,50,120,120);
    // Grass
		fill(124, 204, 25);
		noStroke();
		rect(0, 160 - GRASS_HEIGHT, width, GRASS_HEIGHT);

    //heart
    for(int l=0;l<5;l++){
      lifeX=10+(l*70);
      lifeY=10;
      image(life,lifeX,lifeY);
    }

		// Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
		for(int i=0;i<width;i++){
      for(int j=0;j<4;j++){
        soilX=i*width/8;
        soilY=(j*80)+160;
        image(soil0,soilX,soilY);
    }
   }
   for(int i=0;i<width;i++){
      for(int j=0;j<4;j++){
        image(soil1,soilX,soilY);
        soilX=i*width/8;
        soilY=(j*80)+480;
    }
   }
   for(int i=0;i<width;i++){
      for(int j=0;j<4;j++){
        image(soil2,soilX,soilY);
        soilX=i*width/8;
        soilY=(j*80)+800;
    }
   }
   for(int i=0;i<width;i++){
      for(int j=0;j<4;j++){
        image(soil3,soilX,soilY);
        soilX=i*width/8;
        soilY=(j*80)+1120;
    }
   }
   for(int i=0;i<width;i++){
      for(int j=0;j<4;j++){
        image(soil4,soilX,soilY);
        soilX=i*width/8;
        soilY=(j*80)+1440;
    }
   }
   for(int i=0;i<width;i++){
      for(int j=0;j<4;j++){
        image(soil5,soilX,soilY);
        soilX=i*width/8;
        soilY=(j*80)+1760;
    }
   }
   //stone1to8
   stoneY=0;
   for(int s=0;s<width;s++){
   stoneX=s*width/8;
   image(stone1,stoneX,160+stoneY);
   stoneY+=80;
   }
   //stone9to16
   for(int t=0;t<width;t++){
     stone1X=t*width/8;
     if(stone1X==80||stone1X==160||stone1X==400||stone1X==480){
        for(int o=0;o<8;o++){
        stone1Y=o*80+800;
        if(stone1Y==880||stone1Y==1200||stone1Y==960||stone1Y==1280){
        stone1X=t*width/8-160;
        image(stone1,stone1X,stone1Y);
        }else{
        stone1X=t*width/8;
        image(stone1,stone1X,stone1Y);
         }
       }
     }
   }
   for(int t=0;t<width;t++){//most right line
     stone1Y=t*width/8;
     stone1X=560;
     if(stone1Y==880||stone1Y==960||stone1Y==1200||stone1Y==1280){
     image(stone1,stone1X,stone1Y);
     }
   }
   //stone17to24
   stone2Y=2000;//center line
   for(int n=0;n<width;n++){
   stone2X=n*width/8;
   image(stone1,stone2X,stone2Y);
   stone2Y-=80;
   }
   stone2Y=2000;//center right
   for(int n=0;n<width;n++){
   stone2X=n*width/8;
   image(stone1,80+stone2X,stone2Y);
   image(stone2,80+stone2X,stone2Y);
   stone2Y-=80;
   }
   stone2Y=2000;
   for(int n=0;n<width;n++){
   stone2X=n*width/8;
   image(stone1,240+stone2X,stone2Y);
   stone2Y-=80;
   }
   stone2Y=2000;
   for(int n=0;n<width;n++){
   stone2X=n*width/8;
   image(stone1,320+stone2X,stone2Y);
   image(stone2,320+stone2X,stone2Y);
   stone2Y-=80;
   }
   stone2Y=2000;
   for(int n=0;n<width;n++){
   stone2X=n*width/8;
   image(stone1,480+stone2X,stone2Y);
   stone2Y-=80;
   }
   stone2Y=2000;//most right line
   for(int n=0;n<width;n++){
   stone2X=n*width/8;
   image(stone1,560+stone2X,stone2Y);
   image(stone2,560+stone2X,stone2Y);
   stone2Y-=80;
   }
   int stone3Y=1520;//most left
   for(int n=0;n<2;n++){
   stone2X=n*width/8;
   image(stone1,stone2X,stone3Y);
   stone3Y-=80;
   }
   int stone4Y=1600;
   for(int n=0;n<3;n++){
   stone2X=n*width/8;
   image(stone1,stone2X,stone4Y);
   image(stone2,stone2X,stone4Y);
   stone4Y-=80;
   }
   int stone5Y=1760;
   for(int n=0;n<5;n++){
   stone2X=n*width/8;
   image(stone1,stone2X,stone5Y);
   stone5Y-=80;
   }
   int stone6Y=1840;
   for(int n=0;n<6;n++){
   stone2X=n*width/8;
   image(stone1,stone2X,stone6Y);
   image(stone2,stone2X,stone6Y);
   stone6Y-=80;
   }
//groundhog
    if(groundhogX1==320&&groundhogY1==80){
    image(groundhogIdle,groundhogX1,groundhogY1);
    }
    if(hogIdle){
    image(groundhogIdle,groundhogX1,groundhogY1);
    }
    if (downPressed) {
    hogIdle=false;
    image(groundhogDown,groundhogX1,groundhogY1);
    groundhogY1 += speed;
    leftPressed=false;
    rightPressed=false;
    if(groundhogY1>2000)groundhogY1=2000;
    if(groundhogY1%80==0){//160,240,320,400stop
      downPressed=false;
      hogIdle=true;
    }
  }
    if (leftPressed) {
    hogIdle=false;
    image(groundhogLeft,groundhogX1,groundhogY1);
    groundhogX1 -= speed;
    downPressed=false;
    rightPressed=false;
    if(groundhogX1<0)groundhogX1=0;
    if(groundhogX1%80==0){//160,240,320,400stop
      leftPressed=false;
      hogIdle=true;
     }
  }
    if (rightPressed) {
    hogIdle=false;
    image(groundhogRight,groundhogX1,groundhogY1);
    groundhogX1 += speed;
    downPressed=false;
    leftPressed=false;
    if(groundhogX1>width-80)groundhogX1=width-80;
    if(groundhogX1%80==0){//160,240,320,400stop
      rightPressed=false;
      hogIdle=true;
    }
  }


		// Player

		// Health UI

		break;

		case GAME_OVER: // Gameover Screen
		image(gameover, 0, 0);
    if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {
			image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
				// Remember to initialize the game here!
			}
		}else{
			image(restartNormal, START_BUTTON_X, START_BUTTON_Y);
		}
		break;
	}
    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
}

void keyPressed(){
	// Add your moving input code here
if (key == CODED) { 
switch (keyCode) {
case DOWN:
downPressed = true;
break;
case LEFT:
leftPressed = true;
break;
case RIGHT:
rightPressed = true;
break;
    }
}
	// DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
    switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 25;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 25;
      break;

      case 'a':
      if(playerHealth > 0) playerHealth --;
      break;

      case 'd':
      if(playerHealth < 5) playerHealth ++;
      break;
    }
}

void keyReleased(){
}
