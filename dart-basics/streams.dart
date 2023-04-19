import 'dart:async';

void main() {
  Stream numberStream = NumberGenerator().getStream.asBroadcastStream();

  StreamSubscription subOne = numberStream.listen((event) {
    print(event);
  },
  onDone: () {
    // some logic for when the stream is finished
  },
  onError: (error) {
    // some logic for error handling
  },
  cancelOnError: true,
  );
}

class NumberGenerator {
  int _counter = 0;

  StreamController<int> _controller = StreamController<int>();

  Stream<int> get getStream => _controller.stream;

  NumberGenerator() {
    final timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _controller.sink.add(_counter);
      _counter++;
     });

     Future.delayed(Duration(seconds: 10), () => timer.cancel());
  }
}