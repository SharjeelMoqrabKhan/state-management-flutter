import 'dart:async';

enum CounterEvent {
  increment,
  decrement,
  reset,
}

class Counter {
  StreamController<int> _counterStreamController = StreamController<int>();
  StreamSink<int> get counterSink => _counterStreamController.sink;
  Stream<int> get counterStream => _counterStreamController.stream;

  StreamController<CounterEvent> _eventConrtoller =
      StreamController<CounterEvent>();
  StreamSink<CounterEvent> get eventSink => _eventConrtoller.sink;
  Stream<CounterEvent> get eventStream => _eventConrtoller.stream;

  int count = 0;

  Counter() {
    eventStream.listen((event) {
      if (event == CounterEvent.increment) {
        count++;
      } else if (event == CounterEvent.decrement) {
        if (count > 0) {
          count--;
        }
      } else {
        count = 0;
      }
      counterSink.add(count);
    });
  }
}
