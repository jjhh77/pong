void game() {

  // background/background music/font
  background(42, 111, 151);
  theme.play();
  textFont(font);

  //paddles
  stroke(1, 79, 134);
  fill(1, 79, 134);
  circle(leftx, lefty, leftd);
  circle(rightx, righty, rightd);

  // left paddle limits
  if (lefty < 115) {
    lefty = 115;
  }
  if (lefty > height - 115) {
    lefty = height -115;
  }

  // right paddle limits
  if (righty < 115) {
    righty = 115;
  }
  if (righty > height - 115) {
    righty = height -115;
  }

  // move paddles
  if (AI == false) {
    if (wkey == true) lefty = lefty - 5;
    if (skey == true) lefty = lefty + 5;
  } else {
    if (ballx < width/2) {
      if (bally >= lefty) {
        lefty = lefty + 3;
      }
      if (bally <= lefty) {
        lefty = lefty - 3;
      }
    }
  }

  if (upkey == true) righty = righty - 5;
  if (downkey == true) righty = righty + 5;



  // move ball
  if (timer < 0) {
    ballx = ballx + vx;
    bally = bally + vy;
  }

  // bouncing ball of the edge of the screen

  if (bally < balld/2 || bally > height - balld/2) {
    vy = vy * -1;
  }

  // limits

  if (bally > height - balld/2) {
    bally = height - balld/2;
  }
  if (bally < 0 + balld/2) {
    bally = 0 + balld/2;
  }

  // bouncing ball off the paddles
  if (dist(ballx, bally, rightx, righty) < balld/2 + rightd/2) {
    vx = (ballx - rightx)/20;
    vy = (bally - righty)/20;
  }
  if (dist(ballx, bally, leftx, lefty) < balld/2 + leftd/2) {
    vx = (ballx - leftx)/20;
    vy = (bally - lefty)/20;
  }

  // center line
  strokeWeight(5);
  stroke(255);
  line(width/2, 0, width/2, height);

  // line on top
  strokeWeight(5);
  stroke(255);
  line(width, 3, 0, 3);

  // line on the bottom
  strokeWeight(5);
  stroke(255);
  line(width, 596, 0, 596);

  // far left line
  strokeWeight(5);
  stroke(255);
  line(3, 0, 3, height);

  // left line
  strokeWeight(5);
  stroke(255);
  line(200, 0, 200, height);

  // far right line
  strokeWeight(5);
  stroke(255);
  line(796, 0, 796, height);

  // right line
  strokeWeight(5);
  stroke(255);
  line(600, 0, 600, height);

  // big circle in the middle
  fill(255);
  circle(400, 300, 150);

  // smaller circle in the middle
  fill(42, 111, 151);
  circle(400, 300, 145);

  // tiny circle in the middle
  fill(255);
  circle(400, 300, 35);

  // ball
  stroke(255);
  fill(255);
  circle(ballx, bally, balld);

  // score board
  textSize(50);
  fill(255);
  text(leftscore, width/4, 100);
  fill(255);
  text(rightscore, 3 * width/4, 100);
  //text(timer, 3 * width/4, 550);
  timer = timer - 1;

  // keeping score
  if (ballx < 0) {
    rightscore++;
    ballx = width/2;
    bally = height/2;
    timer = 100;
    coin.rewind();
    coin.play();
  }

  if (ballx > 800) {
    leftscore++;
    ballx = width/2;
    bally = height/2;
    timer = 100;
    coin.rewind();
    coin.play();
  }

  // pause button
  stroke(1, 58, 99);
  strokeWeight(3);
  fill(255);
  rect(40, 50, 60, 60);
  fill(1, 58, 99);
  textSize(1);
  textFont(button);
  text("C", 51, 93);


  // home button
  stroke(1, 58, 99);
  strokeWeight(3);
  fill(255);
  rect(700, 50, 60, 60);
  fill(1, 58, 99);
  textSize(47);
  text("5", 708, 93);
  textFont(font);

  // win screen
  if (leftscore == 3 || rightscore == 3)
    mode = GAMEOVER;
  {
  }
}


void gameClicks() {

  // pause
  if (mouseX> 40 && mouseX < 100 && mouseY > 50 && mouseY < 110) {
    mode = PAUSE;
  } else if (mouseX> 700 && mouseX < 760 && mouseY > 50 && mouseY < 110) {
    mode = INTRO;
    leftscore = 0;
    rightscore = 0;
    timer = 0;
  }
}
