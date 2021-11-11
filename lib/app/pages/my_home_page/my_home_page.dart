import 'package:flutter/material.dart';
import 'package:nyan_app/app/pages/my_home_page/widgets/my_app_bar_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBarWidget(
        context: context,
        height: MediaQuery.of(context).size.height * 0.55,
      ),
    );
  }
}
