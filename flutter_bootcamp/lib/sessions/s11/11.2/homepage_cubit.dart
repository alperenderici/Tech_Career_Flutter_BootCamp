import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp/sessions/s11/11.2/math_repository.dart';

class HomePageCubit extends Cubit<int> {
  //Cubit<int> int will be changed on the screen so that is the type.
  HomePageCubit() : super(0); //default value in super.
  var mrepo = MathRepository();

  void sum(String receivedNum1, String receivedNum2) {
    // int newNum1 = int.parse(receivedNum1);
    // int newNum2 = int.parse(receivedNum2);
    // int sum = newNum1 + newNum2;
    // emit(sum);
    emit(mrepo.sumOperation(receivedNum1, receivedNum2));
  }

  void mul(String receivedNum1, String receivedNum2) {
    // int newNum1 = int.parse(receivedNum1);
    // int newNum2 = int.parse(receivedNum2);
    // int mul = newNum1 * newNum2;
    // emit(mul);
    emit(mrepo.mulOperation(receivedNum1, receivedNum2));
  }
}
