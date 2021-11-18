import 'package:flutter/material.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/autonomous_page/autonomous_1.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/liquid_swipe_view_page/liquid_swipe_view.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/start_page/start_page.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        StartPage(),
        LiquidSwipeView(),
      ],
    );
  }
}
