import 'package:flutter/material.dart';
import 'package:flutter_application_1/awal.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Awal() ,
    );
  }
}

