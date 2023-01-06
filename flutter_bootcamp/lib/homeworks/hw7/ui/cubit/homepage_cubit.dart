import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp/homeworks/hw7/data/entity/todo.dart';
import 'package:flutter_bootcamp/homeworks/hw7/data/repo/todo_repository.dart';

class HomePageCubit extends Cubit<List<Todo>> {
  HomePageCubit() : super(<Todo>[]);

  var todoRepo = TodoRepository();

  Future<void> list() async {
    var list = await todoRepo.list();
    emit(list);
  }

  Future<void> search(String searchWord) async {
    var list = await todoRepo.search(searchWord);
    emit(list);
  }

  Future<void> delete(int todo_id) async {
    await todoRepo.delete(todo_id);
    await list();
  }
}
