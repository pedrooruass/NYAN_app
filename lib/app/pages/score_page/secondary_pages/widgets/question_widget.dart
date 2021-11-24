import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  final String question;
  final bool isTrueOrFalse;
  final bool useDivider;
  final bool isBonus;
  final Color mainColor;
  final Color secondaryColor;
  final void Function(int) onPressedPlusLess;
   final int points;
  const QuestionWidget({
    Key? key,
    required this.question,
    this.isTrueOrFalse = false,
    this.useDivider = true,
    this.isBonus = false,
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
                    onPressed: () => widget.onPressedPlusLess(widget.points),
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
                    ? Row(
                      children: [
                        BouncingWidget(
                            duration: const Duration(milliseconds: 100),
                            scaleFactor: 1.5,
                            onPressed: () => widget.onPressedPlusLess(widget.points),
                            child: Container(
                              width: 50,
                              height: 25,
                              decoration: BoxDecoration(
                                color: widget.mainColor,
                                borderRadius:
                                    const BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
                              ),
                              child: Text(
                                "No",
                                style: TextStyle(
                                    color: widget.secondaryColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        BouncingWidget(
                            duration: const Duration(milliseconds: 100),
                            scaleFactor: 1.5,
                            onPressed: () => widget.onPressedPlusLess(widget.points),
                            child: Container(
                              width: 50,
                              height: 25,
                              decoration: BoxDecoration(
                                color: widget.mainColor,
                                borderRadius:
                                    const BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
                              ),
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                    color: widget.secondaryColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
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
                                if(widget.points > 0){
                                widget.onPressedPlusLess(widget.points - 1);}
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
                                widget.onPressedPlusLess(widget.points + 1);
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
