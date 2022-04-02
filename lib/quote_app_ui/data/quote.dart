import 'package:flutter_ui_practice/quote_app_ui/data/Comment.dart';

class Quote {
  final String quote;
  final String author;
  int numberOfLikes;
  int numberOfSaves;
  List<Comment> comments;
  int get numberOfComments => comments.length;

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
  Quote("Darkness Cannot drive out darkness. Only light can.", 'King'),
  Quote("Darkness Cannot drive out darkness. Only light can.", 'King'),
  Quote("Darkness Cannot drive out darkness. Only light can.", 'King'),
  Quote("Darkness Cannot drive out darkness. Only light can.", 'King'),
  Quote("Darkness Cannot drive out darkness. Only light can.", 'King'),
  Quote("Darkness Cannot drive out darkness. Only light can.", 'King'),
  Quote("Darkness Cannot drive out darkness. Only light can.", 'King'),
];
