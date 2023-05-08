import 'package:question/presentation/components/question.dart';
import 'package:question/presentation/components/question_category.dart';

final List<Question> questionsAll = [
  Question(
      questionText: 'How many fish are there in the world?',
      questionCategory: QuestionCategory.sciences,
      hintOne: 'It\'s a lot of fish!',
      hintTwo: 'Think of a very large number!',
      solution: '3.5 trillion'),
  Question(
      questionText: 'What is Da Vinci\'s name?',
      questionCategory: QuestionCategory.arts,
      hintOne: 'Think of TMNT!',
      hintTwo: 'Starts with an L',
      solution: 'Leonardo'),
  Question(
      questionText: 'When was Pump Up the Jam (the song) released?',
      questionCategory: QuestionCategory.history,
      hintOne: 'Watch Philomena Cunk',
      hintTwo: 'Somewhere in the 1980s',
      solution: '1989'),
  Question(
      questionText: 'What is the name of the smallest unit of life?',
      questionCategory: QuestionCategory.sciences,
      hintOne: 'Mitochondria is its powerhouse',
      hintTwo: 'Starts with a C',
      solution: 'Cell'),
  Question(
    questionText:
        'In physics, what term is used to describe the resistance of an object to changes in its state of motion?',
    questionCategory: QuestionCategory.sciences,
    hintOne: 'Sir Isaac Newton',
    hintTwo: 'Second law of motion',
    solution: 'Inertia',
  ),
  Question(
    questionText:
        'What is the name of the character played by Hugh Jackman in the X-Men movies?',
    questionCategory: QuestionCategory.entertainment,
    hintOne: 'Adamantium claws',
    hintTwo: 'Mutant superhero',
    solution: 'Wolverine',
  ),
  Question(
    questionText: 'Who wrote the novel "The Catcher in the Rye"?',
    questionCategory: QuestionCategory.arts,
    hintOne: 'American author',
    hintTwo: 'Born in New York City',
    solution: 'J.D. Salinger',
  ),
  Question(
    questionText:
        'What is the highest-grossing film of all time (not adjusted for inflation)?',
    questionCategory: QuestionCategory.entertainment,
    hintOne: 'Directed by James Cameron',
    hintTwo: 'Released in 2009',
    solution: 'Avatar',
  ),
  Question(
    questionText:
        'Who was the first president of the United States of America?',
    questionCategory: QuestionCategory.history,
    hintOne: 'Commander-in-Chief of the Continental Army',
    hintTwo: 'One of the Founding Fathers',
    solution: 'George Washington',
  ),
  Question(
    questionText: 'In what year did World War II end?',
    questionCategory: QuestionCategory.history,
    hintOne: 'The war ended with the signing of the Instrument of Surrender',
    hintTwo: 'The year is a palindrome',
    solution: '1945',
  ),
  Question(
    questionText:
        'Who was the first female Prime Minister of the United Kingdom?',
    questionCategory: QuestionCategory.history,
    hintOne: 'She served from 1979 to 1990',
    hintTwo: 'She was nicknamed the "Iron Lady"',
    solution: 'Margaret Thatcher',
  ),
  Question(
    questionText: 'In which sport would you use a shuttlecock?',
    questionCategory: QuestionCategory.sports,
    hintOne: 'Played with a racket',
    hintTwo: 'Net divides two players',
    solution: 'Badminton',
  ),
  Question(
      questionText: 'What is the tallest mountain in the world?',
      questionCategory: QuestionCategory.geography,
      hintOne: 'It is located in Asia.',
      hintTwo: 'It is part of the Himalayas.',
      solution: 'Mount Everest'),
  Question(
      questionText: 'What is the name of the largest ocean on Earth?',
      questionCategory: QuestionCategory.geography,
      hintOne: 'It is located in the Southern Hemisphere.',
      hintTwo: 'It is larger than all the other oceans combined.',
      solution: 'Pacific Ocean'),
  Question(
      questionText: 'Who painted the famous artwork called "The Starry Night"?',
      questionCategory: QuestionCategory.arts,
      hintOne: 'He was a Dutch painter.',
      hintTwo: 'He is considered one of the greatest artists of all time.',
      solution: 'Vincent van Gogh'),
  Question(
      questionText:
          'What is the name of the actress who played Hermione Granger in the "Harry Potter" films?',
      questionCategory: QuestionCategory.entertainment,
      hintOne: 'She was born in France.',
      hintTwo: 'She was cast in the role at the age of 9.',
      solution: 'Emma Watson'),
  Question(
      questionText:
          'What is the name of the process by which plants make their own food?',
      questionCategory: QuestionCategory.sciences,
      hintOne: 'It involves the absorption of light.',
      hintTwo: 'It produces oxygen as a byproduct.',
      solution: 'Photosynthesis'),
  Question(
      questionText: 'What is the capital of Australia?',
      questionCategory: QuestionCategory.geography,
      hintOne: 'It is located in the southeastern part of the country.',
      hintTwo: 'It is the largest inland city in Australia.',
      solution: 'Canberra'),
  Question(
      questionText:
          'What is the name of the famous naturalist who proposed the theory of evolution?',
      questionCategory: QuestionCategory.sciences,
      hintOne: 'He was born in England.',
      hintTwo: 'He wrote a book called "On the Origin of Species."',
      solution: 'Charles Darwin'),
  Question(
      questionText:
          'What is the name of the instrument used to measure atmospheric pressure?',
      questionCategory: QuestionCategory.sciences,
      hintOne: 'It was invented in the 17th century.',
      hintTwo: 'It is also used in meteorology.',
      solution: 'Barometer'),
  Question(
      questionText: 'What is the name of the largest desert in the world?',
      questionCategory: QuestionCategory.geography,
      hintOne: 'It is located in northern Africa.',
      hintTwo: 'It is almost as large as the United States.',
      solution: 'Sahara'),
  Question(
      questionText:
          'What is the name of the largest planet in our solar system?',
      questionCategory: QuestionCategory.sciences,
      hintOne: 'It is a gas giant.',
      hintTwo: 'It has a large number of moons.',
      solution: 'Jupiter'),
  Question(
    questionText: 'What is the smallest planet in our solar system?',
    questionCategory: QuestionCategory.sciences,
    hintOne: 'It is named after the messenger of the gods in Roman mythology',
    hintTwo: 'It is not the closest planet to the sun',
    solution: 'Mercury',
  ),
  Question(
    questionText: 'What is the capital city of Brazil?',
    questionCategory: QuestionCategory.geography,
    hintOne: 'It is located in the Federal District',
    hintTwo: 'It replaced Rio de Janeiro as the country\'s capital in 1960',
    solution: 'Brasília',
  ),
  Question(
    questionText: 'What is the largest desert in the world?',
    questionCategory: QuestionCategory.geography,
    hintOne: 'It is located in Africa',
    hintTwo: 'It is larger than the entire United States',
    solution: 'Sahara',
  ),
  Question(
    questionText: 'What is the formula for the area of a circle?',
    questionCategory: QuestionCategory.sciences,
    hintOne: 'It involves the mathematical constant pi (π)',
    hintTwo: 'The radius of the circle is squared in the formula',
    solution: 'πr²',
  ),
  Question(
    questionText:
        'What is the name of the famous painting by Leonardo da Vinci that depicts a woman with a mysterious smile?',
    questionCategory: QuestionCategory.arts,
    hintOne: 'It is currently housed at the Louvre Museum in Paris',
    hintTwo: 'It was painted in the 16th century',
    solution: 'Mona Lisa',
  ),
  Question(
    questionText:
        'What is the term for the process by which plants use sunlight, water, and carbon dioxide to create their own food?',
    questionCategory: QuestionCategory.sciences,
    hintOne: 'It begins with the letter "p"',
    hintTwo: 'It is a fundamental process for life on Earth',
    solution: 'Photosynthesis',
  ),
  Question(
    questionText: 'What is the name of the largest ocean on Earth?',
    questionCategory: QuestionCategory.geography,
    hintOne: 'It covers approximately one-third of the Earth\'s surface',
    hintTwo: 'Its name starts with the letter "P"',
    solution: 'Pacific',
  ),
  Question(
    questionText:
        'What is the name of the first satellite launched into space?',
    questionCategory: QuestionCategory.history,
    hintOne: 'It was launched by the Soviet Union in 1957',
    hintTwo: 'Its name means "traveler" in Russian',
    solution: 'Sputnik 1',
  ),
  Question(
    questionText:
        'What is the name of the process by which rocks are broken down into smaller pieces by natural forces such as wind, water, and ice?',
    questionCategory: QuestionCategory.sciences,
    hintOne: 'It can lead to the formation of soil over time',
    hintTwo: 'It is also known as weathering',
    solution: 'Erosion',
  ),
  Question(
    questionText: 'Who directed the film "Jurassic Park"?',
    questionCategory: QuestionCategory.entertainment,
    hintOne: 'He is also known for directing "Jaws"',
    hintTwo:
        'He won the Academy Award for Best Director for "Schindler\'s List"',
    solution: 'Steven Spielberg',
  ),
];
