import 'package:rxdart/rxdart.dart';

class QuizBank{
  final _myFBankQuiz= BehaviorSubject<Future>();

  Stream<Future> get observableObject => _myFBankQuiz.stream;

  Function(Future) get changeObject => _myFBankQuiz.sink.add;

  dispose() => _myFBankQuiz.close();
}