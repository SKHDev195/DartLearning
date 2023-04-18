void main() {
  final Car blueCar = Car(color: 'red', engine: 'V6');
}

class Car {
  late String color;
  late String engine;

  Car ({required this.color, required this.engine});

  void drive() {
    print('brrrrr! The $color car is moving');
  }

  void whichColor() {
    print('The color of the car is $color');
  }
}