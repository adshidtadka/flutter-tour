import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/models.dart';
import '../views.dart';

final todoProvider = StateProvider<List<Todo>>((ref) => []);

class TodosListPage extends HookConsumerWidget {
  final String title;

  const TodosListPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final todo = todos[index];
          return Dismissible(
            key: ObjectKey(todo),
            onDismissed: (direction) {
              ref.read(todoProvider.notifier).state =
                  todos.where((t) => t != todo).toList();
            },
            child: Card(
              color: todo.isCompleted ? Colors.greenAccent : null,
              child: ListTile(
                title: Text(todo.name),
                onTap: () {
                  ref.read(todoProvider.notifier).state = todos
                      .asMap()
                      .entries
                      .map((e) => e.key == index ? e.value.toggle() : e.value)
                      .toList();
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
        itemCount: todos.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showTodoAddDialog(
            context: context,
            onAdd: (name) => {
              ref.read(todoProvider.notifier).state = [
                ...todos,
                Todo(
                  name: name,
                  isCompleted: false,
                ),
              ]
            },
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
