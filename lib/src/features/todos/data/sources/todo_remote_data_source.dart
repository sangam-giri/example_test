import 'dart:convert';
import 'package:example_proj/src/core/network/api_client.dart';
import 'package:example_proj/src/features/todos/data/models/todo_model.dart';

class TodoRemoteDataSource {
  final ApiClient client;
  TodoRemoteDataSource(this.client);

  Future<List<TodoModel>> fetchTodos() async {
    final response = await client.get('https://dummyjson.com/todos');

    if (response.statusCode == 200) {
      final List data =
          (jsonDecode(response.body) as Map<String, dynamic>)['todos'];

      return data.map((json) => TodoModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch todos');
    }
  }
}
