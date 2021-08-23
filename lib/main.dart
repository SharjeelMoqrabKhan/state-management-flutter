import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/model/time_info.dart';
import 'package:state_managment/view/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ChangeNotifierProvider(
        //creating the instacne of timerinfo
        create: (context)=>TimerInfo(),
        child: Home(),
      ),
    );
  }
}
