class Row {
  Tile[] tileArray;
  String guess;
  int status;
  int x;
  int y;
  
  Row(int x_, int y_){
    guess = "";
    status = 0;
    tileArray = new Tile[5];
    x = x_;
    y = y_;
    for (int i = 0; i < tileArray.length; i++){
      tileArray[i] = new Tile(x + 83 * i, y);
    }
  }
  
  String getGuess(){
    return guess;
  }
  
  void setGuess(){
    IntDict repeats;
    repeats = new IntDict();
    for (int i = 0; i < guess.length(); i++){
      repeats.set(Character.toString(guess.charAt(i)), 0);
    }
    for (int i = 0; i < guess.length(); i++){
      if (guess.charAt(i) == game.getAnswer().charAt(i) && repeats.get(Character.toString(guess.charAt(i))) < countOccurences(game.getAnswer(), guess.charAt(i))){
        tileArray[i].setStatus(3);
        if (keyboard.getStatus(guess.charAt(i)) < 3){
          keyboard.updateStatus(guess.charAt(i), 3);
        }
        repeats.add(Character.toString(guess.charAt(i)), 1);
      }
    }
    for (int i = 0; i < guess.length(); i++){
      if (game.getAnswer().indexOf(guess.charAt(i)) != -1 && repeats.get(Character.toString(guess.charAt(i))) < countOccurences(game.getAnswer(), guess.charAt(i))){
        tileArray[i].setStatus(2);
        repeats.add(Character.toString(guess.charAt(i)), 1);
        if (keyboard.getStatus(guess.charAt(i)) < 2){
          keyboard.updateStatus(guess.charAt(i), 2);
        }
      }
      else if (tileArray[i].status != 3){
        tileArray[i].setStatus(1);
        if (keyboard.getStatus(guess.charAt(i)) < 1){
          keyboard.updateStatus(guess.charAt(i), 1);
        }
      }
    }
  }
  
  void updateGuess(char c){
    if (c == BACKSPACE){
      guess = guess.substring(0, guess.length()-1);
      tileArray[guess.length()].setLetter(' ');
    }
    else {
      tileArray[guess.length()].setLetter(c);
      guess += c;
    }
  }
  
  Tile[] getTiles(){
    return tileArray;
  }
  
  void display(){
    for (int i = 0; i < tileArray.length; i++){
      tileArray[i].display();
    }
  }
}
