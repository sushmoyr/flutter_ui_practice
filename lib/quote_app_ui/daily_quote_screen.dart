import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/quote_app_ui/data/Comment.dart';
import 'package:flutter_ui_practice/quote_app_ui/values/colors.dart';
import 'package:flutter_ui_practice/quote_app_ui/values/styles.dart';
import 'package:flutter_ui_practice/quote_app_ui/widgets/default_app_bar.dart';
import 'package:flutter_ui_practice/quote_app_ui/widgets/quote_bottom_bar.dart';
import 'package:flutter_ui_practice/quote_app_ui/widgets/quote_carousel.dart';

class DailyQuoteScreen extends StatelessWidget {
  const DailyQuoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: const QuoteBottomBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            const DefaultAppBar(),
            Expanded(
              flex: 8,
              child: Row(
                children: const [
                  RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      'Daily Quotes',
                      style: AppTextStyles.banner,
                    ),
                  ),
                  Expanded(
                    child: QuoteCarousel(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CommentTile(
                    comment: comments.first,
                  ),
                  CommentTile(
                    comment: comments.last,
                  ),
                ],
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.add_comment_outlined),
                suffixIcon: Icon(Icons.send),
                contentPadding: EdgeInsets.zero,
                hintText: 'Write a comment',
                constraints: BoxConstraints(maxHeight: 36),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommentTile extends StatelessWidget {
  const CommentTile({Key? key, required this.comment}) : super(key: key);
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          comment.author.characters.first,
          style: AppTextStyles.bannerMedium,
        ),
        Expanded(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            Text(
              comment.author.substring(1),
              style: AppTextStyles.labelMedium,
            ),
            Text(
              _getTimeAgo(comment.time),
              style: AppTextStyles.caption,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              comment.body,
              style: AppTextStyles.body,
            )
          ],
        )),
      ],
    );
  }

  _getTimeAgo(DateTime time) {
    if (time.day >= 1) {
      return '${time.day} day(s) ago';
    }

    if (time.hour >= 1) {
      return '${time.hour} hour(s) ago';
    }

    if (time.minute >= 1) {
      return '${time.minute} minute(s) ago';
    }

    return 'Just Now';
  }
}
