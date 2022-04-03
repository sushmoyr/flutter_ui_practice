import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/quote_app_ui/data/quote_controller.dart';
import 'package:flutter_ui_practice/quote_app_ui/widgets/quote_card.dart';
import 'package:flutter_ui_practice/quote_app_ui/widgets/quote_stats.dart';
import 'package:provider/provider.dart';

import '../data/quote.dart';

class QuoteCarousel extends StatefulWidget {
  const QuoteCarousel({Key? key, this.onPageChanged}) : super(key: key);

  final Function(double page)? onPageChanged;

  @override
  State<QuoteCarousel> createState() => _QuoteCarouselState();
}

class _QuoteCarouselState extends State<QuoteCarousel> {
  late final QuoteController quoteController;
  late double page;

  @override
  void initState() {
    quoteController = context.read<QuoteController>();
    page = quoteController.page;
    quoteController.addListener(() {
      setState(() {
        page = quoteController.page;
      });
    });
    super.initState();
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
            controller: quoteController.controller,
            itemBuilder: (context, index) => Container(),
            itemCount: quotes.length,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: QuoteStats(
              quote: quotes[quoteController.page.toInt()],
            ),
          ),
        ],
      ),
    );
  }

  double _getAngle(int index) {
    return (pi / 180) * (8 * (quoteController.page - index));
  }

  Offset _getOffset(int index) {
    double diff = quoteController.page - index;
    double offset = MediaQuery.of(context).size.width * diff;

    if (diff > 0) {
      return Offset(offset, 0);
    } else {
      return const Offset(0, 0);
    }
  }

  double _getOpacity(int index) {
    var diff = quoteController.page - index;
    return (1 - (diff * 0.33).abs()).clamp(0, 1);
  }
}
