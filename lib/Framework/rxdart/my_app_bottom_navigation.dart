import 'package:rxdart/rxdart.dart';

class MyAppBottomNavigation {
  final _myAppBottomNavigation = BehaviorSubject<int>.seeded(0);

  Stream<int> get observableObject => _myAppBottomNavigation.stream;

  Function(int) get changeObject => _myAppBottomNavigation.sink.add;

  dispose() => _myAppBottomNavigation.close();
}

