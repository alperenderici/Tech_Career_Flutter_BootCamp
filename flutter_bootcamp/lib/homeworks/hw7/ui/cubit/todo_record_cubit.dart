import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp/homeworks/hw7/data/repo/todo_repository.dart';

class TodoRecordCubit extends Cubit<void> {
  TodoRecordCubit() : super(0);

  var todoRepo = TodoRepository();
  Future<void> save(String todo_name, String todo_description) async {
    await todoRepo.save(todo_name, todo_description);
  }
}
