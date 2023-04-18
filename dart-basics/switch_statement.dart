void main() {
  final String name = 'TestName';

  switch(name) {
    case 'TestName':
      print('Cool name!');
      break;
    case 'TestOtherName':
      print('Another cool name');
      break;
    default:
      print('Where is the cool name');
      break;
  }
}