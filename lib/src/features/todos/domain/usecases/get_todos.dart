import 'package:example_proj/src/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:example_proj/src/features/todos/domain/entities/todo.dart';
import 'package:example_proj/src/features/todos/domain/repositories/todo_repository.dart';

class GetTodos {
  final TodoRepository repository;

  GetTodos(this.repository);

  Future<Either<Failure, List<Todo>>> execute() async {
    return await repository.getTodos();
  }
}
