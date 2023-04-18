void main() {
  int age = 16;

  print('Moviegoer is $age years old');

  if (age >= 18) {
    print('Moviegoer can enter');
  }
  else if (age >= 16) {
    print('Moviegoer can enter with parents');
  }
  else print ('Moviegoer cannot enter');
}