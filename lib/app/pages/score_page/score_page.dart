import 'package:flutter/material.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/autonomous_page/widgets/liquid_swipe_autonomous_view.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/driver_controlled_page/widget/liquid_swipe_driver_controlled.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/end_game_page/widgets/liquid_swipe_end_game.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/final_score_page/final_score.dart';
import 'package:nyan_app/app/pages/score_page/secondary_pages/start_page/start_page.dart';

class ScorePage extends StatefulWidget {
  final void Function(int) onPageChanged;
  final int index;
  const ScorePage({
    Key? key,
    required this.onPageChanged,
    required this.index,
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
            widget.onPageChanged(1);
            index = 1;
          });
        },
      ),
      LiquidSwipeAutonomousView(
        onPressed: () {
          setState(() {
            widget.onPageChanged(2);
            index = 2;
          });
        },
      ),
      LiquidSwipeDriverControlledView(onPressedNext: () {
        setState(() {
          widget.onPageChanged(3);
          index = 3;
        });
      }, onPressedBack: () {
        setState(() {
          widget.onPageChanged(1);
          index = 1;
        });
      }),
      LiquidSwipeEndGameView(
        onPressedBack: () {
          setState(() {
            widget.onPageChanged(2);
            index = 2;
          });
        },
        onPressedNext: () {
          setState(() {
            widget.onPageChanged(4);
            index = 4;
          });
        },
      ),
      const FinalScore(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    index = widget.index;

    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
              position: Tween<Offset>(
                // Diagonal, but try vertical
                begin: const Offset(2, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          child: pages[index],
        ),
      ],
    );
  }
}
