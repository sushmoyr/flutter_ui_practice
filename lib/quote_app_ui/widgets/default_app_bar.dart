import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/quote_app_ui/data/quote.dart';
import 'package:flutter_ui_practice/quote_app_ui/data/quote_controller.dart';
import 'package:flutter_ui_practice/quote_app_ui/values/constants.dart';
import 'package:flutter_ui_practice/quote_app_ui/values/styles.dart';
import 'package:provider/provider.dart';

class DefaultAppBar extends StatefulWidget {
  const DefaultAppBar({Key? key}) : super(key: key);

  @override
  State<DefaultAppBar> createState() => _DefaultAppBarState();
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  @override
  Widget build(BuildContext context) {
    var currentQuote = context.watch<QuoteController>().page.toInt() + 1;
    var totalQuotes = quotes.length;
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
        '$currentQuote/$totalQuotes',
        style: AppTextStyles.labelLarge,
      ),
    );
  }
}
