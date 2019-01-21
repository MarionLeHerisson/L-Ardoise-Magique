int win_w = 800;    // window width 
int win_h = 800;    // window height

int score = 0;
int state = 0;      // game state (0 = en cours, 1 = perdu)
int lvl = 0;        // current drawing level

int x = 0, y = 0;    // cursor coordonates

String[] tab = new String[3];

void setup() {
  size(800, 800);  // window size
  //background(0,0,0);
}

void draw() {
  strokeWeight(4);
  stroke(250,250,250);
  
  play();
}

void play() {
  point(x,y);
}

void keyPressed() {
  
  if(key == CODED) {
    switch(keyCode) {
      // Player 1
      case RIGHT :
        println("RIGHT x = "+x);
        if(x < win_w) {
          x++;
        }
        break;
      case LEFT :
        println("LEFT");
        if(x > 0) {
          x--;
        }
        break;
        
      // Player 2   
      case UP :
        println("UP");
        if(y > 0) {
          y--;
        }
        break;
      case DOWN :
        println("DOWN");
        if(y < win_h) {
          y++;
        }
        break;
    } 
  } 
  else {
    switch(key) {        
      case 'q' :
        exit();
        break;
    }
  }
}