import 'package:alarm_app/widget/alarmItem.dart';
import 'package:alarm_app/widget/alarmsGrid.dart';
import 'package:alarm_app/screens/tap_screen.dart';
import 'package:flutter/material.dart';
import 'alarmRegister_screen.dart';
import 'package:provider/provider.dart';
import '../providers/alarms.dart';
import 'package:intl/intl.dart';

class AlarmOverviewScreen extends StatefulWidget {
  static const routeName = '/alarm-overview';

  @override
  _AlarmOverviewScreenState createState() => _AlarmOverviewScreenState();
}

class _AlarmOverviewScreenState extends State<AlarmOverviewScreen> {
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    setState(() {
      _isLoading = true;
    });

    _isLoading = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final alarmsData = Provider.of<Alarms>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: CircleAvatar(
            backgroundColor: Colors.blue[200],
            child: Text('hi')
          ),
          
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Consumer<Alarms>(
                        child: Center(
                          child: const Text('설정된 알림이 없어요'),
                        ),
                        builder: (ctx, alarms, ch) => alarms.items.length <= 0
                            ? ch
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: alarms.items.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (ctx, i) => AlarmItem(alarms.items[i].alarmDateTime),
                                )
                              ),
                      
              ]
          ),

          ElevatedButton(
              child:
                  Text("+ 알람추가".toUpperCase(), style: TextStyle(fontSize: 14)),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue[200]),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.blue[200])))),
              onPressed: () {
                Navigator.of(context).pushNamed(AlarmRegisterScreen.routeName);
              })
        ],
      ),

      // bottomSheet: TabBar,
// 
      // bottomNavigationBar: TabPage(),
    );
  }
}
