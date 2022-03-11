import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nyan_app/app/controllers/calc_score_controller.dart';
import 'package:nyan_app/app/core/theme/app_colors.dart';
import 'package:nyan_app/app/pages/my_home_page/widgets/my_bottom_navigation_bar_widget.dart';
import 'package:nyan_app/app/pages/rules_page/rules_page.dart';
import 'package:nyan_app/app/pages/score_page/score_page.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 1;
  int scoreIndex = 0;
  late CalcScoreController controller = Get.find();
  final PageController pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      extendBodyBehindAppBar: false,
      extendBody: false,
      appBar:
      // appBar: MyAppBarWidget(
      //   context: context,
      //   onPressed1: () {
      //     setState(() {
      //       scoreIndex = 0;
      //     });
      //     controller.blueAutonomous.value.resetPoints();
      //     controller.blueDriverControlled.value.resetPoints();
      //     controller.blueEndGame.value.resetPoints();
      //     controller.redAutonomous.value.resetPoints();
      //     controller.redDriverControlled.value.resetPoints();
      //     controller.redEndGame.value.resetPoints();
      //     controller.refreshClass();
      //   },
      //   onPressed2: () async {
      //     const url = "https://instagram.com/nyanrobotics";
      //     if (await canLaunch(url)) {
      //       await launch(url);
      //     } else {
      //       throw 'Could not launch $url';
      //     }
      //   },
      //   height: 50,
      // ),
       AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: BouncingWidget(
            onPressed: () {
              setState(() {
                scoreIndex = 0;
              });
              controller.blueAutonomous.value.resetPoints();
              controller.blueDriverControlled.value.resetPoints();
              controller.blueEndGame.value.resetPoints();
              controller.redAutonomous.value.resetPoints();
              controller.redDriverControlled.value.resetPoints();
              controller.redEndGame.value.resetPoints();
              controller.refreshClass();
            },
            child: Image.asset(
              "assets/o_brabo.png",
              width: MediaQuery.of(context).size.width * 0.43,
            ),
          ),
        ), // Put onPressed
        actions: [ 
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
                right: MediaQuery.of(context).size.width * 0.03),
            child: BouncingWidget(
              onPressed: () async {
                const url = "https://instagram.com/nyanrobotics";
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Icon(
                FontAwesomeIcons.instagram,
                size: 25,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: MyBottomNavigationBarWidget(
              selectedIndex: selectedIndex,
              onChanged: (index) {
                setState(() {
                  selectedIndex = index;
                  pageController.jumpToPage(selectedIndex);
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: AppColors.grey,
                  //     blurRadius: 3,
                  //     spreadRadius: 1,
                  //   ),
                  // ],
                ),
                height: MediaQuery.of(context).size.height * 0.77,
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
                    children: [
                      const RulesPage(),
                      ScorePage(
                        onPageChanged: (index) {
                          setState(() {
                            scoreIndex = index;
                          });
                        },
                        index: scoreIndex,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar:
    );
  }
}
