import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/plus_less_widget.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/row_navigator_button_widget.dart';

class QuestionWidget extends StatefulWidget {
  final String text;
  final bool useDivider;
  final bool isPlussOrLess;
  final void Function(int)? onPressedPlusLess;
  final void Function(int)? onPressedIndex;
  final int points;
  final Color? dividerColor;
  final double sizeQuestionText;
  final int index;
  final String name1;
  final String name2;
  final String? name3;
  final double width;
  const QuestionWidget({
    Key? key,
    required this.text,
    this.isPlussOrLess = true,
    this.useDivider = true,
    this.sizeQuestionText = 23.0,
    this.onPressedPlusLess,
    this.onPressedIndex,
    this.points = 0,
    this.dividerColor,
    this.index = 0,
    this.name1 = "Name1",
    this.name2 = "Name2",
    this.name3,
    this.width = 0.00079,
  }) : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Question
            AutoSizeText(
              widget.text,
              style: TextStyle(
                fontSize: widget.sizeQuestionText,
                color: AppColors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            widget.isPlussOrLess
                ? PlusLessWidget(
                    onPressedPlusLess: widget.onPressedPlusLess,
                    points: widget.points,
                  )
                : RowNavigatorButtonWidget(
                    indexSelected: widget.index,
                    width: MediaQuery.of(context).size.width * widget.width,
                    name1: widget.name1,
                    name2: widget.name2,
                    name3: widget.name3 ?? widget.name3,
                    onTap: (touchValue) {
                      setState(() {
                        if (widget.onPressedIndex != null) {
                          widget.onPressedIndex!(touchValue);
                        }
                      });
                    },
                  ),
          ],
        ),
        if (widget.useDivider)
          Divider(
            color: widget.dividerColor ?? AppColors.white,
            thickness: 2,
          ),
      ],
    );
  }
}
