import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

class StartButton extends StatefulWidget {
  final void Function() onPressed;
  const StartButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      duration: const Duration(milliseconds: 100),
      scaleFactor: 1.5,
      onPressed: widget.onPressed,
      child: SizedBox(
        child: Image.asset(
          "assets/10091_GIF_V2.gif",
          // "assets/boxer.gif",
        ),
        height: MediaQuery.of(context).size.height * 0.4, // height: 300
      ),
    );
  }
}
