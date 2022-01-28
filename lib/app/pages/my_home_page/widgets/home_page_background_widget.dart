import 'package:flutter/material.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/pages/rules_page/rules_page.dart';
import 'package:nyan_app/app/pages/score_page/score_page.dart';

class HomePageBackgroundWidget extends StatefulWidget {
  final int selectedIndex;
  final int scoreIndex;
  final PageController pageController;
  const HomePageBackgroundWidget(
      {Key? key,
      required this.selectedIndex,
      required this.scoreIndex,
      required this.pageController})
      : super(key: key);

  @override
  State<HomePageBackgroundWidget> createState() =>
      _HomePageBackgroundWidgetState();
}

class _HomePageBackgroundWidgetState extends State<HomePageBackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey,
                  blurRadius: 3,
                  spreadRadius: 1,
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.73,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: PageView(
                controller: widget.pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    // widget.selectedIndex = index;
                  });
                },
                children: [
                  const RulesPage(),
                  ScorePage(
                    onPageChanged: (index) {
                      setState(() {
                        // widget.scoreIndex = index;
                      });
                    },
                    index: widget.scoreIndex,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
