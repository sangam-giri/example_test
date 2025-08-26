import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:example_proj/src/features/todos/presentation/bloc/todo_bloc.dart';
import 'package:example_proj/src/features/todos/presentation/pages/todo_page.dart';
import 'package:example_proj/src/features/todos/domain/entities/todo.dart';

import 'mocks/get_todos_mocks.mocks.dart'; // <- generated mock

void main() {
  late MockGetTodos mockGetTodos;

  setUp(() {
    mockGetTodos = MockGetTodos();
  });

  testWidgets('renders TodoPage', (tester) async {
    // properly type-safe stub
    when(mockGetTodos.execute()).thenAnswer((_) async => Right(<Todo>[]));

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
