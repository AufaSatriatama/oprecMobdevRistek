import 'package:flutter/material.dart';

import '../model/todo.dart';
import '../screens/edit_task.dart';


class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border : Border.all(color: Colors.grey.shade300),
      ),
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        
        onTap: () {
          onToDoChanged(todo);
          // print('Clicked on Todo Item.');
          Navigator.push(context, MaterialPageRoute(builder: (context) => edit_task(todo: todo)));
        },
        shape: RoundedRectangleBorder(
          
          borderRadius: BorderRadius.circular(20),
          
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        
        tileColor: Colors.white,
        
        //leading: Icon(
        //  todo.isPriority ? Icons.check_box : Icons.check_box_outline_blank,
          
          
        //),
        title: Text(

          
          
          todo.todoText!,
          style: TextStyle(
            fontSize: 16,
            
            color: Colors.black,
            //decoration: todo.isPriority ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            //color: Colors.black12,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(
            todo.isPriority ? Icons.radio_button_on : Icons.radio_button_off,
            color: Color(0xFF4B49AC),
          ),
           
          ),
        ),
      );
    
  }
}