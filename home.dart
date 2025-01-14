import 'package:flutter/material.dart';
import 'package:todo_app/screens/todo.dart';

import '../color/color.dart';
import 'package:todo_app/color/todo_items.dart';
class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List <ToDo> _foundToDo =[];
  final _todoController = TextEditingController();


  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("To Do List",style: TextStyle(fontSize: 32,color: Colors.white,fontWeight: FontWeight.bold),),
        toolbarHeight: 60,
        backgroundColor: Colors.black54,
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50,bottom: 20),
                        child: Text("All Tasks",
                          style: TextStyle
                            (fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)
                        ),
                      ),
                      for (ToDo todo in _foundToDo.reversed)
                      TodoItem(toDo: todo,
                          onToDoChanged: _handleToDoChange,
                        onDeleteItem: _deleteToDoItem,
                      ),


                    ],
                  ),
                )
              ],
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: 20,right: 20,left: 20
                ),
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const[BoxShadow(
                            color:Colors.grey,
                        offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),],
                          borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _todoController,
                        decoration: InputDecoration(
                          hintText: "Add a new task",
                          border: InputBorder.none
                        ),
                      ),
                    )
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20,right: 20),
                  child: ElevatedButton(child: Text('+',style: TextStyle(fontSize: 40),),
                  onPressed: (){
                    _addtodoItem(_todoController.text);
                  } ,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    )
                )
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id){
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addtodoItem (String todo){
    setState(() {
      todosList.add(ToDo(id: DateTime.now().microsecondsSinceEpoch.toString(),
          ToDoText: todo)
      );
    });
    _todoController.clear();
  }

  void _runFilter (String enteredKeyword){
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty){
      results=todosList;
    } else {
      results = todosList.where(
              (item)=> item.ToDoText!.toLowerCase().contains(
                  enteredKeyword.toLowerCase())).toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }

  Widget searchBox(){
    return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              onChanged: (value)=>_runFilter(value),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(Icons.search,color: Colors.black54,weight: 50,size: 36,),
                border: InputBorder.none,
                hintText: "Search here",
                hintStyle: TextStyle(
                  fontSize: 32,
                  color: Colors.black54,

                ),
              ),
            )
        );
  }
}

