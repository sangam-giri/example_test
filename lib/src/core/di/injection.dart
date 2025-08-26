import 'package:example_proj/src/core/network/api_client.dart';
import 'package:example_proj/src/features/todos/data/repositories/todo_repository_impl.dart';
import 'package:example_proj/src/features/todos/data/sources/todo_remote_data_source.dart';
import 'package:example_proj/src/features/todos/domain/repositories/todo_repository.dart';
import 'package:example_proj/src/features/todos/domain/usecases/get_todos.dart';
import 'package:example_proj/src/features/todos/presentation/bloc/todo_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // Bloc
  sl.registerFactory(() => TodoBloc(getTodos: sl()));

  // UseCase
  sl.registerLazySingleton(() => GetTodos(sl()));

  // Repository
  sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(sl()));

  // Data source
  sl.registerLazySingleton(() => TodoRemoteDataSource(sl()));

  // ApiClient
  sl.registerLazySingleton(() => ApiClient());
}
