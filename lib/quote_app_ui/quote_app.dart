import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/quote_app_ui/daily_quote_screen.dart';
import 'package:flutter_ui_practice/quote_app_ui/data/quote_controller.dart';
import 'package:provider/provider.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuoteController>(
      create: (BuildContext context) => QuoteController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quote App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DailyQuoteScreen(),
      ),
    );
  }
}
