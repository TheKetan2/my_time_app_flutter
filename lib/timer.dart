import "dart:async";

import 'package:my_time_app_flutter/models/timer_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "./models/timer_model.dart";

class CountDownTimer {
  int work = 1;
  double _radius = 1;
  bool _isActive = true;
  Timer timer;
  Duration _time;
  Duration _fullTime;

  int shortBreak = 1;
  int longBreak = 5;

  Future readSetings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    work = prefs.getInt("workTime") == null ? 30 : prefs.getInt("workTime");
    shortBreak =
        prefs.getInt("shortBreak") == null ? 30 : prefs.getInt("shortBreak");
    longBreak = work =
        prefs.getInt("longBreak") == null ? 30 : prefs.getInt("longBreak");
  }

  void startWork() {
    readSetings();
    _radius = 1;
    _time = Duration(minutes: this.work, seconds: 0);
    _fullTime = _time;
  }

  void startBreak(bool isShort) {
    _radius = 1;
    _time = Duration(minutes: (isShort ? shortBreak : longBreak), seconds: 0);
    _fullTime = _time;
  }

  String returnTime(Duration t) {
    String minutes = t.inMinutes < 10
        ? "0" + t.inMinutes.toString()
        : t.inMinutes.toString();
    int numSeconds = t.inSeconds - t.inMinutes * 60;
    String seconds =
        numSeconds < 10 ? "0" + numSeconds.toString() : numSeconds.toString();
    String formattedTime = minutes + ":" + seconds;
    return formattedTime;
  }

  void stopTimer() {
    this._isActive = false;
  }

  void startTimer() {
    if (_time.inSeconds > 0) {
      this._isActive = true;
    }
  }

  Stream<TimerModel> stream() async* {
    yield* Stream.periodic(Duration(seconds: 1), (int a) {
      String time;
      if (this._isActive) {
        _time = _time - Duration(seconds: 1);
        _radius = _time.inSeconds / _fullTime.inSeconds;
        if (_time.inSeconds <= 0) {
          _isActive = false;
        }
      }
      time = returnTime(_time);
      return TimerModel(
        time: time,
        percent: _radius,
      );
    });
  }
}
