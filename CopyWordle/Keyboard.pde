class Keyboard {
  IntDict keys;
  char[] letters;
  Keyboard() {
    keys = new IntDict();
    letters = new char[]{'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', 'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'Z', 'X', 'C', 'V', 'B', 'N', 'M'};
    for (int i = 0; i < letters.length; i++) {
      keys.add(Character.toString(letters[i]), 0);
    }
  }

  int getStatus(char c) {
    return keys.get(Character.toString(c));
  }

  void updateStatus(char c, int s) {
    keys.set(Character.toString(c), s);
  }

  color statusToColor(int s) {
    if (s == 0) {
      return color(#818384);
    } else if (s == 1) {
      return color(#3A3A3C);
    } else if (s == 2) {
      return color(#B59F3B);
    } else if (s == 3) {
      return color(#538D4E);
    }
    return color(255);
  }

  void display() {
    noStroke();
    strokeWeight(1);
    textSize(24);
    for (int i = 0; i < 10; i++) {
      fill(statusToColor(keys.get(Character.toString(letters[i]))));
      rect(195 + i * 41, 600, 36, 44, 5);
      fill(255);
      text(letters[i], 213 + i * 41, 630);
    }
    for (int i = 10; i < 19; i++) {
      fill(statusToColor(keys.get(Character.toString(letters[i]))));
      rect(215 + (i - 10) * 41, 650, 36, 44, 5);
      fill(255);
      text(letters[i], 233 + (i - 10) * 41, 680);
    }
    for (int i = 19; i < 26; i ++) {
      fill(statusToColor(keys.get(Character.toString(letters[i]))));
      rect(256 + (i - 19) * 41, 700, 36, 44, 5);
      fill(255);
      text(letters[i], 274 + (i - 19) * 41, 730);
    }
  }
}
