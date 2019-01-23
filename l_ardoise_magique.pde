// TODO : verif couleur via variable type color

int win_w = 800;    // window width 
int win_h = 800;    // window height

int score = 0;
int state = 0;      // 0 = playing, 1 = win, 2 = loose
int lvl;            // current drawing level
Boolean delay = false;
Boolean drawlvl = true;

PFont font;

int x = 4, y = 4;    // cursor coordonates

boolean[] CKEYS;
color orange, background, bsod, pattern, players;

void setup() {
  size(800, 800);  // window size
  CKEYS = new boolean[255];
  
  font = createFont("Source Code Pro", 16, true);
  
  noSmooth();
  orange     = color(-3643901);
  background = color(-3355444);
  bsod       = color(-16777086);
  pattern    = color(-10197916);
  players    = color(-3145624);
  
  restart();
}

void draw() {  
  get_input();
  verif_pixel();
  draw_players();
}


/*********************/
/*  MENU FUNCTIONS   */
/*********************/
void menu() {
  
}

void restart() {
  println("restart");
  lvl = 0;
  draw_level();
}


/*********************/
/*   KEY FUNCTIONS   */
/*********************/

void get_input() {
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
    case 'r' :
      restart();
      break;
    case CODED :
      break;
  }
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
/* DRAWING FUNCTIONS */
/*********************/

void draw_players() {
  stroke(players);  // Players cursor 
  strokeWeight(1);
  point(x,y);
}

void draw_arrival(int x_arr, int y_arr) {  
      stroke(orange);
      strokeWeight(25);
      point(x_arr, y_arr);
}

void draw_level() {
  println("draw lvl");
  stroke(pattern);
  strokeWeight(20);
  
  background(background);
  
  switch(lvl) {
    // diagonal
    case 0:
      x = 100;
      y = 100;
      
      line(100, 100, 200, 200);

      draw_arrival(200,200);
      break;
      
    // "house"
    case 1:
      x = 100;
      y = 500;
      
      line(100, 500, 700, 500);  // 1
      line(100, 500, 700, 200);  // 2
      line(100, 200, 700, 500);  // 3
      line(100, 200, 100, 500);  // 4
      line(700, 500, 700, 200);  // 5
      line(100, 200, 700, 200);  // 6
      line(100, 200, 400, 100);  // 7
      line(400, 100, 700, 200);  // 8
      
      draw_arrival(700, 200);
      break;
      
    // circle
    case 2 : 
      x = 300;
      y = 200;
      
      ellipse(300, 300, 100, 100);
      
      stroke(background);
      strokeWeight(3);
      point(297,203);
      
      draw_arrival(290,210);
      break;
    // infinite
    case 3 :
      bezier(x, y, 350, 215, 350, 385, x, y);
      
      //draw_arrival(300, 300);
      break;
  }
  
  drawlvl = false;
}


/*********************/
/*  GAME FUNCTIONS   */
/*********************/

void verif_pixel() {
  
  color myColor = get(x,y);
  
  if(myColor == orange && state == 0) {  // win
    println("GAGNE");
    
    lvl++;
    draw_level();
  }
  else if(myColor == background) {  // loose
    println("PERDU");
    restart();
    
/*    background(0, 0, 130);
    
    textFont(font, 25);
    fill(255);
    text("Game over", 100, 100);
    text("Please wait, system will restart.", 100, 150);
    text("Press any key to continue", 100, 200);
*/    
  }
}