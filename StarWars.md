# Minigame
UniProject
PImage img;
PImage game;
PFont ard;
int score;
int START = 1, STARTONE = 2, GAME = 3, GAMEOVER = 4;
int gameState = START;

void setup() {
  size( 900, 600 );
  //surface.setResizable(true);
  img = loadImage("StarWars.jpg"); //Startbackground
  game = loadImage("Venus.jpg"); //actual gamebackground
  ard = loadFont("ARDESTINE.vlw"); //Font vor erverything
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
}
