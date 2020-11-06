import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilearn/Helper/Widgets/background/primary_background.dart';
import 'package:ilearn/Helper/Widgets/clipper/bottom_curve_painter.dart';
import 'package:ilearn/Helper/Widgets/clipper/custom_bottom_clipper.dart';
import 'package:ilearn/Models/my_document_files.dart';
import 'package:ilearn/View/navigation_pages/BotFiles/pdf_reader_screen.dart';

class FileFolderItem extends StatefulWidget {
  final List<FilesList> filesList;
  final subjectName;

  const FileFolderItem({Key key, this.filesList, this.subjectName}) : super(key: key);

  @override
  _FileFolderItemState createState() => _FileFolderItemState();
}

class _FileFolderItemState extends State<FileFolderItem> {
  @override
  Widget build(BuildContext context) => PrimaryBackground(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    widget.subjectName,
                    style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: listViewItem(widget.filesList),
                ),
              ),

              PrimaryBackground(child: Container(),),
            ],
          ),
        ),
      );
}

Widget listViewItem(List<FilesList> filesList) => ListView.builder(
    physics: BouncingScrollPhysics(),
    shrinkWrap: true,
    itemCount: filesList.length,
    itemBuilder: (context, index) {
      return Card(
        elevation: 0,
        color: Colors.white.withOpacity(0.3),
        margin: EdgeInsets.all(0),
        shape: index == 0
            ? RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)))
            : index == filesList.length - 1
                ? RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)))
                : null,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PdfReaderPage(filesList[index])));
                },
                leading: SvgPicture.asset(
                  "SvgFiles/pdf.svg",
                  width: 40,
                  height: 40,
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${filesList[index].fileName}  ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
