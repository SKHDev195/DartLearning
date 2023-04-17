import 'dart:io';

void main() {
  print('Please enter a value: ');
  String? result = stdin.readLineSync();
  if (result != null && result.length > 0) print(result);
  else print('You didn\'t enter anything!');

}