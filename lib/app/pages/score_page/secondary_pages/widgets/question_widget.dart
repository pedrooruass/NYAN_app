import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/widgets/row_navigator_button_widget.dart';

class QuestionWidget extends StatefulWidget {
  final String? text;
  final bool useDivider;
  final bool isPlussOrLess;
  final Color mainColor;
  final Color secondaryColor;
  final void Function(int)? onPressedPlusLess;
  final void Function(int)? onPressedIndex;
  final int points;
  final double sizeQuestionText;
  final int index;
  final String name1;
  final String name2;
  final String? name3;
  final double width;
  final Color? textColor;
  const QuestionWidget({
    Key? key,
    this.text,
    this.isPlussOrLess = true,
    this.useDivider = true,
    this.sizeQuestionText = 25.0,
    required this.mainColor,
    required this.secondaryColor,
    this.onPressedPlusLess,
    this.onPressedIndex,
    this.points = 0,
    this.index = 0,
    this.name1 = "Name1",
    this.name2 = "Name2",
    this.name3,
    this.width = 122,
    this.textColor,
  }) : super(key: key);

//  static void resetPoints() {
//    set
//  };
  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.text != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.text!,
                    style: TextStyle(
                      fontSize: widget.sizeQuestionText,
                      color: widget.textColor ?? widget.mainColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  widget.isPlussOrLess
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width * 0.32,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BouncingWidget(
                                duration: const Duration(milliseconds: 100),
                                scaleFactor: 1.5,
                                onPressed: () {
                                  if (widget.onPressedPlusLess != null) {
                                    if (widget.points > 0) {
                                      widget.onPressedPlusLess!(
                                          widget.points - 1);
                                    }
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
                                  if (widget.onPressedPlusLess != null) {
                                    widget
                                        .onPressedPlusLess!(widget.points + 1);
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
                        )
                      : RowNavigatorWidget(
                          indexSelected: widget.index,
                          width: widget.width,
                          name1: widget.name1,
                          name2: widget.name2,
                          name3: widget.name3 ?? widget.name3,
                          mainColor: widget.mainColor,
                          secondaryColor: widget.secondaryColor,
                          onTap: (touchValue) {
                            setState(() {
                              if (widget.onPressedIndex != null) {
                                widget.onPressedIndex!(touchValue);
                              }
                            });
                          },
                        ),
                ],
              )
            : widget.isPlussOrLess
                ? SizedBox(
                    width: MediaQuery.of(context).size.width * 0.32,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BouncingWidget(
                          duration: const Duration(milliseconds: 100),
                          scaleFactor: 1.5,
                          onPressed: () {
                            if (widget.onPressedPlusLess != null) {
                              if (widget.points > 0) {
                                widget.onPressedPlusLess!(widget.points - 1);
                              }
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 50,
                            height: 25,
                            decoration: BoxDecoration(
                              color: widget.mainColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
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
                            if (widget.onPressedPlusLess != null) {
                              widget.onPressedPlusLess!(widget.points + 1);
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 50,
                            height: 25,
                            decoration: BoxDecoration(
                              color: widget.mainColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
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
                  )
                : RowNavigatorWidget(
                    indexSelected: widget.index,
                    width: widget.width,
                    name1: widget.name1,
                    name2: widget.name2,
                    name3: widget.name3 ?? widget.name3,
                    mainColor: widget.mainColor,
                    secondaryColor: widget.secondaryColor,
                    onTap: (touchValue) {
                      setState(() {
                        if (widget.onPressedIndex != null) {
                          widget.onPressedIndex!(touchValue);
                        }
                      });
                    },
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
