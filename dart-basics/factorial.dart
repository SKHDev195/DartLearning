import 'dart:io';

void main() {
  print('Please enter a number:');

  String userInput = stdin.readLineSync().toString();

  int? intInput = int.tryParse(userInput);

  if (intInput is! int) {
    print('You did not enter a valid value');
  }
  else if (intInput == 0) print(0);
  else {
    print(factorial(intInput));
  }
}

int factorial(int number) {
  if (number == 1) return 1;
  else return number*factorial(number - 1);
}