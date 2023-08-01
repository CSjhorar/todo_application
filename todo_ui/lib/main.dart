import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_ui/models/tasks_data.dart';
import 'package:todo_ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TasksData>(
        create: (context) => TasksData(),
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
        ));
  }
}
