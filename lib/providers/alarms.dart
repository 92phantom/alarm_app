
import 'package:flutter/material.dart';
import 'alarm.dart';

class Alarms with ChangeNotifier {

  List<Alarm>  _items = [
  ];

  List<Alarm> get items {

    return [..._items];
  }

  Future<void> addAlarm(Alarm alarm) async {

      final newAlarm = Alarm(
          id: alarm.id,
          hour: alarm.hour,
          min : alarm.min,
          routine: alarm.routine,
          alarmDateTime: alarm.alarmDateTime
      );

      _items.add(newAlarm);
      notifyListeners();
  }


}