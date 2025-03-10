class ToDo3 {
  String? id;
  String? todoText;
  String? description;
  bool isDone;
  bool isPriority;

  ToDo3({
    required this.id,
    required this.todoText,
    required this.description,
    this.isDone = false,
    this.isPriority = false,

  });

  static List<ToDo3> returnOneByOne(){
    return todoList();
  }
  
  static List<ToDo3> todoList() {
    return [
      //ToDo(id: '01', todoText: 'Morning Excercise', description:"", isDone: true ),
      //ToDo(id: '02', todoText: 'Buy Groceries', description:"", isDone: false ),
      //ToDo(id: '03', todoText: 'Check Emails', description:"", isDone: true,isPriority: true ),

    ];
  }

  void addNew(String id, String title, String description, bool isDone){
    //ToDo.addList(id, title, description, isDone);
  }

  void printAll(){
    for (var todo in todoList()) {
      print(todo.todoText);
    }
  }

  void test(){
    List<ToDo3> listToDo = todoList();
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



//BIKIN LIST BARU
// Definisi kelas ToDo
class ToDo {
  String id;
  String todoText;
  String description;
  bool isDone;
  bool isPriority;
  
  ToDo({
    required this.id,
    required this.todoText,
    this.description = '',
    this.isDone = false,
    this.isPriority = false,
  });

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

// Kelas manajemen ToDo
class ToDoManager {
  // Variabel private untuk menyimpan list ToDo
  List<ToDo> _todos = [];

  // Method untuk menginisialisasi list ToDo
  void initTodos() {
    _todos = [
      ToDo(id: '01', todoText: 'Morning Exercise', description: "", isDone: true),
      ToDo(id: '02', todoText: 'Buy Groceries', description: "", isDone: false),
      ToDo(id: '03', todoText: 'Check Emails', description: "", isDone: true, isPriority: true),
    ];
  }

  // Method untuk menambahkan ToDo baru ke dalam list
  void addTodo(ToDo newTodo) {
    _todos.add(newTodo);
  }

  // Method untuk mengembalikan list ToDo
  List<ToDo> getTodos() {
    if (_todos.isEmpty) {
      initTodos();
    }
    return _todos;
  }

  // Optional: Method untuk menampilkan detail setiap ToDo menggunakan for loop
  void printTodos() {
    for (var todo in _todos) {
      print('Id: ${todo.id}, Task: ${todo.todoText}, Completed: ${todo.isDone}');
    }
  }
  
}

void main() {
  // Membuat instance manager
  ToDoManager manager = ToDoManager();
  
  // Inisialisasi list ToDo
  manager.initTodos();
  
  // Menambahkan ToDo baru
  manager.addTodo(
    ToDo(id: '04', todoText: 'New Task', description: "Description baru", isDone: false)
  );
  
  // Mengembalikan dan menampilkan list ToDo
  List<ToDo> todos = manager.getTodos();
  manager.printTodos();
}
