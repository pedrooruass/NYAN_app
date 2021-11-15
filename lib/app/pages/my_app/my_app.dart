import 'package:flutter/material.dart';
import 'package:nyan_app/app/pages/my_home_page/my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NYAN Robotics Team",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Kanit',
      ),
      home: const MyHomePage(),
    );
  }
}