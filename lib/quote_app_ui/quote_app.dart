import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/quote_app_ui/daily_quote_screen.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DailyQuoteScreen(),
    );
  }
}
