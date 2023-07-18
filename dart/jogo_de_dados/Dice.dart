import 'dart:math';

class Dice {
  int roll() {
    Random random = Random();
    return random.nextInt(6) + 1;
  }
}

void main() {
  var dice = Dice();

  print(dice.roll());
}
