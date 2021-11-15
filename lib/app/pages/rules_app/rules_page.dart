import 'package:flutter/material.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /* ------------------------------- Autonomous ------------------------------- */
        const Text(
          'Autonomous',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25,
            color: Colors.green,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'The Autonomous period is the period of time which the robot is in control of it. During this period, the robot is just allowed to move autonomously without any human intervention. It is the most important part, it is the part that shows if your team is good at coding or not.',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          textAlign: TextAlign.center,
        ),
        const Divider(
          thickness: 2,
          color: Colors.grey,
        ),
        /* --------------------------- Driver Crontrolled --------------------------- */
        const Text(
          'Driver Controlled',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25,
            color: Colors.orange,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'The Driver Controlled period is the period of time in which 2 drivers are allowed to grab the controllers and be in control of all the robot. In this part, the communication and teamwork are so important.',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          textAlign: TextAlign.center,
        ),
        const Divider(
          thickness: 2,
          color: Colors.grey,
        ),
        /* -------------------------------- End Game -------------------------------- */
        const Text(
          'End Game',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25,
            color: Colors.red,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'The End Game period is the last period of the match. The last 30 seconds that points count the most. During this period, It is important to have a great ability to work with your teammate and your alliance to get the most points possible.',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 25,
        ),
        Image.asset(
          "assets/ftc.png",
          height: 45,
        ),
      ],
    );
  }
}
