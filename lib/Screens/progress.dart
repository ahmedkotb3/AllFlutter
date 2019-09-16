import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  //height of the container
  final double _height;
//width of the container
  final double _width;
//container decoration
  final BoxDecoration decoration;
//list of texts to be shown for each step
  final List<String> _stepsText;
//cur step identifier
  final int _curStep;
//active color
  final Color _activeColor;
//in-active color
  final Color _inactiveColor;
//dot radius
  final double _dotRadius;
//container padding
  final EdgeInsets padding;
//line height
  final double lineHeight;
//header textstyle
  final TextStyle _headerStyle;
//steps text
  final TextStyle _stepStyle;

  //ProgressBar({Key key}) : super(key: key);

  List<Widget> _buildText() {
    var wids = <Widget>[];
    _stepsText.asMap().forEach((i, text) {
      wids.add(Text(text, style: _stepStyle));
    });

    return wids;
  }

  List<Widget> _buildDots() {
    var wids = <Widget>[];
    _stepsText.asMap().forEach((i, text) {
      var circleColor =
          (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;

      var lineColor = _curStep > i + 1 ? _activeColor : _inactiveColor;

      wids.add(CircleAvatar(
        radius: _dotRadius,
        backgroundColor: circleColor,
      ));

      //add a line separator
      //0-------0--------0
      if (i != _stepsText.length - 1) {
        wids.add(Expanded(
            child: Container(
          height: lineHeight,
          color: lineColor,
        )));
      }
    });

    return wids;
  }

  const ProgressBar(
    List<String> stepsText,
    int curStep,
    double height,
    double width,
    double dotRadius,
    Color activeColor,
    Color inactiveColor,
    TextStyle headerStyle,
    TextStyle stepsStyle, {
    Key key,
    this.decoration,
    this.padding,
    this.lineHeight = 2.0,
  })  :
        _stepsText = stepsText,
        _curStep = curStep,
        _height = height,
        _width = width,
        _dotRadius = dotRadius,
        _activeColor = activeColor,
        _inactiveColor = inactiveColor,
        _headerStyle = headerStyle,
        _stepStyle = stepsStyle,
        assert(curStep > 0 == true && curStep <= stepsText.length),
        assert(width > 0),
        assert(height >= 2 * dotRadius),
        assert(width >= dotRadius * 2 * stepsText.length),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blueAccent,
        padding: padding,
        height: this._height,
        width: this._width,
        decoration: this.decoration,
        child: Column(
          children: <Widget>[
            Row(
              children: _buildDots(),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildText(),
            )
          ],
        ));
  }
}