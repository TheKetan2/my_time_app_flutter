import 'package:flutter/material.dart';
import 'package:my_time_app_flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextStyle textStyle = TextStyle(fontSize: 24.0);
  TextEditingController txtWork;
  TextEditingController txtShort;
  TextEditingController txtLong;

  static const String WORKTIME = "workTime";
  static const String SHORTBREAK = "shortBreak";
  static const LONGBREAK = "longBreak";
  int workTime;
  int shortBreak;
  int longBreak;

  SharedPreferences prefs;

  readSettings() async {
    prefs = await SharedPreferences.getInstance();
    int workTime = prefs.getInt(WORKTIME) == null ? 0 : prefs.getInt(WORKTIME);
    int shortBreak =
        prefs.getInt(SHORTBREAK) == null ? 0 : prefs.getInt(SHORTBREAK);
    int longBreak =
        prefs.getInt(LONGBREAK) == null ? 0 : prefs.getInt(LONGBREAK);

    setState(() {
      txtWork.text = workTime.toString();
      txtShort.text = shortBreak.toString();
      txtLong.text = longBreak.toString();
    });
  }

  void updateSetting(String key, int value) {
    switch (key) {
      case WORKTIME:
        {
          int workTime =
              prefs.getInt(WORKTIME) == null ? 0 : prefs.getInt(WORKTIME);
          workTime += value;
          print(workTime.toString());
          if (workTime >= 1 && workTime <= 180) {
            prefs.setInt(WORKTIME, workTime);
            setState(() {
              txtWork.text = workTime.toString();
            });
          }
        }
        break;
      case SHORTBREAK:
        {
          int short =
              prefs.getInt(SHORTBREAK) == null ? 0 : prefs.getInt(SHORTBREAK);
          short += value;
          if (short >= 1 && short <= 180) {
            prefs.setInt(SHORTBREAK, short);
            setState(() {
              txtShort.text = short.toString();
            });
          }
        }
        break;
      case LONGBREAK:
        {
          int long =
              prefs.getInt(LONGBREAK) == null ? 0 : prefs.getInt(LONGBREAK);
          long += value;
          if (long >= 1 && long <= 180) {
            prefs.setInt(LONGBREAK, long);
            setState(() {
              txtLong.text = long.toString();
            });
          }
        }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    txtWork = TextEditingController();
    txtShort = TextEditingController();
    txtLong = TextEditingController();
    readSettings();
    super.initState();
  }

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
            callback: () => updateSetting(WORKTIME, -1),
          ),
          TextField(
            controller: txtWork,
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
          SettingButton(
            color: Color(0xff009688),
            text: "+",
            value: 1,
            callback: () => updateSetting(WORKTIME, 1),
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
            callback: () => updateSetting(SHORTBREAK, -1),
          ),
          TextField(
            controller: txtShort,
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
          SettingButton(
            color: Color(0xff009688),
            text: "+",
            value: 1,
            callback: () => updateSetting(SHORTBREAK, 1),
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
            callback: () => updateSetting(LONGBREAK, -1),
          ),
          TextField(
            controller: txtLong,
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
          SettingButton(
            color: Color(0xff009688),
            text: "+",
            value: 1,
            callback: () => updateSetting(LONGBREAK, 1),
          )
        ],
        padding: const EdgeInsets.all(20.0),
      ),
    );
  }
}
