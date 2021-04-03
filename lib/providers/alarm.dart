import 'package:flutter/material.dart';

class Alarm with ChangeNotifier{

  final String id;
  final int hour;
  final int min;
  final String routine;
  final DateTime alarmDateTime;

  Alarm({
    @required this.id, 
    @required this.hour, 
    @required this.min,
    @required this.routine,
    @required this.alarmDateTime
  });

}
