void main(List<String> args) {
  Student studentOne = Student();
  studentOne.setSemester = 2;
  studentOne.setName = 'Jill';
  studentOne.setAge = 19;

  Person personOne = Person();
  personOne.setName = 'Jack';
  personOne.setAge = 20;

  print(studentOne.getSemester);

  studentOne.jump();
  studentOne.study();
  studentOne.run();
}

class Person {
  late String _name;
  late int _age;

  String get getName => this._name;
  int get getAge => this._age;

  set setName(String name) {
    this._name = name;
  }

  set setAge(int age) {
    this._age = age;
  }

  void run() {
    print('$_name runs');
  }
}

class Student extends Person with Jumper, Learner {
  late int _semester;

  int get getSemester => this._semester;

  set setSemester(int semester) {
    this._semester = semester;
  }

  void party() {
    print('$_name is partying');
  }
}

mixin Learner {
  void study() {
    print('study');
  }
}

mixin Jumper {
  void jump() {
    print('I can jump');
  }
}