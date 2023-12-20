class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Check Emails', isDone: true ),
      ToDo(id: '02', todoText: 'Do homework', isDone: true ),
      ToDo(id: '03', todoText: 'Prepare interview', ),
      ToDo(id: '04', todoText: 'Team Meeting', ),
      ToDo(id: '05', todoText: 'Work on mobile apps for 2 hour', ),
    ];
  }
}