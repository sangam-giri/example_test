import 'package:dartz/dartz.dart';
import 'package:example_proj/src/core/error/failure.dart';
import 'package:example_proj/src/features/todos/data/sources/todo_remote_data_source.dart';
import 'package:example_proj/src/features/todos/domain/entities/todo.dart';
import 'package:example_proj/src/features/todos/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource remoteDataSource;
  TodoRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Todo>>> getTodos() async {
    try {
      final todos = await remoteDataSource.fetchTodos();
      return Right(todos);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
