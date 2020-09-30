import 'package:ilearn/Model/newbook_model.dart';
import 'package:rxdart/rxdart.dart';

class ChoiceFilesOrVideo {
  final _choiceFilesOrVideo = BehaviorSubject<int>.seeded(0);

  Stream<int> get observableObject => _choiceFilesOrVideo.stream;

  Function(int) get changeObject => _choiceFilesOrVideo.sink.add;

  dispose() => _choiceFilesOrVideo.close();
}

final choiceFilesOrVideo = ChoiceFilesOrVideo();
