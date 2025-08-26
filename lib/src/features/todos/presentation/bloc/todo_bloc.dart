import 'package:example_proj/src/features/todos/domain/entities/todo.dart';
import 'package:example_proj/src/features/todos/domain/usecases/get_todos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodos getTodos;

  TodoBloc({required this.getTodos}) : super(TodoInitial()) {
    on<LoadTodos>((event, emit) async {
      emit(TodoLoading());
      final result = await getTodos.execute();
      result.fold(
        (failure) => emit(TodoError(message: failure.message)),
        (todos) => emit(TodoLoaded(todos: todos)),
      );
    });
  }
}
