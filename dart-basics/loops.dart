void main() {
  int age = 1;

  while (age < 16) {
    print('Age is $age');
    age++;
  }

  int otherAge = 10;

  do {
    print(otherAge);
    otherAge++;
  } while (otherAge < 10);

  List<int> numberList = [1, 5, 7, 3];

  for (int i = 0; i < numberList.length; i++) {
    print(numberList[i] + 1);
  }

  numberList.forEach((element) => print(element + 2),);
}