class MathRepository {
  int sumOperation(String receivedNum1, String receivedNum2) {
    int newNum1 = int.parse(receivedNum1);
    int newNum2 = int.parse(receivedNum2);
    int sum = newNum1 + newNum2;
    return sum;
  }

  int mulOperation(String receivedNum1, String receivedNum2) {
    int newNum1 = int.parse(receivedNum1);
    int newNum2 = int.parse(receivedNum2);
    int mul = newNum1 * newNum2;
    return mul;
  }
}
