import 'package:flutter/material.dart';
import 'package:my_time_app_flutter/models/timer_model.dart';
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
      title: 'My work timer',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TimerHomePage(),
    );
  }
}

class TimerHomePage extends StatelessWidget {
  final CountDownTimer timer = CountDownTimer();

  @override
  Widget build(BuildContext context) {
    timer.startWork();
    return Scaffold(
      appBar: AppBar(
        title: Text("My work timer"),
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
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  Expanded(
                    child: ProductivityButton(
                      color: Color(0xff607d8b),
                      text: "Short Break",
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  Expanded(
                    child: ProductivityButton(
                      color: Color(0xff455a64),
                      text: "Long Break",
                      onPressed: () {},
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
                   * TODO: start from page 113 implimenting stream 
                   * 
                   */
                  Expanded(
                    child: ProductivityButton(
                      color: Color(0xff455a64),
                      text: "Stop",
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  Expanded(
                    child: ProductivityButton(
                      color: Color(0xff009688),
                      text: "Restart",
                      onPressed: () {},
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
