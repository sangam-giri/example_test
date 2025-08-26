import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:example_proj/src/features/todos/domain/usecases/get_todos.dart';
import 'package:example_proj/src/features/todos/presentation/bloc/todo_bloc.dart';
import 'package:example_proj/src/features/todos/presentation/pages/todo_page.dart';
import 'package:dartz/dartz.dart';

class MockGetTodos extends Mock implements GetTodos {}

void main() {
  late MockGetTodos mockGetTodos;

  setUp(() {
    mockGetTodos = MockGetTodos();
  });

  testWidgets('renders TodoPage', (tester) async {
    when(mockGetTodos.execute()).thenAnswer((_) async => Right([]));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (_) => TodoBloc(getTodos: mockGetTodos),
          child: const TodoPage(),
        ),
      ),
    );

    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
