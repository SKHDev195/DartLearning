void main() {
  Car redCar = Car();
  redCar.color = 'red';

  Car blueCar = Car();
  blueCar.color = 'blue';

  redCar.drive();
  redCar.whichColor();

  blueCar.drive();
  blueCar.whichColor();
}

class Car {
  late String color;

  void drive() {
    print('brrrrr! The $color car is moving');
  }

  void whichColor() {
    print('The color of the car is $color');
  }
}