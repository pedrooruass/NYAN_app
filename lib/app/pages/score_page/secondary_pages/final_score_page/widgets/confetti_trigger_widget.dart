import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiTriggerWidget extends StatefulWidget {
  final ConfettiController confettiController;
  final bool isBlue;
  const ConfettiTriggerWidget({Key? key, required this.confettiController, required this.isBlue}) : super(key: key);

  @override
  State<ConfettiTriggerWidget> createState() => _ConfettiTriggerWidgetState();
}

class _ConfettiTriggerWidgetState extends State<ConfettiTriggerWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: () {
            setState(() {
              widget.confettiController.play();
            });
          },
          child: Image.asset(
            widget.isBlue ? "assets/azul.png" : "assets/verm.png",
            height: MediaQuery.of(context).size.height * 0.33,
          ),
    );
  }
}
