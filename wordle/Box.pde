class Block {
  int x;
  int y;
  char letter;
  int sideLength;
  int status;
  
  Block(int X, int Y, int s) {
    letter = ' ';
    x = X;
    y = Y;
    sideLength = 80;
    status = s;
  }//constructor
  
  void setLetter(char c) {
    letter = c;
  }//changeLetter
  
  //color setColor(int s) {
  //  if (s == NOTLETTER) {
  //    return color(255, 0, 0);
  //  }
  //  else if (s == LETTER) {
  //    return color(0, 255, 0);
  //  }
  //  else if (s == CORRECT) {
  //    return color(0, 0, 255);
  //  }
  //}//setColor
  
  void display() {
    noStroke();
    //fill(setColor(status));
    fill(255);
    rect(x, y, sideLength, sideLength, 10);
    fill(0);
    textSize(30);
    text(letter, x + sideLength / 2, y + sideLength / 2);
  }
}//Block
