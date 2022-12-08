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
}
