import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:example_proj/src/features/todos/presentation/bloc/todo_bloc.dart';
import 'package:example_proj/src/features/todos/domain/entities/todo.dart';
import 'package:example_proj/src/core/error/failure.dart';
import 'package:mockito/mockito.dart';
import 'mocks/get_todos_mocks.mocks.dart'; // <- generated mock

void main() {
  late TodoBloc bloc;
  late MockGetTodos mockGetTodos;

  setUp(() {
    mockGetTodos = MockGetTodos();
    bloc = TodoBloc(getTodos: mockGetTodos);
  });

  final todos = [Todo(id: 1, title: 'Test Todo', completed: false)];

  blocTest<TodoBloc, TodoState>(
    'emits [Loading, Loaded] when GetTodos succeeds',
    build: () {
      when(mockGetTodos.execute()).thenAnswer((_) async => Right(todos));
      return bloc;
    },
    act: (bloc) => bloc.add(LoadTodos()),
    expect: () => [isA<TodoLoading>(), isA<TodoLoaded>()],
  );

  blocTest<TodoBloc, TodoState>(
    'emits [Loading, Error] when GetTodos fails',
    build: () {
      when(
        mockGetTodos.execute(),
      ).thenAnswer((_) async => Left(Failure('Failed')));
      return bloc;
    },
    act: (bloc) => bloc.add(LoadTodos()),
    expect: () => [isA<TodoLoading>(), isA<TodoError>()],
  );
}
