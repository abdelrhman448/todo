import 'package:get/get.dart';
import 'package:todoapp/core/helper/data_base_helper.dart';
import 'package:todoapp/feature/model/todo_model.dart';

class TodoController extends GetxController {
  List<Todo> todoList=[];
  List<Todo> completeList=[];

  getTodo()async{
    final databaseList= await DatabaseHelper().getTodos();
    todoList=databaseList.where((element) => !element.isDone).toList();
    completeList=databaseList.where((element) => element.isDone).toList();
    update();
  }

  addTodo({required String todoTitle})async{
    Todo addedTodo=Todo(title:todoTitle ,isDone: false);
    await DatabaseHelper().insertTodo(addedTodo);
    getTodo();
  }

  updateTodoStatus({required Todo todo,required value})async{
    changeCheckBoxStatus(todo: todo,value: value);
    Future.delayed(const Duration(milliseconds: 300),()async{
      await DatabaseHelper().updateTodo(todo);
      getTodo();
    });

  }

  updateTodoTitle({required Todo todo})async{
    Future.delayed(const Duration(milliseconds: 300),()async{
      await DatabaseHelper().updateTodo(todo);
      getTodo();
    });

  }

  deleteTodo({required Todo todo})async{
    await DatabaseHelper().deleteTodo(todo.id!);
    getTodo();
  }

  changeCheckBoxStatus({required Todo todo,required value}){
    todo.isDone=value;
    update();
  }



}