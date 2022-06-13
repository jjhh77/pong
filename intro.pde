void intro() {

  background (255);
  textFont(font);
  image(gif[f], 0, 0, width, height);
  f = f + 1;
  if (f == numberOfFrames) f = 0;
  // sound
  gameover.pause();
  theme.play();

  // one player
  stroke(1, 58, 99);
  strokeWeight(3);
  fill(255);
  rect(200, 350, 160, 80);
  fill(1, 58, 99);
  textSize(55);
  text("ONE", 235, 407);

  // two player
  stroke(1, 58, 99);
  strokeWeight(3);
  fill(255);
  rect(470, 350, 160, 80);
  fill(1, 58, 99);
  textSize(55);
  text("TWO", 500, 407);

  // title
  fill(1, 58, 99);
  textSize(120);
  text("PONG", 250, 250);
}

void introClicks() {

  // one player
  if (mouseX > 200 && mouseX < 360 && mouseY > 350 && mouseY < 430 ) {
    mode = GAME;
    AI = true;
  }
  // two player
  if (mouseX > 470 && mouseX < 630 && mouseY > 350 && mouseY < 430 ) {
    mode = GAME;
    AI = false;
  }
}
