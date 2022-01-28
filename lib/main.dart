import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyan_app/app/controllers/calc_score_controller.dart';
import 'app/pages/my_app/my_app.dart';

void main(List<String> args) {
  runApp(const MyApp());
  Get.put(CalcScoreController());
}
