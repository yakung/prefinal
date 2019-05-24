import 'package:flutter/material.dart';
import '../models/todoUtil.dart';
import './friendInfo.dart';
import '../models/user.dart';

class TodoScreen extends StatefulWidget {
  int id;
  String name;
  Todo user;
  TodoScreen({Key key, this.id, this.name, this.user}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return TodoScreenState();
  }
}

class TodoScreenState extends State<TodoScreen> {
  TodosProviders todoProvider = TodosProviders();

  Widget listTodos(BuildContext context, AsyncSnapshot snapshot) {
    int id = widget.id;
    print(id);
    List<Todo> todos = snapshot.data;
    return Expanded(
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: InkWell(
              child: Column(
                children: <Widget>[
                  Text(
                    todos[index].id.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  Text(
                    todos[index].title,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    todos[index].completed ? "Completed" : "",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int id = widget.id;
    String name = widget.name;
    Todo myself = widget.user;
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                    child: Text("Back"),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FriendInfoScreen(
                                id: id,
                                name: name,
                                user: myself,
                              ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            FutureBuilder(
              future: todoProvider.loadTodo(id.toString()),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return listTodos(context, snapshot);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
