void gameover() {

  background(69, 123, 157);
  textFont(font);

  // win screen
  if (leftscore > rightscore) {
    fill(255);
    textSize(100);
    text("left wins!", 230, 300);
  } else if (rightscore > leftscore) {
    fill(255);
    textSize(100);
    text("right wins!", 200, 300);
  }

  // sound
  theme.pause();
  gameover.play();
}

void gameoverClicks() {
  mode = INTRO;
  theme.rewind();
  leftscore = 0;
  rightscore = 0;
  lefty = righty = height/2;
}
