import 'package:flutter/material.dart';
import 'package:my_time_app_flutter/widgets/productivity_button.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
  @override
  Widget build(BuildContext context) {
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
                  child: CircularPercentIndicator(
                radius: availableWidth / 2,
                lineWidth: 10.0,
                percent: 0.2,
                center: Text(
                  "30:00",
                  style: Theme.of(context).textTheme.headline2,
                ),
                progressColor: Color(0xff009688),
              )),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
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
