PImage img;
PImage game;
PFont ard;
int score;
int START = 1, STARTONE = 2, GAME = 3, GAMEOVER = 4;
int gameState = START;

//Values opponents
float Gegner1X=1000;
float Gegner1Y=300;
float Gegner1VX=-200;
float Gegner1VY=300;
float Gegner1W=20;
float Gegner1H=40;
float Gegner2X=1000;
float Gegner2Y=300;
float Gegner2VX=-200;
float Gegner2VY=300;
float Gegner2W=20;
float Gegner2H=40;

int frameCount;

//Values Hero
float HeldX=500;
float HeldY=300;
float HeldH=60;
float HeldW=60;
float HeldVX=0;
float HeldVY=0;
float HeldSpeedY=250;
float HeldSpeedX=250;

//Values opponents follow hero
float huntingHero = 0.01;


void setup() {
  size( 900, 600 );
  //surface.setResizable(true);
  img = loadImage("StarWars.jpg"); //Startbackground
  game = loadImage("Venus.jpg"); //actual gamebackground
  ard = loadFont("ARDESTINE.vlw"); //Font vor erverything
  
   fill (255);
  ellipse (HeldX, HeldY, HeldH, HeldW);
  //make opponent 1 appear randomly from right side of screen
  Gegner1X=1000;
  Gegner1Y= random(30, height-30);

  // make opponent 2 appear randomly from right side of screen
  Gegner2X=1000;
  Gegner2Y= random(30, height-30);
  Gegner2VX= random (-200, -400);
  Gegner2VY= random (-200, -400);
}

//"Start Game" grey for a short time
void keyPressed() {
  if (key == ENTER) {
    if (gameState == START) {
      textFont(ard);
      textSize(70);
      fill(125, 125, 125);
      textAlign(CENTER, TOP);
      text("Enter to start Game", 450, 150);
      gameState = STARTONE;
    } else if (key==ENTER) {
      if (gameState == STARTONE) {
        gameState = GAME;
      } else if (gameState==GAMEOVER) gameState = START;
    }
  }
 }
 
 void keyReleased() {
  if (keyCode==UP) {
    HeldVY = 0;
  } else if (keyCode==DOWN) {
    HeldVY = 0;
  } else if (keyCode==LEFT) {
    HeldVX=0;
  } else if (keyCode==RIGHT) {
    HeldVX=0;
  }
}

//Startscreen
void draw() {
  if (gameState==START) {
    background(0);
    tint (255, 255);
    image(img, 0, 0);
    textFont(ard);
    textSize(90);
    fill(255, 25, 25);
    textAlign(CENTER, TOP);
    text("GameName", 450, 50);//have to think about an actual name
    textSize(70);
    text("Enter to start Game", 450, 150);
  }
  //Manual-screen
  if (gameState==STARTONE) {
    background(0);
    tint (255, 255);
    image(img, 0, 0);
    textFont(ard);
    textSize(50);
    fill(255, 25, 25);
    textAlign(CENTER, TOP);
    text("Before you beat the HighScore:", 450, 50);
  }
  //InGame
  if (gameState==GAME) {
    background(0);
    image(game, 0, 0);
    fill (255, 255, 255);
    textSize(60);
    textAlign (CENTER, TOP);
    text (score, width/2, 0);
    //if (lost)
    //gameState==GAMEOVER;
  }
  //GameOver Screen
  if (gameState==GAMEOVER) {
    //image stops
    textSize(60);
    fill(255, 25, 25);
    textAlign(CENTER, BASELINE);
    text("Game over", width/2, height/2);
  }
  
   // Movement of Hero with arrow keys 
  if (keyCode==UP) {
    HeldVY = -HeldSpeedY;
  } else if (keyCode==DOWN) {
    HeldVY = +HeldSpeedY;
  } else if (keyCode==LEFT) {
    HeldVX= -HeldSpeedX;
  } else if (keyCode==RIGHT) {
    HeldVX= +HeldSpeedX;
  }
}


 background(0);

  // Hero movement Y-axis
  HeldY = HeldY + HeldVY/frameRate;
  //Hero cannot leave screen
  if (HeldY<0) {
    HeldY = 0;
    HeldVY = 0;
  } else if (HeldY>height-HeldH) {
    HeldY=height-HeldH;
    HeldVY = 0;
  }
  //Hero Movement X-axis
  HeldX=HeldX+HeldVX/frameRate;
  //Hero cannot leave screen
  if (HeldX<0) {
    HeldX=0;
    HeldVX=0; }
    else if (HeldX>width-HeldW) {
      HeldX=width-HeldW;
      HeldVX=0;
    }

  // create opponent 1
  fill (255, 0, 0);
  ellipse (Gegner1X, Gegner1Y, Gegner1W, Gegner1H );

  // create opponent 2
  fill (0, 255, 0);
  ellipse (Gegner2X, Gegner2Y, Gegner2W, Gegner2H );

  // Movement of opponents
  Gegner1X = Gegner1X + Gegner1VX/frameRate/1.5;
  Gegner1Y = Gegner1Y + Gegner1VY/frameRate/1.5;

  Gegner2X = Gegner2X + Gegner2VX/frameRate/1.5;
  Gegner2Y = Gegner2Y + Gegner2VY/frameRate/1.5;


  //   opponent 1 cannot leave play screen
  if (Gegner1Y<0 && Gegner1VY<0) {
    Gegner1VY = -Gegner1VY;
  }
  if (Gegner1Y>height && Gegner1VY>0) {
    Gegner1VY = -Gegner1VY;
  }
  if (Gegner1X>width && Gegner1VX>0) {
    Gegner1VX = -Gegner1VX;
  }

  if (Gegner1X<0 && Gegner1VX<0) {
    Gegner1VX= -Gegner1VX;
  }

  //   opponent 2 cannot leave play screen
  if (Gegner2Y<0 && Gegner2VY<0) {
    Gegner2VY = -Gegner2VY;
  }
  if (Gegner2Y>height && Gegner2VY>0) {
    Gegner2VY = -Gegner2VY;
  }
  if (Gegner2X>width && Gegner2VX>0) {
    Gegner2VX = -Gegner2VX;
  }

  if (Gegner2X<0 && Gegner2VX<0) {
    Gegner2VX= -Gegner2VX;
  }

  // opponent 1 is beaten by Hero by clicking left mouse button
  if (Gegner1X+Gegner1W<HeldX+HeldW && 
    Gegner1X>=HeldX &&
    Gegner1Y>HeldY && Gegner1Y+Gegner1H<HeldY+HeldH)
    if (mousePressed && (mouseButton == LEFT))
    {// make opponent 1 diasappear
      Gegner1H = 0;
      Gegner1W=0;
    }

  // opponent 2 is beaten by Hero by clicking right mouse button
  if (Gegner2X+Gegner2W<HeldX+HeldW && 
    Gegner2X>=HeldX &&
    Gegner2Y>HeldY && Gegner1Y+Gegner2H<HeldY+HeldH)
    if (mousePressed && (mouseButton == RIGHT))
    {// make opponent 2 disappear
      Gegner2H = 0;
      Gegner2W=0;
    }


  //opponent 1 follows hero
  // set x-value
  //Gegner1VX= huntingHero; 
  if (Gegner1X<1000) {
    Gegner1VX=huntingHero; 
    float targetX = HeldX;
    float dx = targetX - Gegner1X;
    Gegner1X= Gegner1X+dx * huntingHero;
    float targetY =HeldY;
    float dy = targetY-Gegner1Y;
    Gegner1Y=Gegner1Y+dy*huntingHero;
  }


  fill (255);
  ellipse (HeldX, HeldY, HeldW, HeldH);
}
}
