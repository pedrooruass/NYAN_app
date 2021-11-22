import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';

class QuestionWidget extends StatelessWidget {
  final String question;
  final bool isTrueOrFalse;
  final bool useDivider;
  final bool isBonus;
  final Color mainColor;
  final Color secondaryColor;
  const QuestionWidget(
      {Key? key,
      required this.question,
      this.isTrueOrFalse = false,
      this.useDivider = true,
      this.isBonus = false,
      required this.mainColor,
      required this.secondaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              question,
              style: TextStyle(
                fontSize: 25,
                color: mainColor,
                fontWeight: FontWeight.w300,
              ),
            ),
            const Spacer(),
            isBonus
                ? BouncingWidget(
                        duration: const Duration(milliseconds: 100),
                        scaleFactor: 1.5,
                        onPressed: () {},
                        child: Container(
                          width: 155,
                          height: 25,
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Text(
                            "None/Duck/Team",
                            style: TextStyle(
                                color: secondaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                : isTrueOrFalse
                    ? BouncingWidget(
                        duration: const Duration(milliseconds: 100),
                        scaleFactor: 1.5,
                        onPressed: () {},
                        child: Container(
                          width: 100,
                          height: 25,
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Text(
                            "No/Yes",
                            style: TextStyle(
                                color: secondaryColor,
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
                            onPressed: () {},
                            child: Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 25,
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Text(
                                "-",
                                style: TextStyle(
                                  color: secondaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: Text(
                              "0",
                              style: TextStyle(
                                  color: secondaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          BouncingWidget(
                            duration: const Duration(milliseconds: 100),
                            scaleFactor: 1.5,
                            onPressed: () {},
                            child: Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 25,
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Text(
                                "+",
                                style: TextStyle(
                                    color: secondaryColor,
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
        if (useDivider)
          Divider(
            color: secondaryColor,
            thickness: 2,
          ),
      ],
    );
  }
}
