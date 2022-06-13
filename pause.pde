void pause() {
  
  // sound 
  theme.pause();
  
  // text
  fill(255);
  textSize(100);
  text("PAUSE", 250, 300);

  // button
  stroke(0);
  strokeWeight(3);
  fill(255);
  rect(40, 50, 60, 60);
}

void pauseClicks() {
  if (dist(mouseX, mouseY, 100, 100) < 50) {
    mode = GAME;
  }
}
