void main(List<String> args) {
  bool boolOutput = false;
  print(boolOutput);

  int intOutput = -1;
  print(intOutput);

  double doubleOutput = 1.5;
  print(doubleOutput);

  String stringOutput = 'Example String';
  print(stringOutput);
  print('The value is $intOutput');

  late int lateExampleInt;
  lateExampleInt = 3;
  print(lateExampleInt);

  final int finalInt = 2;
  print(finalInt);

  const int constInt = 7;
  print(constInt);

  dynamic dynamicExample = 3;
  dynamicExample = 'New Value';
  print(dynamicExample);

  var varExample = 'no need for a type';
  print(varExample);
}