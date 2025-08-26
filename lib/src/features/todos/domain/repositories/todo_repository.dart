import 'package:example_proj/src/core/error/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:example_proj/src/features/todos/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<Todo>>> getTodos();
}
