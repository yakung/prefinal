import 'package:http/http.dart' as http;
import 'dart:convert';

class Todos {
  int id;
  int userId;
  String title;
  bool completed;

  Todos({this.id, this.userId, this.title, this.completed});

  factory Todos.fromJson(Map<String, dynamic> json) {
    return new Todos(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}

class TodosLists {
  final List<Todos> todos;
  TodosLists({
    this.todos,
  });
  factory TodosLists.fromJson(List<dynamic> parsedJson) {
    List<Todos> todos = new List<Todos>();
    todos = parsedJson.map((i) => Todos.fromJson(i)).toList();

    return TodosLists(
      todos: todos,
    );
  }
}

class TodosProviders {
  Future<List<Todos>> loadTodo(String id) async {
    List<Todos> filterTodo = List<Todos>();
    http.Response resp = await http
        .get("https://jsonplaceholder.typicode.com/users/" + id + "/todos");
    final jresp = json.decode(resp.body);
    TodosLists todoList = TodosLists.fromJson(jresp);
    for (int i = 0; i < todoList.todos.length; i++) {
      if (todoList.todos[i].userId.toString() == id) {
        filterTodo.add(todoList.todos[i]);
      }
    }

    return filterTodo;
  }
}
