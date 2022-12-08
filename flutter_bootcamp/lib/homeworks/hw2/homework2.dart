class Homework2 {
  double interiorAngleCalculator(int edges) {
    double res = ((edges - 2) * 180) / edges;
    return res;
  }

  void salary(int day) {
    int dailyHour = day * 8;
    int res1 = 0;
    int res2 = 0;
    for (int i = 1; i <= dailyHour; i++) {
      if (i <= 150) {
        res1 += 40;
      } else {
        res2 = (dailyHour - 150) * 80;
      }
    }
    print(res1 + res2);
  }

  int parkingFee(int time) {
    int calc = 0;
    if (time <= 1) {
      calc += 50;
    } else {
      calc = 50 + (time - 1) * 10;
    }
    return calc;
  }

  double celciusToFahrenhiet(int c) {
    double f = (c * 1.8) + 32;
    return f;
  }

  void perimeter(int edge1, int edge2) {
    int calc = 2 * (edge1 + edge2);
    print(calc);
  }

  int factorCalc(int num) {
    int calc = 1;
    if (num == 1 || num == 0) {
      calc = 1;
    } else {
      for (int i = num; i >= 1; i--) {
        calc *= i;
      }
    }
    return calc;
  }

  void aFinder(String word) {
    int low = "a".allMatches(word).length;
    int up = "A".allMatches(word).length;
    print(low + up);
  }
}
