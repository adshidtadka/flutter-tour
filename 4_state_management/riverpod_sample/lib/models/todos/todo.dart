class Todo {
  Todo({this.isCompleted = false, required this.name});

  bool isCompleted;
  final String name;

  Todo toggle() => _copyWith(isCompleted: !isCompleted);

  Todo _copyWith({bool? isCompleted, String? name}) => Todo(
        name: name ?? this.name,
        isCompleted: isCompleted ?? this.isCompleted,
      );
}
