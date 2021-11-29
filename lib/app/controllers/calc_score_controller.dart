import 'package:nyan_app/app/models/autonomous_model.dart';
import 'package:nyan_app/app/models/driver_controlled_model.dart';

class CalcScoreController {
  AutonomousModel autonomous = AutonomousModel();
  DriverControlledModel driverControlled = DriverControlledModel();
  //TODO EndGameModel endGame = EndGameModel();

  int calcTotalScore() {
    int totalScore = 0;
    totalScore += autonomous.calcTotal();
    totalScore += driverControlled.calcTotal();
    //score += endGame.calcEndGameScore();
    return totalScore;
  }
}
