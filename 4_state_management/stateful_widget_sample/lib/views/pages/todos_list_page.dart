import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../views.dart';

class TodosListPage extends StatefulWidget {
  const TodosListPage({Key? key}) : super(key: key);

  @override
  _TodosListPageState createState() => _TodosListPageState();
}

class _TodosListPageState extends State<TodosListPage> {
  final List<Todo> _todos = <Todo>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODOアプリ'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final todo = _todos[index];
          return Dismissible(
            key: ObjectKey(todo),
            onDismissed: (direction) {
              setState(() => _todos.removeAt(index));
            },
            child: Card(
              color: todo.isCompleted ? Colors.greenAccent : null,
              child: ListTile(
                title: Text(todo.name),
                onTap: () {
                  setState(() => _todos[index].toggle());
                },
                trailing: todo.isCompleted
                    ? const Icon(
                        Icons.done,
                        color: Colors.green,
                      )
                    : null,
              ),
            ),
          );
        },
        itemCount: _todos.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showTodoAddDialog(
              context: context,
              onAdd: (name) =>
                  setState(() => _todos.insert(0, Todo(name: name))));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
