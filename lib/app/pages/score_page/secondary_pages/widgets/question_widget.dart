import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  final String question;
  final bool isTrueOrFalse;
  final bool useDivider;
  final bool isBonus;
  final Color mainColor;
  final Color secondaryColor;
  const QuestionWidget({
    Key? key,
    required this.question,
    this.isTrueOrFalse = false,
    this.useDivider = true,
    this.isBonus = false,
    required this.mainColor,
    required this.secondaryColor,
  }) : super(key: key);

//  static void resetPoints() {
//    set
//  };
  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int points = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.question,
              style: TextStyle(
                fontSize: 25,
                color: widget.mainColor,
                fontWeight: FontWeight.w300,
              ),
            ),
            const Spacer(),
            widget.isBonus
                ? BouncingWidget(
                    duration: const Duration(milliseconds: 100),
                    scaleFactor: 1.5,
                    onPressed: () {},
                    child: Container(
                      width: 155,
                      height: 25,
                      decoration: BoxDecoration(
                        color: widget.mainColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Text(
                        "None/Duck/Team",
                        style: TextStyle(
                            color: widget.secondaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : widget.isTrueOrFalse
                    ? BouncingWidget(
                        duration: const Duration(milliseconds: 100),
                        scaleFactor: 1.5,
                        onPressed: () {},
                        child: Container(
                          width: 100,
                          height: 25,
                          decoration: BoxDecoration(
                            color: widget.mainColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Text(
                            "No/Yes",
                            style: TextStyle(
                                color: widget.secondaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : Row(
                        children: [
                          BouncingWidget(
                            duration: const Duration(milliseconds: 100),
                            scaleFactor: 1.5,
                            onPressed: () {
                              setState(() {
                                if (points > 0) {
                                  points--;
                                }
                              });
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
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "$points",
                            style: TextStyle(
                                color: widget.secondaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          BouncingWidget(
                            duration: const Duration(milliseconds: 100),
                            scaleFactor: 1.5,
                            onPressed: () {
                              setState(() {
                                points++;
                              });
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
