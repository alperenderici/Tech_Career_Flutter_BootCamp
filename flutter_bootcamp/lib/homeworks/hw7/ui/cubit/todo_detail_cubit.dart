import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp/homeworks/hw7/data/repo/todo_repository.dart';

class TodoDetailCubit extends Cubit<void> {
  TodoDetailCubit() : super(0);

  var todoRepo = TodoRepository();
  Future<void> update(
      int todo_id, String todo_name, String todo_description) async {
    await todoRepo.update(todo_id, todo_name, todo_description);
  }
}
