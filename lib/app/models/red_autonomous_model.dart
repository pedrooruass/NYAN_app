class RedAutonomousModel {
  bool isDuckDelivered;
  int fstorage;
  int fhub;
  bool isRobot1Parked;
  bool isRobot2Parked;
  bool isR1PInStorageUnit;
  bool isR2PInStorageUnit;
  bool isR1PCompletely;
  bool isR2PCompletely;
  int fBonus1;
  int fBonus2;

  RedAutonomousModel({
    this.isDuckDelivered = false,
    this.fstorage = 0,
    this.fhub = 0,
    this.isRobot1Parked = false,
    this.isRobot2Parked = false,
    this.isR1PInStorageUnit = true,
    this.isR2PInStorageUnit = true,
    this.isR1PCompletely = false,
    this.isR2PCompletely = false,
    this.fBonus1 = 0,
    this.fBonus2 = 0,
  });

  int calcDuckDelivered() {
    if (isDuckDelivered) {
      return 10;
    }
    return 0;
  }

  int calcFstorage() => fstorage * 2;

  int calcFhub() => fhub * 6;

  int calcFparking1() {
    if (isR1PInStorageUnit && isR1PCompletely) {
      return 6;
    } else if (!isR1PInStorageUnit && !isR1PCompletely) {
      return 5;
    } else if (!isR1PInStorageUnit && isR1PCompletely) {
      return 10;
    }
    return 3;
  }

  int calcFparking2() {
    if (isR2PInStorageUnit && isR2PCompletely) {
      return 6;
    } else if (!isR2PInStorageUnit && !isR2PCompletely) {
      return 5;
    } else if (!isR2PInStorageUnit && isR2PCompletely) {
      return 10;
    }
    return 3;
  }

  int calcFbonus1() {
    if (fBonus1 == 2) {
      return 20;
    } else if (fBonus1 == 1) {
      return 10;
    }
    return 0;
  }
  int calcFbonus2() {
    if (fBonus2 == 2) {
      return 20;
    } else if (fBonus2 == 1) {
      return 10;
    }
    return 0;
  }

  int calcTotal() {
    int scoreTotal =
        calcDuckDelivered() + calcFstorage() + calcFhub() + calcFbonus1() + calcFbonus2();
    if (isRobot1Parked) {
      scoreTotal += calcFparking1();
    }
    if (isRobot2Parked) {
      scoreTotal += calcFparking2();
    }
    return scoreTotal;
  }

  void resetPoints() {
    isDuckDelivered = false;
    fstorage = 0;
    fhub = 0;
    isR1PInStorageUnit = true;
    isR2PInStorageUnit = true;
    isR1PCompletely = false;
    isR2PCompletely = false;
    fBonus1 = 0;
    fBonus2 = 0;
    isRobot1Parked = false;
    isRobot2Parked = false;

  }
}
