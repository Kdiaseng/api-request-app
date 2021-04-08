import 'package:app_request_api/src/models/todo_model.dart';
import 'package:app_request_api/src/repositories/todo_repositoty.dart';

class HomeController {
  List<TodoModel> todos = [];
  final TodoRepository _repository;
  HomeState state = HomeState.start;

  HomeController([TodoRepository repository])
      : _repository = repository ?? TodoRepository();

  Future start() async {
    state = HomeState.loading;
    try {
      todos = await _repository.fetchTodos();
      state = HomeState.success;
    } catch (e) {
      state = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }
