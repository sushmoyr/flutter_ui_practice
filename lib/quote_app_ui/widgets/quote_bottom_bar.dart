import 'package:flutter/material.dart';

class QuoteBottomBar extends StatelessWidget {
  const QuoteBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBottomNavigationBarHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.save_alt),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share_outlined),
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.bookmark_add_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
