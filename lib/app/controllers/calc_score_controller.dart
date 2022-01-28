import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nyan_app/app/models/blue_autonomous_model.dart';
import 'package:nyan_app/app/models/blue_driver_controlled_model.dart';
import 'package:nyan_app/app/models/end_game_model.dart';
import 'package:nyan_app/app/models/red_autonomous_model.dart';
import 'package:nyan_app/app/models/red_driver_controlled_model.dart';
import 'package:nyan_app/app/models/red_end_game_model.dart';

class CalcScoreController extends GetxController {
  Rx<BlueAutonomousModel> blueAutonomous = BlueAutonomousModel().obs;
  Rx<RedAutonomousModel> redAutonomous = RedAutonomousModel().obs;
  Rx<BlueDriverControlledModel> blueDriverControlled =
      BlueDriverControlledModel().obs;
  Rx<RedDriverControlledModel> redDriverControlled =
      RedDriverControlledModel().obs;
  Rx<BlueEndGameModel> blueEndGame = BlueEndGameModel().obs;
  Rx<RedEndGameModel> redEndGame = RedEndGameModel().obs;

  int calcBlueTotalScore() {
    int totalScore = 0;
    totalScore += blueAutonomous.value.calcTotal();
    totalScore += blueDriverControlled.value.calcTotal();
    totalScore += blueEndGame.value.calcTotal();
    return totalScore;
  }

  int calcRedTotalScore() {
    int totalScore = 0;
    totalScore += redAutonomous.value.calcTotal();
    totalScore += redDriverControlled.value.calcTotal();
    totalScore += redEndGame.value.calcTotal();
    return totalScore;
  }

  void refreshClass() {
    blueAutonomous.refresh();
    redAutonomous.refresh();
    blueDriverControlled.refresh();
    redDriverControlled.refresh();
    blueEndGame.refresh();
    redEndGame.refresh();
  }
}
