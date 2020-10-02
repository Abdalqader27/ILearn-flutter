import 'package:rxdart/rxdart.dart';

class MyFlashCardCounter {
  final _myFlashCardCounter = BehaviorSubject<int>.seeded(0);

  Stream<int> get observableObject => _myFlashCardCounter.stream;

  Function(int) get changeObject => _myFlashCardCounter.sink.add;

  dispose() => _myFlashCardCounter.close();
}

