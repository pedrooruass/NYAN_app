import 'package:flutter/material.dart';
import 'package:nyan_app/app/pages/score_app/extra_pages/autonomous.dart';
import 'package:nyan_app/app/pages/score_app/extra_pages/start_page.dart';
class ScorePage extends StatelessWidget {
  const ScorePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        StartPage(),
        Autonomous(),
      ],
    );
  }
}