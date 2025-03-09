class ToDo {
  String? id;
  String? todoText;
  String? description;
  bool isDone;
  bool isPriority;

  ToDo({
    required this.id,
    required this.todoText,
    required this.description,
    this.isDone = false,
    this.isPriority = false,

  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Morning Excercise', description:"", isDone: true ),
      ToDo(id: '02', todoText: 'Buy Groceries', description:"", isDone: false ),
      ToDo(id: '03', todoText: 'Check Emails', description:"", isDone: true,isPriority: true ),

    ];
  }

  void printAll(){
    for (var todo in todoList()) {
      print(todo.todoText);
    }
  }

  String getText(){
    return this.todoText!;
  }

  bool status(){
    return isDone;
  }

  String getDescription(){
    return description!;
  }

  void setDescription(String description){
    this.description = description;
  }

  set title(String title) => this.todoText = title;

  void setTitle(String title){
    this.todoText = title;
  }
}