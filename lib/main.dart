import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/pages/homepage.dart';
import 'package:hive/hive.dart';

void main() async {
  //iniitailise hive
  await Hive.initFlutter();
  //opnbox

  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homepage(),
        theme: ThemeData(primarySwatch: Colors.green));
  }
}
