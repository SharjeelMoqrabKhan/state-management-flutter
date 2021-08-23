import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/model/time_info.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int inital = 60;
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (t) {
      var timer = Provider.of<TimerInfo>(context, listen: false);
      timer.updateReamingTime();
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
            Consumer<TimerInfo>(
              builder: (context, data, child) {
                return Text(
                  data.remainingTime.toString(),
                  style: TextStyle(fontSize: 32.0),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
