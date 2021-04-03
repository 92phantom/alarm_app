import 'package:alarm_app/providers/alarms.dart';
import 'package:alarm_app/widget/alarmItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlarmsGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final alarmsData = Provider.of<Alarms>(context).items;

    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: alarmsData.length,
      itemBuilder: (ctx, i) => ListTile(
        leading: CircleAvatar(),
        // title: Text
      )
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 2,
      //   childAspectRatio: 3 / 2,
      //   crossAxisSpacing: 10,
      //   mainAxisSpacing: 10,
      // ),
    );
  }
}
