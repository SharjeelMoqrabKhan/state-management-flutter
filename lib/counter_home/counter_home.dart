import 'package:flutter/material.dart';
import 'package:state_managment/counter_bloc/counter_bloc.dart';

class CounterHome extends StatefulWidget {
  @override
  _CounterHomeState createState() => _CounterHomeState();
}

class _CounterHomeState extends State<CounterHome> {
  final counterBloc = Counter();

  @override
  void dispose(){
    counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        centerTitle: true,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.eventSink.add(CounterEvent.increment);
            },
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.eventSink.add(CounterEvent.decrement);
            },
            child: Icon(Icons.minimize_outlined),
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.eventSink.add(CounterEvent.reset);
            },
            child: Icon(Icons.restore),
          ),
        ],
      ),
      body: Center(
        child: StreamBuilder<int>(
            stream: counterBloc.counterStream,
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
