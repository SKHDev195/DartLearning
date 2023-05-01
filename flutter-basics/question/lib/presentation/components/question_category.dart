
enum QuestionCategory {
  history(categoryName: 'History', image: 'history.png'),
  geography(categoryName: 'Geography', image: 'geography.png'),
  sciences(categoryName: 'Sciences', image: 'sciences.png'),
  sports(categoryName: 'Sports', image: 'sports.png'),
  arts(categoryName: 'Arts', image: 'arts.png'),
  entertainment(categoryName: 'Entertainment', image: 'entertainment.png');

  final String categoryName;
  final String image;

  const QuestionCategory({required this.categoryName, required this.image});
}
