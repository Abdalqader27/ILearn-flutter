import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilearn/Helper/Constants/constants_colors.dart';


class FolderBotScreen extends StatefulWidget {
  @override
  _FolderBotScreenState createState() => _FolderBotScreenState();
}

class _FolderBotScreenState extends State<FolderBotScreen> {
  int indexWidgetParent = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Container(
              height: 50,
              width: double.maxFinite,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_back_ios,
                                    size: 15,
                                    color: black,
                                  ),
                                  Text(
                                    "$index كلية الهندسة المعلوماتية",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: listViewItem(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listViewItem() => ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0,
          color: Colors.white.withOpacity(0.3),
          margin: EdgeInsets.all(0),
          shape: index == 0
              ? RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)))
              : index == 4 ? RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))) : null,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    setState(() {
                      indexWidgetParent = 1;
                    });
                  },
                  leading: indexWidgetParent == 0
                      ? SvgPicture.asset(
                          "SvgFiles/030-folder-10.svg",
                          width: 40,
                          height: 40,
                        )
                      : SvgPicture.asset(
                          "SvgFiles/pdf2.svg",
                          width: 40,
                          height: 40,
                        ),
                  trailing: indexWidgetParent != 0 ? Icon(Icons.arrow_forward_ios) : null,
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "الفيزياء  ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                index != 4
                    ? Divider(
                        height: 1,
                        color: Colors.grey[200],
                      )
                    : Container(),
              ],
            ),
          ),
        );
      });
}
