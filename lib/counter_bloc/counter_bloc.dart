import 'dart:async';

class Counter {
  StreamController<int> _counterStreamController = StreamController<int>();
  StreamSink <int> get counterIncreament => _counterStreamController.sink;
  Stream <int> get showCounterIncrement => _counterStreamController.stream;
}
