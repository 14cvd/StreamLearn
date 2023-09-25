import 'dart:async';

class ModelCounter {
  int counter = 0;

  final StreamController<int> _controller = StreamController<int>.broadcast();
  Stream<int> get streamCounter => _controller.stream;
  Sink get sinkCounter => _controller.sink;

  void add() {
    sinkCounter.add(++counter);
  }

  void remove() {
    sinkCounter.add(--counter);
  }

  ModelCounter() {
    sinkCounter.add(counter);
  }
}
