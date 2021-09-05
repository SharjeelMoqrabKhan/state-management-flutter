import 'package:flutter/material.dart';
import 'package:state_managment/counter_bloc/counter_bloc.dart';

class CounterHome extends StatelessWidget {
  final counterBloc = Counter();
  @override
  Widget build(BuildContext context) {
    int count = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++;
          counterBloc.counterIncreament.add(count);
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: StreamBuilder<int>(
            stream: counterBloc.showCounterIncrement,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  "${snapshot.data.toString()}",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                );
              }
              return Text(
                "0",
                style: TextStyle(
                  fontSize: 32,
                ),
              );
            }),
      ),
    );
  }
}
