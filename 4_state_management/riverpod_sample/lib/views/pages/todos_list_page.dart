import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/models.dart';
import '../views.dart';

final todoProvider = StateProvider<List<Todo>>((ref) => []);

class TodosListPage extends HookConsumerWidget {
  final String title;
  final List<Todo> _todos = <Todo>[];

  TodosListPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final todo = _todos[index];
          return Dismissible(
            key: ObjectKey(todo),
            onDismissed: (direction) {},
            child: Card(
              color: todo.isCompleted ? Colors.greenAccent : null,
              child: ListTile(
                title: Text(todo.name),
                onTap: () {},
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
            onAdd: (name) => {},
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
