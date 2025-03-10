import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobdev/screens/home.dart';
import '../model/todo.dart';



class create_task extends StatelessWidget {
  const create_task({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return MaterialApp(
      //title: 'Task Manager',
      //theme: ThemeData(
        //primarySwatch: Colors.deepPurple,
        //fontFamily: 'SF Pro Display',
      //),
      //home: const AddTaskScreen(),
      //debugShowCheckedModeBanner: false,
    //);

    return Scaffold(
      backgroundColor: const Color(0xFF6A3DE8),
      body: const AddTaskScreen(),
    );
  }
}

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime startDate = DateTime(2022, 2, 21);
  DateTime endDate = DateTime(2022, 3, 3);
  final TextEditingController _titleController = TextEditingController(text: null);
  final TextEditingController _descriptionController = TextEditingController(
    text: null
  );
  String selectedCategory = "Daily Task";
  ToDo todosList = ToDo(id: '01', todoText: 'Morning Excercise', description:"", isDone: true );

  //List<ToDo> todosList = ToDo.todoList;
  //List<ToDo> list = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();
  //final _titleController = TextEditingController();

  @override
  //void initState() {
    //_foundToDo = todosList;
    //super.initState();
  //}

    //void _addToDoItem(String toDo) {
    //setState(() {
      //todosList.add(ToDo(
        //id: DateTime.now().millisecondsSinceEpoch.toString(),
        //todoText: toDo,
        //description: "",
      //));
    //});
    //_todoController.clear();
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6949FF),
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Color(0xFF6949FF)),
                      onPressed: () {
                        Navigator.of(context).pop();
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Add Task',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40), // Balance the back button
                ],
              ),
            ),
            
            // Main Content
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Date Row
                      Row(
                        children: [
                          // Start Date
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Start',
                                  style: TextStyle(
                                    color: Color(0xFF6949FF),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                GestureDetector(
                                  onTap: () async {
                                    final DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate: startDate,
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2025),
                                    );
                                    if (picked != null && picked != startDate) {
                                      setState(() {
                                        startDate = picked;
                                      });
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF5F0FF),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.check_box_outline_blank, size: 18, color: Color(0xFF6949FF)),
                                        const SizedBox(width: 8),
                                        Text(
                                          DateFormat('MMM-dd-yyyy').format(startDate),
                                          style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          // End Date
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Ends',
                                  style: TextStyle(
                                    color: Color(0xFF6949FF),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                GestureDetector(
                                  onTap: () async {
                                    final DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate: endDate,
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2025),
                                    );
                                    if (picked != null && picked != endDate) {
                                      setState(() {
                                        endDate = picked;
                                      });
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF5F0FF),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.calendar_today_outlined, size: 18, color: Color(0xFF6949FF)),
                                        const SizedBox(width: 8),
                                        Text(
                                          DateFormat('MMM-dd-yyyy').format(endDate),
                                          style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Title
                      const Text(
                        'Title',
                        style: TextStyle(
                          color: Color(0xFF6949FF),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          hintText: 'Enter task title',
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Color(0xFF6949FF)),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Category
                      const Text(
                        'Category',
                        style: TextStyle(
                          color: Color(0xFF6949FF),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCategory = "Priority Task";
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: selectedCategory == "Priority Task" 
                                      ? const Color(0xFF6949FF) 
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: const Color(0xFFE0E0E0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Priority Task',
                                  style: TextStyle(
                                    color: selectedCategory == "Priority Task" 
                                        ? Colors.white 
                                        : Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCategory = "Daily Task";
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: selectedCategory == "Daily Task" 
                                      ? const Color(0xFF6949FF) 
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: const Color(0xFFE0E0E0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Daily Task',
                                  style: TextStyle(
                                    color: selectedCategory == "Daily Task" 
                                        ? Colors.white 
                                        : Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Description
                      const Text(
                        'Description',
                        style: TextStyle(
                          color: Color(0xFF6949FF),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _descriptionController,
                        maxLines: 6,
                        decoration: InputDecoration(
                          hintText: 'Enter task description',
                          contentPadding: const EdgeInsets.all(16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Color(0xFF6949FF)),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Create Task Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            
                            if (_titleController.text.isNotEmpty){
                              final newTodo = ToDo(
                                id: DateTime.now().millisecondsSinceEpoch.toString(), 
                                todoText: _titleController.text,
                                description: _descriptionController.text,
                                isDone: false,
                                
                                );
                              Navigator.of(context).pop(newTodo);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6949FF),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Create Task',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addToDoItem(String title, String description) {
    final newTodo = ToDo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      todoText: title,
      description: description,
      isDone: false,
      isPriority: selectedCategory == "Priority Task"
    );
    
    // Return the new todo to HomeScreen
    Navigator.pop(context, newTodo);
    }
 
}