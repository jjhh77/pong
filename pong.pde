int mode;
float leftx, lefty, leftd, rightx, righty, rightd; // paddles
float ballx, bally, balld, ballr; // ball
float vx, vy;
boolean wkey, skey, upkey, downkey;
boolean AI;
final int INTRO = 1;
final int GAME = 2;
final int GAMEOVER = 3;
final int PAUSE = 4;
final int tactile = 5;
PFont font;
PFont button;
PImage[] gif;
int numberOfFrames;
int i = 0;
int f;

// background music
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// sound variables
Minim minim;
AudioPlayer theme, coin, bump, gameover;

// scoring
int leftscore, rightscore, timer;

void setup() {
  size(800, 600);
  background(0);

  // initialize paddles

  leftx = 0;
  lefty = height/2;
  leftd = 200;
  rightx = width;
  righty = height/2;
  rightd = 200;

  // initialize ball

  ballx = width/2;
  bally = height/2;
  balld = 100;

  // moving ball
  vx = random(-5, 5);
  vy = random(-5, 5);

  // initialize keyboard variables
  wkey = skey = upkey= downkey = false;

  mode = INTRO;

  // intialize scores
  rightscore = leftscore = 0;
  timer = 100;

  // font 1
  font = createFont("Spring Plum.ttf", 40);
  // font 2
  button = createFont("Font 90 Icons.ttf", 40);

  // sound setup

  minim = new Minim(this);

  theme = minim.loadFile("mario bros theme.mp3");
  coin = minim.loadFile("coin.wav");
  bump = minim.loadFile("bump.wav");
  gameover = minim.loadFile("gameover.wav");

  // gif
  numberOfFrames = 23;
  gif = new PImage[numberOfFrames];
  while (i < numberOfFrames) {
    gif[i] = loadImage("frame_"+i+"_delay-0.08s.gif");
    i = i + 1;
  }
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == PAUSE) {
    pause();
  } else {
    println("Mode error:" + mode);
  }
}

// y at top is 0 x is width/2
