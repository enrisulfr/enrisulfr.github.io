String[] answerList;
String[] guessList;
Keyboard keyboard;
Game game;

void setup(){
  size(800, 800);
  background(#121213);
  textAlign(CENTER);
  answerList = loadStrings("wordle_answer_words.txt");
  guessList = loadStrings("wordle_guess_words.txt");
  game = new Game();
  game.startGame();
}

void draw(){
  if (game.getStatus() == 0){
    game.display();
  }
  else if (game.getStatus() == 1){
    game.winScreen();
  }
  else {
    game.defeatScreen();
  }
}

int countOccurences(String s, char c){
  int occurences = 0;
  for (int i = 0; i < s.length(); i++){
    if (s.charAt(i) == c){
      occurences ++;
    }
  }
  return occurences;
}

void keyPressed(){
  game.handleInput(key);
}

void mousePressed(){
  if (dist(mouseX, mouseY, 391, 596) < 50 && game.getStatus() != 0){
    game.startGame();
  }
}
