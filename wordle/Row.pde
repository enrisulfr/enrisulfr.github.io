class Row {
  Block[] row;
  int x;
  int y;
  String guess;
  int status;
  
  Row(int X, int Y) {
    x = X;
    y = Y;
    guess = " ";
    status = 0;
    row = new Block[5];
    for (int i = 0; i < row.length; i++) {
      row[i] = new Block(x + 100 * i, y, status);
    }//for
  }//constructor
  
  
  
  void update(char c) {
    if (c == BACKSPACE){
      //input = input.substring(0, input.length()-1);
      row[guess.length()].setLetter(' ');
    }
    else {
      row[guess.length()].setLetter(c);
      guess += c;
    }
  }//changeLetter
  
  void display() {
    for (int i = 0; i < row.length; i++) {
      row[i].display();
    }//for
  }//display
}//Block
