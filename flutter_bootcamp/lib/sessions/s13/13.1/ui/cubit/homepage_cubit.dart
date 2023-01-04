import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp/sessions/s13/13.1/data/entity/person.dart';
import 'package:flutter_bootcamp/sessions/s13/13.1/data/repo/person_repository.dart';

class HomePageCubit extends Cubit<List<Person>> {
  HomePageCubit() : super(<Person>[]);

  var pRepo = PersonRepository();

  Future<void> showAllPerson() async {
    var list = await pRepo.showAllPerson();
    emit(list);
  }

  Future<void> search(String searchWord) async {
    var list = await pRepo.search(searchWord);
    emit(list);
  }

  Future<void> delete(int person_id) async {
    await pRepo.delete(person_id);
    await showAllPerson();
  }
}
