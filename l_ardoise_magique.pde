// TODO : use array containing key to simulate multi input

int win_w = 800;    // window width 
int win_h = 800;    // window height

int score = 0;
int state = 0;      // game state (0 = en cours, 1 = perdu, 2 = gagné)
int lvl = 0;        // current drawing level

int x = 4, y = 4;    // cursor coordonates

boolean[] CKEYS;

color b1,b2,c1,c2;
int Y_AXIS = 1;
int X_AXIS = 2;

void setup() {
  size(800, 800);  // window size
  
  b1 = color(255);
  b2 = color(0);
  c1 = color(204, 102, 0);
  c2 = color(0, 102, 153);
  
  // Background
  setGradient(0, 0, width/2, height, c1, c2, X_AXIS);
  setGradient(width/2, 0, width/2, height, b2, b1, X_AXIS);
  
  CKEYS = new boolean[255];
  
  draw_level();
}

void draw() {
  //println("Left:" + CKEYS[LEFT] + "   Right:" + CKEYS[RIGHT] + "   Up:" + CKEYS[UP] + "   Down:" + CKEYS[DOWN], 0 ,(height>>1)-20);
  //println("Left + Up:" + (CKEYS[LEFT] && CKEYS[UP]) , 0 ,(height>>1)+20);
  verif_pixel();
  draw_players();
  game_state();
}

void game_state() {
  switch(state) {
    case 1 :
      // background rouge
      // afficher perdu
      // pause 5 secondes
      break;
    case 2 :
      lvl++;
      draw_level();
      break;
  }
}

/*********************/
/*   KEY FUNCTIONS   */
/*********************/

void draw_players() {
  
  // Player 1
  if(CKEYS[RIGHT] && x < win_w -5) {
    x++;
  }
  else if(CKEYS[LEFT] && x > 3) {
    x--;
  }
  
  // Player 2
  if(CKEYS[UP] && y > 3) {
    y--;
  }
  else if(CKEYS[DOWN] && y < win_h -5) {
    y++;
  }
  
  switch(key) {        
    case 'q' :
      exit();
      break;
  }
  
  stroke(255);
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


/*********************/
/*   LVL FUNCTIONS   */
/*********************/
void draw_level() {
  stroke(100);
  strokeWeight(10);
  
  switch(lvl) {
    // carré
    case 0:
      x = 100;
      y = 100;
      line(100, 100, 400, 400);
      
      stroke(-10197916);
      strokeWeight(15);
      point(400,400);
      break;
      
    // maison
    case 1:
      x = 500;
      y = 500;
      line(100, 500, 700, 500);  // 1
      line(100, 500, 700, 200);  // 2
      line(100, 200, 700, 500);  // 3
      line(100, 200, 100, 500);  // 4
      line(700, 500, 700, 200);  // 5
      line(100, 200, 700, 200);  // 6
      line(100, 200, 400, 100);  // 7
      line(400, 100, 700, 200);  // 8
      
      stroke(-10197916);
      strokeWeight(15);
      point(700, 200);
      break;
      
    // cercle
    case 2 : 
      break;
    // infini
    case 3 :
      break;
  }
}

void verif_pixel() {
  loadPixels();
  int myColor = pixels[win_w * (y+4) + x+4];

  println(myColor);
  
}





void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}