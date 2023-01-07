import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp/sessions/s14/14.2/data/repo/person_repository.dart';

class PersonDetailCubit extends Cubit<void> {
  PersonDetailCubit() : super(0);

  var pRepo = PersonRepository();
  Future<void> update(
      int person_id, String person_name, String person_num) async {
    await pRepo.update(person_id, person_name, person_num);
  }
}
