import 'package:flutter/material.dart';
import 'package:state_managment/counter_home/counter_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: CounterHome(),
    );
  }
}
