import 'dart:math';

class Comment {
  final String author;
  final DateTime time;
  final String body;

  Comment({required this.author, required this.time, required this.body});
}

List<Comment> comments = [
  Comment(
    author: 'John Doe',
    time: DateTime(2022, 4, 3, 8, 10),
    body: 'What a great quote!!',
  ),
  Comment(
    author: 'Alex Mercy',
    time: DateTime(2022, 4, 3, 8, 25),
    body: 'A good day starts with a good quote <3',
  ),
  Comment(
    author: 'Stefan Joe',
    time: DateTime(2022, 4, 3, 9, 00),
    body: 'Absolutely True. ;)',
  ),
  Comment(
    author: 'Michelle Jones',
    time: DateTime(2022, 4, 3, 8, 15),
    body: 'This is inspiring. I love it. :3 :3 <3',
  ),
  Comment(
    author: 'Cliff Halfman',
    time: DateTime(2022, 4, 3, 7, 50),
    body: 'Good Morning Everyone!! Have a wonderful Day.',
  ),
];

List<Comment> getRandomComments(int length) {
  Random random = Random();
  List<Comment> randomComments = [];
  int totalComments = comments.length;
  for (int i = 0; i < length; i++) {
    var index = random.nextInt(totalComments);
    randomComments.add(comments.elementAt(index));
  }

  randomComments.sort((a, b) {
    return a.time.compareTo(b.time);
  });

  return randomComments;
}
