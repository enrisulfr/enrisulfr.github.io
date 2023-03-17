String[] answerWords;
String[] guessWords;
Grid grid;

void setup() {
  answerWords = loadStrings("wordle_answer_words.txt");
  guessWords = loadStrings("wordle_guess_words.txt");
  size(500, 800);
  
  
  grid = new Grid();
  grid.display();
}//setup

void draw() {
}//draw

void keyPressed(){
  if((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z')) {
    if (key >= 'a' && key <= 'z') {
      key -= 32;
    }
    println(key);
    //test.displayWord(str(key));
  }
    if (key == ENTER) {
      //worble.checkWord();
    }
    else if (key == BACKSPACE) {
      //wordBoxes.deleteLetter();
    }
}//keyPressed
