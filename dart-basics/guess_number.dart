import 'dart:io';
import 'dart:math';

void main() {

  Random random = Random();

  final int number = random.nextInt(51);
  int counter = 0;

  print('Please guess a random number ranging from 0 to 50');

  late int currentInput;

  do {
    int? userInput = int.tryParse(stdin.readLineSync().toString());

    while (userInput == null) {
    
      print('You did not enter a valid value, please try again');
      int? userInput = int.tryParse(stdin.readLineSync().toString());

    }

    checkNumber(userInput, number);
    counter++;
    print('You have passed try number $counter');
    currentInput = userInput;

    
  } while (checkNumber(currentInput, number) == false);

  print('You have guessed the number! It took you $counter ${pluralize(counter)}.');
}

bool checkNumber(int numberRef, int numberToCheck) {
  if (numberToCheck == numberRef) return true;
  else return false;
}

String pluralize(int counter) {
  if (counter > 1) return 'tries';
  else return 'try';
}