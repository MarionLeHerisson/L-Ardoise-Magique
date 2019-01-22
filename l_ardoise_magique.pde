// TODO : use array containing key to simulate multi input

int win_w = 800;    // window width 
int win_h = 800;    // window height

int score = 0;
int state = 0;      // game state (0 = en cours, 1 = perdu)
int lvl = 0;        // current drawing level

int x = 0, y = 0;    // cursor coordonates

boolean[] CKEYS;

void setup() {
  size(800, 800);  // window size
  //background(0,0,0);
  fill(0);
  textSize(20);
  CKEYS = new boolean[255];
}

void draw() {
  //println("Left:" + CKEYS[LEFT] + "   Right:" + CKEYS[RIGHT] + "   Up:" + CKEYS[UP] + "   Down:" + CKEYS[DOWN], 0 ,(height>>1)-20);
  //println("Left + Up:" + (CKEYS[LEFT] && CKEYS[UP]) , 0 ,(height>>1)+20);
  draw_lines();
}

void draw_lines() {
  
  // Player 1
  if(CKEYS[RIGHT] && x < win_w) {
    x++;
  }
  else if(CKEYS[LEFT] && x > 0) {
    x--;
  }
  
  // Player 2
  if(CKEYS[UP] && y > 0) {
    y--;
  }
  else if(CKEYS[DOWN] && y < win_h) {
    y++;
  }
    
  switch(key) {        
    case 'q' :
      exit();
      break;
  }
  
  strokeWeight(4);
  point(x,y);
}

public void keyPressed() {
  if (key == CODED && keyCode < 255) {
    CKEYS[keyCode] = true;
  }
}

public void keyReleased() {
  if (key == CODED && keyCode < 255) {
    CKEYS[keyCode] = false;
  }
}