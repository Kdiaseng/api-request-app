import 'package:app_request_api/src/repositories/todo_repositoty.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final repository = TodoRepository();
  test('deve trazer uma lista de todo model', () async {
    final list = await repository.fetchTodos();
    expect(list[0].title, 'delectus aut autem');
  });
}
