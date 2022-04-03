import 'package:flutter_ui_practice/quote_app_ui/data/Comment.dart';

class Quote {
  final String quote;
  final String author;
  int numberOfLikes;
  int numberOfSaves;
  List<Comment> comments;
  int get numberOfComments => comments.length;
  bool isSaved = false;

  Quote(
    this.quote,
    this.author, {
    this.numberOfSaves = 10,
    this.numberOfLikes = 100,
    this.comments = const <Comment>[],
  });

  void addLike() {
    numberOfLikes++;
  }

  void removeLike() {
    numberOfLikes--;
  }

  void addComment(Comment comment) {
    comments.add(comment);
  }

  void addBookmark() {
    numberOfSaves++;
  }

  void removeBookmark() {
    numberOfSaves--;
  }
}

List<Quote> quotes = [
  Quote(
    "Darkness Cannot drive out darkness. Only light can.",
    'KING',
    numberOfLikes: 127,
    comments: getRandomComments(2),
  ),
  Quote(
    "You can observe a lot just by watching.",
    'YOGI BERRA',
    numberOfLikes: 203,
    comments: getRandomComments(2),
  ),
  Quote(
    "Fate is in your hands and no one elses",
    'BYRON PULSIFER',
    numberOfLikes: 112,
    comments: getRandomComments(2),
  ),
  Quote(
    "Nothing happens unless first we dream.",
    'CARL SANDBURG',
    numberOfLikes: 165,
    comments: getRandomComments(2),
  ),
  Quote(
    "Life is a learning experience, only if you learn.",
    'YOGI BERRA',
    numberOfLikes: 221,
    comments: getRandomComments(2),
  ),
  Quote(
    "Peace comes from within. Do not seek it without.",
    'BUDDHA',
    numberOfLikes: 135,
    comments: getRandomComments(2),
  ),
  Quote(
    "Well begun is half done. ",
    'ARISTOTLE',
    numberOfLikes: 169,
    comments: getRandomComments(2),
  ),
  Quote(
    "Study the past, if you would divine the future.",
    'CONFUCIUS',
    numberOfLikes: 169,
    comments: getRandomComments(2),
  ),
];
