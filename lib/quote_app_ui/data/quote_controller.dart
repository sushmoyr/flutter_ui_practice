import 'package:flutter/material.dart';

class QuoteController extends ChangeNotifier {
  late final PageController controller;
  late double page;
  void Function(double page)? onPageChanged;

  QuoteController() {
    initController();
  }

  void initController() {
    page = 0;
    controller = PageController();
    controller.addListener(pageListener);
  }

  void pageListener() {
    //print(controller.page!);
    if (controller.page != null) {
      onPageChanged?.call(controller.page!);
      page = controller.page!;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    controller.removeListener(pageListener);
    controller.dispose();
    super.dispose();
  }
}
