import 'package:ilearn/Model/newbook_model.dart';
import 'package:rxdart/rxdart.dart';

class HomeListFilesAndVideo {
  final _homeListFilesAndVideo = BehaviorSubject<List<NewBookModel>>.seeded(newbooks);

  Stream<List<NewBookModel>> get observableObject => _homeListFilesAndVideo.stream;

  Function(List<NewBookModel>) get changeObject => _homeListFilesAndVideo.sink.add;

  dispose() => _homeListFilesAndVideo.close();
}

final homeListFilesAndVideo = HomeListFilesAndVideo();
