import 'package:example_proj/src/core/di/injection.dart';
import 'package:example_proj/src/core/di/injection.dart' as di;
import 'package:example_proj/src/features/todos/presentation/bloc/todo_bloc.dart';
import 'package:example_proj/src/features/todos/presentation/pages/todo_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      home: BlocProvider(
        create: (_) => sl<TodoBloc>(),
        child: const TodoPage(),
      ),
    );
  }
}
