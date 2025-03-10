import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobdev/screens/home.dart';
import '../model/todo.dart';


class edit_task extends StatelessWidget {
  final ToDo todo;
  //TextEditingController todo2Controller = TextEditingController();

  edit_task({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return MaterialApp(
    //  title: 'Task Manager',
    //  theme: ThemeData(
    //    primarySwatch: Colors.deepPurple,
        //fontFamily: 'SF Pro Display',
    //  ),
    //  home:  EditTaskScreen(todo: todo),
    //  debugShowCheckedModeBanner: false,
   // );
    return EditTaskScreen(todo: todo);
  }
}

class EditTaskScreen extends StatefulWidget {
  ToDo todo;
  EditTaskScreen({Key? key, required this.todo}) : super(key: key);

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late ToDo todo;
  String title = "";
  String desc = "";
  bool isPriority = false;

  // Deklarasikan controller tanpa inisialisasi
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  DateTime startDate = DateTime(2022, 2, 21);
  DateTime endDate = DateTime(2022, 3, 3);
  String selectedCategory = "Daily Task";

  @override
  void initState() {
    super.initState();
    // Inisialisasi todo2 dari widget
    todo = widget.todo;
    title = todo.getText();
    desc = todo.getDescription();
    isPriority = todo.isPriority;

    // Inisialisasi controller dengan data dari todo2
    _titleController = TextEditingController(text: todo.todoText);
    _descriptionController = TextEditingController(text: todo.description);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveTitle(String value){
    setState(() {
      todo.setTitle(value);
      todo.title = _titleController.text;
    });
  }



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
                        Navigator.pop(context);
                        Navigator.of(context).pop(todo);
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
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          todo.getText(),
                          style: TextStyle(
                            fontSize: 40,
                          
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6949FF),
                          ),),

                      ),
                      
                      const SizedBox(height: 15),
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
                        onChanged: (value){
                          _saveTitle(value);
                        },
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
                            child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: const Color(0xFFE0E0E0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Priority Task',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
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
                      
                      // Confirm changes Task Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            
                            final updateTodo = ToDo(
                              id: todo.id,
                              todoText: _titleController.text,
                              description: _descriptionController.text,
                              isPriority: todo.isPriority,
                            );

                            //setState(() {
                            //  todo.title = _titleController.text;
                            //  todo.description = _descriptionController.text;
                            //});
                            Navigator.pop(context);
                            Navigator.of(context).pop(updateTodo);
                            //todo.setTitle(_titleController.text);
                            //todo.title = _titleController.text;
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6949FF),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          
                          child: const Text(
                            'Confirm Changes',
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
}