import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:todoapp/core/helper/data_base_helper.dart';
import 'package:todoapp/feature/model/todo_model.dart';

void main ()async{
  DatabaseHelper databaseHelper=DatabaseHelper();
  setUp(() {
    sqfliteFfiInit(); // Initialize sqflite ffi library for tests
    databaseFactory = databaseFactoryFfi; // Set sqflite ffi database factory
  });

   test("check if get todos and insert todo works", ()async {

    final todo1 = Todo(
      title: 'Test Todo 1',
      isDone: false,
    );

    await databaseHelper.insertTodo(todo1);
    final todos = await databaseHelper.getTodos();

    expect(todos.length, 1);

  });


  test('Update Todo', () async {

    final updatedTodo = Todo(
      id: 1,
      title: 'Updated Todo',
      isDone: true,
    );

    await databaseHelper.updateTodo(updatedTodo);

    final todos = await databaseHelper.getTodos();


    expect(todos[0].title, 'Updated Todo');
    expect(todos[0].isDone, true);
  });

  test('Delete Todo', () async {

    await databaseHelper.deleteTodo(1);

    final todos = await databaseHelper.getTodos();

    expect(todos.length, 0);
  });
}