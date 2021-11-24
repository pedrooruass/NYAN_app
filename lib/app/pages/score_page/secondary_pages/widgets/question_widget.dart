import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/row_navigator_button_widget.dart';

class QuestionWidget extends StatefulWidget {
  final String question;
  final bool isTrueOrFalse;
  final bool useDivider;
  final bool isBonus;
  final Color mainColor;
  final Color secondaryColor;
  final void Function(int) onPressedPlusLess;
  final int points;
  final double sizeQuestionText;
  const QuestionWidget({
    Key? key,
    required this.question,
    this.isTrueOrFalse = false,
    this.useDivider = true,
    this.isBonus = false,
    this.sizeQuestionText = 25.0,
    required this.mainColor,
    required this.secondaryColor,
    required this.onPressedPlusLess,
    required this.points,
  }) : super(key: key);

//  static void resetPoints() {
//    set
//  };
  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.question,
              style: TextStyle(
                fontSize: widget.sizeQuestionText,
                color: widget.mainColor,
                fontWeight: FontWeight.w300,
              ),
            ),
            const Spacer(),
            widget.isBonus
                ? RowNavigatorWidget(
                    indexSelected: index,
                    name1: "None",
                    name2: "Duck",
                    name3: "Team",
                    mainColor: widget.mainColor,
                    secondaryColor: widget.secondaryColor,
                    onTap: (touchValue) {
                      setState(() {
                        index = touchValue;
                      });
                    },
                  )
                : widget.isTrueOrFalse
                    ? RowNavigatorWidget(
                        indexSelected: index,
                        name1: "No",
                        name2: "Yes",
                        mainColor: widget.mainColor,
                        secondaryColor: widget.secondaryColor,
                        onTap: (touchValue) {
                          setState(() {
                            index = touchValue;
                          });
                        },
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.32,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BouncingWidget(
                              duration: const Duration(milliseconds: 100),
                              scaleFactor: 1.5,
                              onPressed: () {
                                if (widget.points > 0) {
                                  widget.onPressedPlusLess(widget.points - 1);
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: widget.mainColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                ),
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    color: widget.secondaryColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Text(
                              "${widget.points}",
                              style: TextStyle(
                                  color: widget.secondaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            BouncingWidget(
                              duration: const Duration(milliseconds: 100),
                              scaleFactor: 1.5,
                              onPressed: () {
                                widget.onPressedPlusLess(widget.points + 1);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: widget.mainColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                ),
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      color: widget.secondaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
          ],
        ),
        if (widget.useDivider)
          Divider(
            color: widget.secondaryColor,
            thickness: 2,
          ),
      ],
    );
  }
}
