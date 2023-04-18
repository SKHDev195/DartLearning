void main() {
  Car redCar = Car();
  redCar.setColor = 'red';

  Car blueCar = Car();
  blueCar.setColor = 'blue';

  redCar.drive();
  redCar.whichColor();

  blueCar.drive();
  blueCar.whichColor();

  String colorFromCarOne = redCar.color;
}

class Car {
  late String _color;

  set setColor(String color) {
    this._color = color;
  }

  String get color => _color;

  void drive() {
    print('brrrrr! The ${this._color} car is moving');
  }

  void whichColor() {
    print('The color of the car is ${this._color}');
  }
}