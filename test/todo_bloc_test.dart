// test/todo_bloc_test.dart
import 'package:example_proj/src/core/error/failure.dart';
import 'package:example_proj/src/features/todos/domain/entities/todo.dart';
import 'package:example_proj/src/features/todos/domain/usecases/get_todos.dart';
import 'package:example_proj/src/features/todos/presentation/bloc/todo_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';

class MockGetTodos extends Mock implements GetTodos {}

void main() {
  late TodoBloc bloc;
  late MockGetTodos mockGetTodos;

  setUp(() {
    mockGetTodos = MockGetTodos();
    bloc = TodoBloc(getTodos: mockGetTodos);
  });

  final todos = [Todo(id: 1, title: 'Test', completed: false)];

  blocTest<TodoBloc, TodoState>(
    'emits [Loading, Loaded] when successful',
    build: () {
      when(mockGetTodos.execute()).thenAnswer((_) async => Right(todos));
      return bloc;
    },
    act: (bloc) => bloc.add(LoadTodos()),
    expect: () => [isA<TodoLoading>(), isA<TodoLoaded>()],
  );

  blocTest<TodoBloc, TodoState>(
    'emits [Loading, Error] when failure',
    build: () {
      when(
        mockGetTodos.execute(),
      ).thenAnswer((_) async => Left(Failure('Error')));
      return bloc;
    },
    act: (bloc) => bloc.add(LoadTodos()),
    expect: () => [isA<TodoLoading>(), isA<TodoError>()],
  );
}
