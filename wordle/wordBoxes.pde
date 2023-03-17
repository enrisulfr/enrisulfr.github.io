class Grid {
  //instance variables
  Row[] grid;
  int x;
  int y;
  int currentRow;
  String answer;
  int status;
  int NOTLETTER;
  int LETTER;
  int CORRECT;

  Grid() {
    answer = answerWords[int(random(answerWords.length))].toUpperCase();
    grid = new Row[6];
    x = 10;
    y = height / 6;
    currentRow = 0;
    NOTLETTER = 0;
    LETTER = 1;
    CORRECT = 2;

    for (int i = 0; i < grid.length; i++) {
      grid[i] = new Row(x, y + i * 100);
    }//for
  }//constructor

  //void checkWord() {
  //  if (guess.substring(0, 1).equals(answer.substring(0, 1))) {
  //    println("hello");
  //  }
  //}//checkWord

  //void keyInput(char c) {
  //  if (status == NOTLETTER) {
  //    if (Character.isLetter(c) && rowArray[currentRow].getGuess().length() < 5) {
  //      grid[currentRow].update(Character.toUpperCase(c));
  //    } else if (c == BACKSPACE && rowArray[currentRow].getGuess().length() > 0) {
  //      grid[currentRow].update(Character.toUpperCase(c));
  //    } else if (c == ENTER && rowArray[currentRow].getGuess().length() == 5) {
  //      for (int i = 0; i < guess.length; i++) {
  //        if (grid[currentRow].getGuess().toLowerCase().equals(guessList[i])) {
  //          grid[currentRow].setGuess();
  //          currentRow ++;
  //          setStatus();
  //          break;
  //        }
  //      }
  //    }
  //  }
  //}

  void display() {
    background(255, 105, 180);
    for (int i = 0; i < grid.length; i++) {
      grid[i].display();
    }//for
  }//display
}//Grid
