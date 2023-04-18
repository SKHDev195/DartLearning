void main() {
  pow(5);

  print(add(numberOne: 3, numberTwo: 5));
}

void pow(int number) {
  print(number * number);
}

int add({required int numberOne, required int numberTwo}) {
  return numberOne + numberTwo;
}