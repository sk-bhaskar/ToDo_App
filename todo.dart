class ToDo{
  String? id;
  String? ToDoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.ToDoText,
    this.isDone = false,
  });

  static List<ToDo> todoList(){
    return[
      ToDo(id: '01', ToDoText: "you are hello", isDone: true),
      ToDo(id: '02', ToDoText: "you are ndhjb", isDone: true),
      ToDo(id: '03', ToDoText: "you are sbdchjb", ),
      ToDo(id: '04', ToDoText: "you are hesdhjb", ),
      ToDo(id: '05', ToDoText: "you are psndbchgv",),
      ToDo(id: '06', ToDoText: "you are kjhbvc", ),
      ToDo(id: '07', ToDoText: "you are vbhjvbj", ),
      ToDo(id: '08', ToDoText: "you are ihgchfdxc", ),
    ];
  }
}
