import 'package:flutter/material.dart';
import 'package:todoapp/core/helper/data_base_helper.dart';
import 'feature/view/todo/todo_screen.dart';
import 'package:get/get.dart';
GlobalKey<NavigatorState> todoNavigatorKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsBinding widgetsBinding=WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: todoNavigatorKey,
      title: 'Todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NoteListScreen()
    );
  }
}

