// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum _Element {
  background,
  weather,
  birds,
  text,
}

final _lightTheme = {
  _Element.background: "day_sunny",
  _Element.weather:"",
  _Element.birds : "dance",
  _Element.text: Colors.white,
};

final _darkTheme = {
  _Element.background: "night_sunny",
  _Element.weather:"",
  _Element.birds : "dance",
  _Element.text: Colors.white,
};

/// A basic digital clock.
///
/// You can do better than this!
class DigitalClock extends StatefulWidget {
  const DigitalClock(this.model);

  final ClockModel model;

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;
  String weather;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }



  @override
  void didUpdateWidget(DigitalClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    _widgetWeather();
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _widgetWeather(){
    if( widget.model.weatherString == "sunny"){
      _lightTheme[_Element.background] = "day_sunny";
      _darkTheme[_Element.background] = "night_sunny";
      _lightTheme[_Element.weather] = "";
      _darkTheme[_Element.weather] = "";
    }else if( widget.model.weatherString == "cloudy"){
      _lightTheme[_Element.background] = "day_cloudy";
      _darkTheme[_Element.background] = "night_cloudy";
      _lightTheme[_Element.weather] = "";
      _darkTheme[_Element.weather] = "";
    }else if(widget.model.weatherString == "rainy"){
      _lightTheme[_Element.background] = "day_sunny";
      _darkTheme[_Element.background] = "night_sunny";
      _lightTheme[_Element.weather] = "rain";
      _darkTheme[_Element.weather] = "rain";
    }else if(widget.model.weatherString == "snowy"){
      _lightTheme[_Element.background] = "day_sunny";
      _darkTheme[_Element.background] = "night_sunny";
      _lightTheme[_Element.weather] = "snow";
      _darkTheme[_Element.weather] = "snow";
    }
  }

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
    });
  }

  void _updateTime(){
    setState(() {
      _dateTime = DateTime.now();
      _timer = Timer(
        Duration(minutes: 1) -
            Duration(seconds: _dateTime.second) -
            Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  String is12HourFormat(){
    DateTime _now = DateTime.now();
    DateTime _jung = DateTime(_now.year,_now.month,_now.day,12);
    if(!widget.model.is24HourFormat && _jung.isBefore(_now)){
      return "PM";
    }else if(!widget.model.is24HourFormat && _jung.isAfter(_now)){
      return "AM";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).brightness == Brightness.light
        ? _lightTheme
        : _darkTheme;
    final hour =
        DateFormat(widget.model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
    final minute = DateFormat('mm').format(_dateTime);
    final fontSize = MediaQuery.of(context).size.width / 7;
    final offset = -fontSize / 7;
    final defaultStyle = TextStyle(
      color: colors[_Element.text],
      fontFamily: 'Plantagenet',
      fontSize: fontSize,
    );
    String meridiem = is12HourFormat();
    return Stack(
      children: <Widget>[
        Container(
          child: Image.asset('assets/${colors[_Element.background].toString()}.gif'),
          width: MediaQuery.of(context).size.width,
        ),
        widget.model.weatherString.isNotEmpty ?
        Container(
          child: Image.asset('assets/${colors[_Element.weather].toString()}.gif'),
          width: MediaQuery.of(context).size.width,
        ) : Container(),
        Container(
          child: Image.asset('assets/birds_${colors[_Element.birds].toString()}.gif'),
          width: MediaQuery.of(context).size.width,
        ),
        Container(
          //color: colors[_Element.background],
          child: Center(
            child: DefaultTextStyle(
              style: defaultStyle,
              child: Stack(
                children: <Widget>[
                  Positioned(left: MediaQuery.of(context).size.width /2, top: MediaQuery.of(context).size.width /3.5, child: Text("${meridiem}",style: TextStyle(fontSize: MediaQuery.of(context).size.width /12,fontFamily: 'Silom',),)),
                  Positioned(left: MediaQuery.of(context).size.width /2, top: MediaQuery.of(context).size.width /2.9, child: Text(hour +" : "+minute)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
// TODO: 변수명 바꾸기, 코드정리 하고 보내자