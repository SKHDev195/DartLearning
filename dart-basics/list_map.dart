void main(List<String> args) {
  List<int> exampleList = [1, 2, 3];
  print(exampleList);

  List<dynamic> otherExampleList = ['test', 1, 2.0];
  print(otherExampleList);

  print(exampleList.length);
  print(exampleList.first);
  print(exampleList.isEmpty);

  exampleList.add(4);
  print(exampleList);

  Map exampleMap = {
    'keyOne': 1,
    'keyTwo': 2
  };

  Map otherExampleMap = {
    1: 'valueOne',
    2: 'valueTwo'
  };

  Map<int, bool> additionalExampleMap = {
    3: true,
    4: false
  };

  print(additionalExampleMap[2]);
}