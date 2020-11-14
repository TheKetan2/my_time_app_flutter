import 'package:flutter/material.dart';

class SettingButton extends StatelessWidget {
  final Color color;
  final String text;
  final int value;
  final int size;
  final String settings;
  final Function callback;

  const SettingButton(
      {Key key,
      this.color,
      this.text,
      this.value,
      this.size,
      this.settings,
      this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        this.text,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: this.callback,
      color: this.color,
      // minWidth: this.size,
    );
  }
}
