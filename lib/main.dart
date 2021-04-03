import 'package:alarm_app/screens/timer_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/alarmOverview_screen.dart';
import 'providers/alarms.dart';
import 'screens/alarmRegister_screen.dart';
import 'screens/tap_screen.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Alarms(),
        ),
      ],

      child:  MaterialApp(
        title: 'Generated App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF2196f3),
          accentColor: const Color(0xFF2196f3),
          canvasColor: const Color(0xFFfafafa),
        ),
        initialRoute: TabPage.routeName,
        routes: {
            TabPage.routeName: (ctx) => TabPage(),
            AlarmRegisterScreen.routeName: (ctx) => AlarmRegisterScreen(),
            AlarmOverviewScreen.routeName: (ctx) => AlarmOverviewScreen(),
        },
        
      )
    );
  }
}
