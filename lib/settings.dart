import 'package:flutter/material.dart';
import 'package:my_time_app_flutter/widgets.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextStyle textStyle = TextStyle(fontSize: 24.0);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        childAspectRatio: 3,
        mainAxisSpacing: 10,
        children: [
          Text(
            "Work",
            style: textStyle,
          ),
          Text(""),
          Text(""),
          SettingButton(
            color: Color(0xff455a64),
            text: "-",
            value: -1,
          ),
          TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
          SettingButton(
            color: Color(0xff009688),
            text: "+",
            value: 1,
          ),
          Text(
            "Short",
            style: textStyle,
          ),
          Text(""),
          Text(""),
          SettingButton(
            color: Color(0xff455a64),
            text: "-",
            value: -1,
          ),
          TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
          SettingButton(
            color: Color(0xff009688),
            text: "+",
            value: 1,
          ),
          Text(
            "Long",
            style: textStyle,
          ),
          Text(""),
          Text(""),
          SettingButton(
            color: Color(0xff455a64),
            text: "-",
            value: -1,
          ),
          TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
          SettingButton(
            color: Color(0xff009688),
            text: "+",
            value: 1,
          )
        ],
        padding: const EdgeInsets.all(20.0),
      ),
    );
  }
}
