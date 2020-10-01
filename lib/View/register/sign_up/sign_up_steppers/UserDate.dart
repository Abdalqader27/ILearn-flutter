import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' show DateFormat;

class UserDate extends StatefulWidget {
  @override
  _UserDateState createState() => _UserDateState();
}

class _UserDateState extends State<UserDate> {
  String myDate;
  final format = DateFormat("yyyy/MM/dd - HH:mm:ss", "en-Us");
  DateTime _selectedDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat.yMd().format(_selectedDateTime);
    final selectedText = Text('تم تحديد : $formattedDate');

    final birthdayTile = new Material(
      color: Colors.transparent,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(bottom: 5.0),
          ),
          CupertinoDateTextBox(
              initialValue: _selectedDateTime,
              onDateChange: onBirthdayChange,
              hintText: DateFormat.yMd().format(_selectedDateTime)),
        ],
      ),
    );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset("SvgFiles/undraw_date_picker_gorr.svg", height: 200),
            ListTile(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  firstDate: DateTime(1990),
                );
                if (date != null) {
                  setState(() {
                    myDate = date.toString();
                  });
                }
              },
              leading: Icon(Icons.date_range),
              title: Text(
                "قم بتحديد تاريخ ميلادك ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, inherit: true, color: Colors.blueAccent),
              ),
              subtitle: Column(children: <Widget>[
                Container(
                  width: double.maxFinite,
                    child: selectedText),
                const SizedBox(height: 15.0),
                birthdayTile
              ]),
            ),
          ],
        ),
      ),
    );
  }
  void onBirthdayChange(DateTime birthday) {
    setState(() {
      _selectedDateTime = birthday;
    });
  }
}
