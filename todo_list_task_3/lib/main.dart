import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_task_3/pages/home_page.dart';
import 'package:todo_list_task_3/pages/second_page.dart';
import 'package:todo_list_task_3/pages/third_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => TodoListProvider()),
      ChangeNotifierProvider(create: (context) => TodoFormProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.orange),
    );
  }
}
