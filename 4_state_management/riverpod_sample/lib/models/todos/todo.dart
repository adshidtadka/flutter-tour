class Todo {
  Todo({this.isCompleted = false, required this.name});

  bool isCompleted;
  final String name;

  toggle() => {
        isCompleted = !isCompleted,
      };
}
