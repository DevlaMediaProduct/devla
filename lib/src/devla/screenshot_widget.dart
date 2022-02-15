import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class ScreenShotWidget extends StatefulWidget {
  const ScreenShotWidget(
      {Key key, @required this.controller, @required this.widget})
      : super(key: key);

  final ScreenshotController controller;
  final Widget widget;

  @override
  _ScreenShotWidgetState createState() => _ScreenShotWidgetState();
}

class _ScreenShotWidgetState extends State<ScreenShotWidget> {
  @override
  Widget build(BuildContext context) {
    return Screenshot(controller: widget.controller, child: widget.widget);
  }
}
