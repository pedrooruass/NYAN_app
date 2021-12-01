class RedEndGameModel {
  int cD;
  int shippingH;
  int sharedH;
  int parked1;
  int parked2;
  int capping;
  RedEndGameModel({
    this.cD = 0,
    this.shippingH = 0,
    this.sharedH = 0,
    this.parked1 = 0,
    this.parked2 = 0,
    this.capping = 0,
  });

  int calcCD() => cD * 6;

  int calcShippingH() {
    if (shippingH == 1) {
      return 10;
    }
    return 0;
  }
  int calcSharedH() {
    if (sharedH == 1) {
      return 20;
    }
    return 0;
  }

  int calcParked1() {
    if (parked1 == 1) {
      return 3;
    } else if(parked1 == 2) {
      return 6;
    }
    return 0;
  }
  int calcParked2() {
    if (parked2 == 1) {
      return 3;
    } else if(parked2 == 2) {
      return 6;
    }
    return 0;
  }
  int calcCapping() {
    if (capping == 1) {
      return 15;
    } else if(capping == 2) {
      return 30;
    }
    return 0;
  }

  int calcTotal() {
    return calcCD() + calcShippingH() + calcSharedH() + calcParked1() + calcParked2() + calcCapping();
  }

  void resetPoints() {
    cD = 0;
    shippingH = 0;
    sharedH = 0;
    parked1 = 0;
    parked2 = 0;
    capping = 0;
  }
}
