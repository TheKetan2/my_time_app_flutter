import 'package:flutter/material.dart';
import 'package:my_time_app_flutter/models/timer_model.dart';
import 'package:my_time_app_flutter/settings_Screen.dart';
import 'package:my_time_app_flutter/widgets/productivity_button.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'timer.dart';

final double defaultPadding = 5.0;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My work timer',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: Colors.transparent),
      ),
      home: TimerHomePage(),
    );
  }
}

class TimerHomePage extends StatelessWidget {
  final CountDownTimer timer = CountDownTimer();

  void gotoSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<PopupMenuItem<String>> menuItems = List<PopupMenuItem<String>>();
    menuItems.add(PopupMenuItem(
      value: "Settings",
      child: Text("Settings"),
    ));
    timer.startWork();
    return Scaffold(
      appBar: AppBar(
        title: Text("My work timer"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (s) {
              if (s == "Settings") {
                gotoSettings(context);
              }
            },
            itemBuilder: (BuildContext conext) {
              return menuItems.toList();
            },
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double availableWidth = constraints.maxWidth;

          return Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  Expanded(
                    child: ProductivityButton(
                      color: Color(0xff009688),
                      text: "Work",
                      onPressed: () {
                        timer.startWork();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  Expanded(
                    child: ProductivityButton(
                      color: Color(0xff607d8b),
                      text: "Short Break",
                      onPressed: () {
                        timer.startBreak(true);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  Expanded(
                    child: ProductivityButton(
                      color: Color(0xff455a64),
                      text: "Long Break",
                      onPressed: () {
                        timer.startBreak(false);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                ],
              ),
              Expanded(
                  child: StreamBuilder<TimerModel>(
                      stream: timer.stream(),
                      builder: (context, snapshot) {
                        TimerModel timer = (snapshot.data == "00:00")
                            ? TimerModel(time: "00:00", percent: 1)
                            : snapshot.data;
                        return CircularPercentIndicator(
                          radius: availableWidth / 2,
                          lineWidth: 10.0,
                          percent: timer.percent,
                          center: Text(
                            timer.time,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          progressColor: Color(0xff009688),
                        );
                      })),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  /**
                   * TODO: start from page 117 setting routes
                   * 
                   */
                  Expanded(
                    child: ProductivityButton(
                      color: Color(0xff455a64),
                      text: "Stop",
                      onPressed: () {
                        timer.stopTimer();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  Expanded(
                    child: ProductivityButton(
                      color: Color(0xff009688),
                      text: "Restart",
                      onPressed: () {
                        timer.startTimer();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
