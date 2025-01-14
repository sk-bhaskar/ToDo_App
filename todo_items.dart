import 'package:flutter/material.dart';

import '../screens/todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo toDo;
  final onToDoChanged;
  final onDeleteItem;

  const TodoItem({super.key, required this.toDo,required this.onToDoChanged,required this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
          onTap: (){
            //print("Clicked on todo item");
            onToDoChanged(toDo);
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          tileColor: Colors.white,
          leading: Icon(
           toDo.isDone? Icons.check_box: Icons.check_box_outline_blank,
            color: Colors.blueAccent,),
          title: Text(toDo.ToDoText!,
            style: TextStyle(fontSize: 21,
              decoration: toDo.isDone? TextDecoration.lineThrough: null,
            ),
          ),
          trailing: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
              ),
            child: IconButton(
              color: Colors.white,
              iconSize: 18,
              icon: Icon(Icons.delete),
              onPressed: (){
                //print("Clicked on delete icon");
                onDeleteItem(toDo.id);
              },
            ),
          ),
        )
    );
  }
}
