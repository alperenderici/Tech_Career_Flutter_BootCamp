import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp/sessions/s13/13.1/data/repo/person_repository.dart';

class PersonRecordCubit extends Cubit<void> {
  PersonRecordCubit() : super(0);

  var pRepo = PersonRepository();

  Future<void> save(String person_name, String person_num) async {
    await pRepo.save(person_name, person_num);
  }
}
