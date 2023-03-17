class Game {
  Row[] rowArray;
  String answer;
  int currentRow;
  int status;
  int highscore;
  boolean display;
  int i;
  int j;

  void startGame() {
    display = false;
    keyboard = new Keyboard();
    i = 0;
    j = 0;
    answer = answerList[int(random(answerList.length))].toUpperCase();
    println("Answer: " + answer);
    currentRow = 0;
    status = 0;
    rowArray = new Row[6];
    for (int i = 0; i < rowArray.length; i++) {
      rowArray[i] = new Row(192, 60 + 83 * i);
    }
  }

  void handleInput(char c) {
    if (status == 0) {
      if (Character.isLetter(c) && rowArray[currentRow].getGuess().length() < 5) {
        rowArray[currentRow].updateGuess(Character.toUpperCase(c));
      } else if (c == BACKSPACE && rowArray[currentRow].getGuess().length() > 0) {
        rowArray[currentRow].updateGuess(Character.toUpperCase(c));
      } else if (c == ENTER && rowArray[currentRow].getGuess().length() == 5) {
        for (int i = 0; i < guessList.length; i++) {
          if (rowArray[currentRow].getGuess().toLowerCase().equals(guessList[i])) {
            rowArray[currentRow].setGuess();
            currentRow ++;
            setStatus();
            break;
          }
        }
      }
    }
  }

  String getAnswer() {
    return answer;
  }

  void setStatus() {
    if (currentRow > 5) {
      if (rowArray[currentRow-1].getGuess().equals(answer)) {
        status = 1;
      } else {
        status = 2;
      }
    } else if (rowArray[currentRow-1].getGuess().equals(answer)) {
      status = 1;
    } else {
      status = 0;
    }
  }

  int getStatus() {
    return status;
  }

  void winScreen() {
    String messages[] = new String[6];
    messages[0] = "LUCKY";
    messages[1] = "SUPER";
    messages[2] = "SMART";
    messages[3] = "GREAT";
    messages[4] = "CLOSE";
    messages[5] = "PHEW!";
    String strings[] = new String[6];
    int score = 7 - currentRow;
    if (score > highscore){
      highscore = score;
    }
    strings[0] = messages[currentRow-1];
    strings[1] = "SCR:" + score;
    strings[2] = "HSC:" + highscore; 
    strings[3] = "PLAYA";
    strings[4] = "GAIN?";
    strings[5] = " <Y> ";
    if (i + j < 9) {
      if (frameCount % 10 == 0){
        j ++;
        if (j > 4) {
          i++;
          j = 0;
        }
      }
    }
    else {
      display = true;
      i = 0;
      j = 0;
    }
    if (j < 4){
      if (rowArray[i].getTiles()[j+1].letter == ' ' && display == false){
        display = true;
        i = 0;
        j = 0;
      }
    }
    if (display) {
      rowArray[i].getTiles()[j].setLetter(strings[i].charAt(j));
      rowArray[i].getTiles()[j].setS(255);
    } else {
      rowArray[i].getTiles()[j].setLetter(' ');
    }
    display();
  }

  void defeatScreen() {
    String strings[] = new String[6];
    int score = 7 - currentRow;
    if (score > highscore){
      highscore = score;
    }
    strings[0] = answer;
    strings[1] = "SCR:" + score;
    strings[2] = "HSC:" + highscore; 
    strings[3] = "PLAYA";
    strings[4] = "GAIN?";
    strings[5] = " <Y> ";
    if (i + j < 9) {
      if (frameCount % 10 == 0){
        j ++;
        if (j > 4) {
          i++;
          j = 0;
        }
      }
    }
    else {
      display = true;
      i = 0;
      j = 0;
    }
    if (j < 4){
      if (rowArray[i].getTiles()[j+1].letter == ' ' && display == false){
        display = true;
        i = 0;
        j = 0;
      }
    }
    if (display) {
      rowArray[i].getTiles()[j].setLetter(strings[i].charAt(j));
    } else {
      rowArray[i].getTiles()[j].setLetter(' ');
    }
    display();
  }

  void display() {
    background(#121213);
    for (int i = 0; i < rowArray.length; i++) {
      rowArray[i].display();
    }
    keyboard.display();
  }
}
