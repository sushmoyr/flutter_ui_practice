import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/quote_app_ui/data/quote.dart';
import 'package:flutter_ui_practice/quote_app_ui/values/colors.dart';
import 'package:flutter_ui_practice/quote_app_ui/values/constants.dart';
import 'package:flutter_ui_practice/quote_app_ui/values/styles.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard(
      {Key? key, this.angle, this.opacity = 1.0, required this.quote})
      : super(key: key);
  final double? angle;
  final double opacity;
  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Opacity(
          opacity: opacity,
          child: Transform.rotate(
            angle: angle ?? 0,
            child: AspectRatio(
              aspectRatio: 2 / 3.2,
              child: Container(
                padding: EdgeInsets.all(16),
                child: AnimatedOpacity(
                  duration: duration500,
                  curve: Curves.easeInOut,
                  opacity: (opacity > 0.8) ? 1 : 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        quote.quote,
                        style: AppTextStyles.title,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        quote.author,
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ),
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.teal, AppColors.yellow],
                    begin: Alignment.bottomLeft,
                    end: Alignment(1.0, -1.4),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
