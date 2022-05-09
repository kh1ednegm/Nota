import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nota/Model/note_list_model.dart';
import 'package:nota/home.dart';
import 'package:provider/provider.dart';





void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context)=>Notes(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


