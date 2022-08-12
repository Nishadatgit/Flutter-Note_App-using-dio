import 'package:flutter/material.dart';
import 'package:noteapp/screens/addnote.dart';
import 'package:noteapp/screens/note_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.dark(),
      home:const NoteHomeScreen(),
    );
  }
}
