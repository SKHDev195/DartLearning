import 'dart:math';
import 'dart:io';

void main() {
  GameController controller = GameController();

  controller.chooseRandomWord();

  while (controller.currentPlayer.lives > 0 && controller.remainingLetters.length > 0) {
    controller.guessLetter();
    controller.gameOverWin();

  }

  print('You\'ve run out of lives!');
}

class Player {
  int _lives = 10;
  int get lives => _lives;

  bool makeGuess(String letter, String word) {
    if (word.contains(letter)) {
      word.replaceAll(letter, '');
      print('You have guessed correctly!');
      return true;
    }
    else {
      print('You have guessed incorrectly!');
      this._lives--;
      return false;
    }
  }

  void generateStatus() {
    print('You currently have $lives lives left');
  }
}

class GameController {
  List<String> _hangmanWords = [
    'hangman',
    'trading',
    'literature',
    'decision',
    'process',
    'network',
    'interface',
    'struggle',
    'politics',
    'customer'
  ];

  Set<String> _knownLetters = {};

  late String _remainingLetters;

  String get remainingLetters => _remainingLetters;

  late String _chosenWord;

  Random _random = Random();

  List<String> get hangmanWords => _hangmanWords;

  Player _currentPlayer = Player();

  Player get currentPlayer => _currentPlayer;

  String chooseRandomWord() {
    String chosenWord = hangmanWords.elementAt(_random.nextInt(hangmanWords.length));
    _remainingLetters = chosenWord;
    _chosenWord = chosenWord;
    displayWord(chosenWord);
    return chosenWord;
  }

  void displayWord(String word) {
    List<String> listOfNewString = [];

    for(int i = 0; i < word.length; i++) {
      if(!_knownLetters.contains(word[i])) {
        listOfNewString.add('_');
      }
      else listOfNewString.add(word[i]);
    }

    print('Here is how the word is looking now: ${listOfNewString.join('')}');
  }

  void guessLetter() {
    print('Please type the letter to guess: ');

    String? userInput = stdin.readLineSync();

    while (userInput == null) {
      print('Please type a valid value: ');
      userInput = stdin.readLineSync();
    }

    while (userInput!.length == 0 || userInput.length > 1) {
      print('You have either entered too many letters or no letters at all. Please try again: ');
      userInput = stdin.readLineSync();
    }

    bool resultOfGuess = _currentPlayer.makeGuess(userInput, _remainingLetters);

    if (resultOfGuess) {
      _knownLetters.add(userInput);
    };

    displayWord(_chosenWord);

    _currentPlayer.generateStatus();
  
  }

  void gameOverWin() {
    List<bool> guesses = [];

    for(int i = 0; i < _chosenWord.length; i++) {
      if (_knownLetters.contains(_chosenWord[i])) guesses.add(true);
    }

    if (guesses.length == _chosenWord.length) {
      print('You\'ve won!');
      exit(0);
    }
  }
}