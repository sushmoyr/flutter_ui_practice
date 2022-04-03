import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/quote_app_ui/data/quote.dart';
import 'package:flutter_ui_practice/quote_app_ui/data/quote_controller.dart';
import 'package:flutter_ui_practice/quote_app_ui/values/colors.dart';
import 'package:flutter_ui_practice/quote_app_ui/values/constants.dart';
import 'package:flutter_ui_practice/quote_app_ui/values/styles.dart';
import 'package:provider/provider.dart';

class QuoteStats extends StatelessWidget {
  const QuoteStats({Key? key, required this.quote}) : super(key: key);

  final Quote quote;

  @override
  Widget build(BuildContext context) {
    var currentIndex = context.read<QuoteController>().page.toInt();
    var currentQuote = quotes[currentIndex];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Label(
          icon: Icons.favorite_border,
          selectedIcon: Icons.favorite,
          label: currentQuote.numberOfLikes.toString(),
          onSelectionChange: (value) {
            value ? currentQuote.addLike() : currentQuote.removeLike();
          },
        ),
        Label(
          icon: Icons.mode_comment_outlined,
          label: currentQuote.numberOfComments.toString(),
        ),
        Label(
          icon: Icons.bookmark_border_outlined,
          label: currentQuote.numberOfSaves.toString(),
          selectedIcon: Icons.bookmark,
          selected: currentQuote.isSaved,
        ),
      ],
    );
  }
}

class Label extends StatefulWidget {
  const Label(
      {Key? key,
      required this.icon,
      required this.label,
      this.selected = false,
      this.onSelectionChange,
      this.selectedIcon})
      : super(key: key);
  final IconData icon;
  final String label;
  final bool selected;
  final IconData? selectedIcon;
  final Function(bool value)? onSelectionChange;

  @override
  State<Label> createState() => _LabelState();
}

class _LabelState extends State<Label> {
  late bool selected;

  @override
  void initState() {
    selected = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget selectedIcon = Icon(
      widget.selectedIcon ?? widget.icon,
      color: AppColors.teal,
    );
    Widget unSelectedIcon = Icon(
      widget.icon,
      color: Colors.black,
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: widget.onSelectionChange != null
              ? () {
                  setState(() {
                    selected = !selected;
                    widget.onSelectionChange?.call(selected);
                  });
                }
              : null,
          child: AnimatedSwitcher(
            duration: duration500,
            child: selected ? selectedIcon : unSelectedIcon,
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          widget.label,
          style: AppTextStyles.labelSmall,
        ),
      ],
    );
  }
}
