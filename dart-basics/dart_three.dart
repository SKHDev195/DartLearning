void main(List<String> args) {
  final (first, last) = records();
  print(first);
  print(last);

  final describedDate = describeDate(
    DateTime.now(),
  );
  print(describedDate);

  final soundOfAnimal = whatDoesItSoundLike(Sheep());
  print(soundOfAnimal);
}

// multiple returned values
(String, String) records() {
  final firstName = 'SKH';
  final lastName = 'Test';

  return (firstName, lastName);
}

// switch statements for classes
String whatDoesItSoundLike(Animal animal) => switch (animal) {
      Cow c => '$c moo',
      Sheep s => '$s aah',
      Pig p => '$p oink',
    };

// simplified switch syntax
String describeDate(DateTime dt) => switch (dt.weekday) {
      1 => 'Feeling relaxed?',
      6 || 7 => 'Weekend!',
      _ => 'Not the weekend',
    };

// interfaces
abstract interface class DoSth {
  void myMethod();
}

class WeDoSth implements DoSth {
  @override
  void myMethod() {
    // TODO: implement myMethod
  }
}

sealed class Animal {}

class Cow extends Animal {}

class Sheep extends Animal {}

class Pig extends Animal {}
