import 'dart:async';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int inital = 60;
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        if (inital > 0) {
          print('------Starting from stract-----');
          inital--;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Provider Package "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/timer.png',
              scale: 1.0,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '$inital',
              style: TextStyle(fontSize: 32.0),
            )
          ],
        ),
      ),
    );
  }
}
