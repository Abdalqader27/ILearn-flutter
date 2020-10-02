import 'package:ilearn/Models/my_document_scroll.dart';
import 'package:rxdart/rxdart.dart';

class ScrollDocument {
  final _scrollDocument = BehaviorSubject<List<MyDocumentScroll>>.seeded([MyDocumentScroll()]);

  Stream<List<MyDocumentScroll>> get observableObject => _scrollDocument.stream;

  Function(List<MyDocumentScroll>) get changeObject => _scrollDocument.sink.add;

  dispose() => _scrollDocument.close();
}
