//change colours

String[] answerList;
String[] guessList;
//Game game;
String answer;
String guess;
int numGuesses;

void setup() {
  answerList = loadStrings("wordle_answer_words.txt");
  guessList = loadStrings("wordle_guess_words.txt");
  //game = new Game();
  //game.startGame();
  guess = " ";
  numGuesses = 6;
  answer = answerList[(int)random(answerList.length)];
  
  size(800, 500);
  background(255);
  textAlign(CENTER);
  
  println(answer);
}//setup

void draw() {
  //while (guess != answer && numGuesses > 0) {
  //  for (int i=0; i<answer.length(); i++) {
  //    for (int j=0; j<answer.length(); j++) {
  //      //if (guess.charAt(i) == guess.charAt(j)) {
  //      //  println("hello");
  //      //}//if
  //    }//for
  //  }//for
  //}
  if (guess.equals(answer)) {
    println("yes");
  }
  String s1= guess.substring(0, 1);
  String s2 = answer.substring(0, 1);
  println(s1);
  println(s2);
  //if (guess.substring(0, 1) == answer.substring(0, 1)) {
  //  println("match");
  //}
}//draw

void keyPressed() {
  //if ((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z')) {
  //  if (key >= 'a' && key <= 'z') {
  //    key -= 32;
  //  }
  //  guess += str(key);
  //  println("hello");
  //}
  if (key >= 'a' && key <= 'z' || key >= 'A' && key <= 'Z') {
    guess = key;
    println(guess);
  }
  if (key == DELETE || key == BACKSPACE) {
    if (guess.length() > 0) {
    guess = guess.substring(0, guess.length()-1);
    println(guess);
    }
  }
}//keyPressed
