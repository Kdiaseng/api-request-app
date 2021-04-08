import 'package:app_request_api/src/controllers/home_controller.dart';
import 'package:app_request_api/src/models/todo_model.dart';
import 'package:app_request_api/src/repositories/todo_repositoty.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class TodosRepositoryMock extends Mock implements TodoRepository {}

main() {
  final repository = TodosRepositoryMock();

  final controller = HomeController(repository);
  test('deve preencher a variavel todos', () async {
    when(repository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);

    await controller.start();
    expect(controller.todos.isNotEmpty, true);
  });
}
