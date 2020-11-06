import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'file:///D:/_Andrid/My%20projects/ilearn/lib/Helper/Resourse/hexa_color.dart';
import 'package:ilearn/Helper/Constants/constants_colors.dart';
import 'package:ilearn/Helper/Constants/constants_keys.dart';
import 'package:ilearn/Models/my_lasts_documents.dart';

class PdfReaderPage extends StatefulWidget {
  final  file;

  PdfReaderPage(this.file);

  @override
  _PdfReaderPageState createState() => _PdfReaderPageState();
}

class _PdfReaderPageState extends State<PdfReaderPage> with SingleTickerProviderStateMixin {
  String counter = '0/0';
  AnimationController _controller;

  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    secureScreen();
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 300), vsync: this);
  }

  @override
  void dispose() => {_controller.dispose(), super.dispose()};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "${widget.file.fileName}",
          style: TextStyle(
            color: blueBerry,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 0, left: 8),
          child: Builder(
            builder: (BuildContext context) => Container(
              decoration: BoxDecoration(
                color: HexColor("#f2f2f2").withOpacity(0.7),
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black.withOpacity(.7),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey[200]), borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  child: PDF(
                      swipeHorizontal: false,
                      enableSwipe: true,
                      fitEachPage: true,
                      defaultPage: 1,
                      onViewCreated: (PDFViewController controller) {
                        _controller.forward();
//                  setState(()async {
//                    counter =  (( await controller.getCurrentPage())/(await controller.getPageCount())).toString();
//                  });
                        Future.delayed(Duration(seconds: 2)).then((value) => _controller.reverse());
                      },
                      onPageChanged: (current, count) {
                        _controller.forward();
                        setState(() {
//                    counter = '$current/$count';
                        });
                        Future.delayed(Duration(seconds: 2)).then((value) => _controller.reverse());
                      }).cachedFromUrl("$BASE${widget.file.path}"),
                ),
              ),
//          Positioned(
//            bottom: 10,
//            left: 0,
//            right: 0,
//            child: FadeTransition(
//              opacity: Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.linear)),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                mainAxisSize: MainAxisSize.min,
//                children: <Widget>[
//                  Container(
//                    decoration: BoxDecoration(
//                      color: Colors.grey.shade400,
//                      borderRadius: BorderRadius.circular(10.0)
//                    ),
//                    padding: EdgeInsets.all(5.0),
//                    child: Text(counter),
//                  ),
//                ],
//              ),
//            ),
//          )
            ],
          ),
        ),
      ),
    );
  }
}
