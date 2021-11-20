import 'package:flutter/material.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/alliance_names_page/alliance_names.dart';
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
  int index = 0;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      StartPage(
        onPressed: () {
          setState(() {
            index++;
          });
        },
      ),
      AllianceNames(
        onPressed: () {
          setState(() {
            index++;
          });
        },
      ),
      const LiquidSwipeView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: pages[index],
        ),
      ],
    );
  }
}
