



//BIKIN LIST BARU
// Definisi kelas ToDo
class ToDo {
  String id;
  String todoText;
  String description;
  bool isPriority;
  //bool isN;
  
  ToDo({
    required this.id,
    required this.todoText,
    this.description = '',
    this.isPriority = false,
    //this.isN = false,
  });

  String getText(){
    return this.todoText!;
  }

  bool status(){
    return isPriority;
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
      ToDo(id: '01', todoText: 'Morning Exercise', description: "", isPriority: true),
      ToDo(id: '02', todoText: 'Buy Groceries', description: "", isPriority: false),
      ToDo(id: '03', todoText: 'Check Emails', description: "", isPriority: true),
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
      print('Id: ${todo.id}, Task: ${todo.todoText}, Completed: ${todo.isPriority}');
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
    ToDo(id: '04', todoText: 'New Task', description: "Description baru", isPriority: false)
  );
  
  // Mengembalikan dan menampilkan list ToDo
  List<ToDo> todos = manager.getTodos();
  manager.printTodos();
}
