class Tile {
  char letter;
  int status;
  int x;
  int y;
  color stroke;

  Tile(int x_, int y_) {
    letter = ' ';
    status = 0;
    stroke = #3A3A3C;
    x = x_;
    y = y_;
  }

  void setStatus(int s) {
    status = s;
  }
  
  void setLetter(char c){
    letter = c;
  }

  color statusToColor(int s) {
    if (s == 0) {
      return color(#121213);
    } else if (s == 1) {
      return color(#3A3A3C);
    } else if (s == 2) {
      return color(#B59F3B);
    } else if (s == 3) {
      return color(#538D4E);
    }
    return color(255);
  }
  
  void setS(color c){
    stroke = c;
  }

  void display() {
    fill(statusToColor(status));
    stroke(stroke);
    if (status != 0 && stroke != 255){
      noStroke();
    }
    else {
      strokeWeight(2);
    }
    rect(x, y, 75, 75, 15);
    fill(255);
    textSize(40);
    text(letter, x + 38, y + 50);
  }
}
