import 'package:flutter/material.dart';

class Autonomous extends StatelessWidget {
  const Autonomous({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Autonomous',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 35,
            color: Colors.green,
          ),
          textAlign: TextAlign.center,
        ),

      ],
    );
  }
}
