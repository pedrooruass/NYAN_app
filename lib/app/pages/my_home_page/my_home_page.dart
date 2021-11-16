import 'package:flutter/material.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/pages/my_home_page/widgets/my_app_bar_widget.dart';
import 'package:nyan_app/app/pages/my_home_page/widgets/my_bottom_navigation_bar_widget.dart';
import 'package:nyan_app/app/pages/rules_app/rules_page.dart';
import 'package:nyan_app/app/pages/score_app/score_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 1;
  final PageController pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: MyAppBarWidget(
        context: context,
        height: MediaQuery.of(context).size.height * 0.55,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                    spreadRadius: 1,
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height * 0.85,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  children: const [
                    RulesPage(),
                    ScorePage(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBarWidget(
        selectedIndex: selectedIndex,
        onChanged: (index) {
        setState(() {
          selectedIndex = index;
          pageController.jumpToPage(selectedIndex);
        });
      },
      ),
    );
  }
}


/* -------------------------------- // Extra -------------------------------- */
// AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: Image.asset(
//           "assets/Source Logo.png",
//           height: 400,
//           width: 400,
//         ),
//         title: const Text(
//           'NYAN TEAM',
//           style: TextStyle(color: Colors.white),
//         ),
//         actions: [
//           Image.asset(
//             "assets/robot.png",
//           ),
//         ],
//       ),
/* -------------------------------------------------------------------------- */