import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/todo_item.dart';
import '../model/todo.dart';
import 'create_task.dart';
import 'profile.dart';
import 'edit_task.dart';

class HomeScreen extends StatefulWidget {
  

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _todoManager = ToDoManager();
  late List<ToDo> todosList;
  final _todoController = TextEditingController();
  List<ToDo> _foundToDo = [];
  //final _todoController = TextEditingController();

  void _navigateAndSendData(ToDo todo) async {
    //final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => edit_task(todo: todo)));
   final result = await Navigator.push(
    context, 
    MaterialPageRoute(builder: (context) => edit_task(todo: todo)));

    if (result != null && result is ToDo) {
      setState(() {
      final index = todosList.indexWhere((item) => item.id == result.id);
      if (index != -1) {
        todosList[index] = result;
        _foundToDo = List.from(todosList);
        //_foundToDo = todosList;
        _todoManager.updateTodo(result);
      }
      });
      
    }
    
  }


  @override
  void initState() {
    //_foundToDo = todosList;
    super.initState();
    _todoManager.initTodos();
    todosList = _todoManager.getTodos();
    _foundToDo = List.from(todosList);
    //_foundToDo = todosList;
  }

  @override
  Widget build(BuildContext context) {

    void _onItemTapped(int index){
      if (index == 0) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
      }
      
    }


  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
        description: "",
      ));
    });
    _todoController.clear();
  }

    return Scaffold(
      appBar: _buildAppbar(),
      body: Container(
        child: ListView(
          children: [
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Greeting(),
              SizedBox(height: 10),
              dailyTaskTitle(),
              SizedBox(height: 10),
              for (ToDo todoo in _foundToDo.reversed)
                ToDoItem(
                  todo: todoo, 
                  onToDoChanged: _handleToDoChange, 
                  onDeleteItem: _deleteToDoItem,)
            ],
            )
          ]

          
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), 
            label: "Person",)
        ]),
    );
  }

  void _handleToDoChange(ToDo todo) {
    //setState(() {
      //todo.isDone = !todo.isDone;
    //});
    _navigateAndSendData(todo);

  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }
}

AppBar _buildAppbar(){
  DateTime now = DateTime.now();
  String dayName = DateFormat('EEEE', 'en').format(now);  // Changed from 'id_ID' to 'id'
  String namaBulan = DateFormat('MMMM', 'en').format(now);  // Changed from 'id_ID' to 'id'
  String tanggal = DateFormat('dd', 'en').format(now);
  String tahun = DateFormat('yyyy', 'en').format(now);
  

  return AppBar(
      automaticallyImplyLeading: false,
      title: Text("$dayName $namaBulan $tanggal $tahun",
        style: TextStyle(
          fontWeight: FontWeight.w200,
          fontSize: 15
        ),
      ),
    );
  
}



class Greeting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Pastikan teks mulai dari kiri
        children: [
          Text(
            "Welcome abc!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 3), // Tambahkan sedikit jarak antara teks
          Text(
            "Have a great day!",
            textAlign: TextAlign.left, // Opsional, karena sudah crossAxisAlignment.start
          ),
        ],
      ),
    );
  }
}


class dailyTaskList extends StatefulWidget{
  @override
  _dailyTaskListState createState() => _dailyTaskListState();
}

class _dailyTaskListState extends State<dailyTaskList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Task List")
        ],
      )
    );
  }
}

class dailyTaskTitle extends StatelessWidget {
  //int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(10),
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [
          Text(
            "Daily Task",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),
          ),
          ElevatedButton(
            
            onPressed: () async{
              final result = await Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => create_task())
              );

              if (result != null && result is ToDo) {
                final homeState = context.findAncestorStateOfType<_HomeScreenState>();
                if (homeState != null) {
                  homeState.setState(() {
                    homeState.todosList.add(result);
                    homeState._foundToDo = homeState.todosList;
                  });
                }
              }
              
              //Navigator.push(context, MaterialPageRoute(builder: (context) => create_task()));
            }, 
              style: ElevatedButton.styleFrom(
                
                backgroundColor: Colors.blueAccent, // Warna latar belakang
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Bikin rounded
                ),
                //minimumSize: Size(10, 40),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical:1), // Ukuran padding biar lonjong
              ),
            child: (

              Text("Add Task",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 15
                ),
              )
            ),  
          )
        ],
      )
    );
  }
}





