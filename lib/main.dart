import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_practice/quote_app_ui/quote_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const QuoteApp());
}
