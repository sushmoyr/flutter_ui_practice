import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/quote_app_ui/data/quote.dart';
import 'package:flutter_ui_practice/quote_app_ui/values/colors.dart';
import 'package:flutter_ui_practice/quote_app_ui/values/constants.dart';
import 'package:flutter_ui_practice/quote_app_ui/values/styles.dart';
import 'package:flutter_ui_practice/quote_app_ui/widgets/quote_bottom_bar.dart';

class DailyQuoteScreen extends StatelessWidget {
  const DailyQuoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: const QuoteBottomBar(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            DefaultAppBar(),
            Expanded(
              child: Row(
                children: [
                  const RotatedBox(
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
            SizedBox(
              height: 200,
              child: Container(
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Label extends StatelessWidget {
  const Label({Key? key, required this.icon, required this.label})
      : super(key: key);
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        SizedBox(
          width: 8,
        ),
        Text(
          label,
          style: AppTextStyles.labelSmall,
        ),
      ],
    );
  }
}

class DefaultAppBar extends StatefulWidget {
  const DefaultAppBar({Key? key}) : super(key: key);

  @override
  State<DefaultAppBar> createState() => _DefaultAppBarState();
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      leading: IconButton(
        onPressed: () {},
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.zero,
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
      trailing: Text(
        '3/12',
        style: AppTextStyles.labelLarge,
      ),
    );
  }
}

class QuoteCarousel extends StatefulWidget {
  const QuoteCarousel({Key? key, this.onPageChanged}) : super(key: key);

  final Function(double page)? onPageChanged;

  @override
  State<QuoteCarousel> createState() => _QuoteCarouselState();
}

class _QuoteCarouselState extends State<QuoteCarousel> {
  late final PageController controller;
  late double page;

  @override
  void initState() {
    page = 0;
    controller = PageController();
    controller.addListener(pageListener);
    super.initState();
  }

  void pageListener() {
    //print(controller.page!);
    if (controller.page != null) {
      widget.onPageChanged?.call(controller.page!);
      setState(() {
        page = controller.page!;
      });
    }
  }

  @override
  void dispose() {
    controller.removeListener(pageListener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          for (int i = quotes.length - 1; i >= 0; i--)
            Transform.translate(
              offset: _getOffset(i),
              child: QuoteCard(
                angle: _getAngle(i),
                opacity: _getOpacity(i),
                quote: quotes[i],
              ),
            ),
          PageView.builder(
            pageSnapping: true,
            reverse: true,
            physics: const BouncingScrollPhysics(),
            controller: controller,
            itemBuilder: (context, index) => Container(),
            itemCount: quotes.length,
          ),
        ],
      ),
    );
  }

  double _getAngle(int index) {
    return (pi / 180) * (8 * (page - index));
  }

  Offset _getOffset(int index) {
    double diff = page - index;
    double offset = MediaQuery.of(context).size.width * diff;

    if (diff > 0) {
      return Offset(offset, 0);
    } else {
      return const Offset(0, 0);
    }
  }

  double _getOpacity(int index) {
    var diff = page - index;
    return (1 - (diff * 0.33).abs()).clamp(0, 1);
  }
}

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Label(icon: Icons.favorite_border, label: '127'),
            Label(icon: Icons.mode_comment_outlined, label: '36'),
            Label(icon: Icons.bookmark_border_outlined, label: '21'),
          ],
        ),
      ],
    );
  }
}
