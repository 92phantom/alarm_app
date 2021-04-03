import '../providers/alarm.dart';
import 'package:alarm_app/providers/alarms.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:provider/provider.dart';

class AlarmRegisterScreen extends StatefulWidget {
  static const routeName = '/alarm-register';

  @override
  _AlarmRegisterScreenState createState() => _AlarmRegisterScreenState();
}

class _AlarmRegisterScreenState extends State<AlarmRegisterScreen> {
  var _dateTime = DateTime.now();

  var _routine = '';
  var _editedAlarm = Alarm(
    id: '',
    hour: 0,
    min: 0,
    routine: '',
    alarmDateTime: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {



    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Edit Product'),
        // ),
        // 로딩중 상태관리
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('알람추가'),
        Padding(padding: EdgeInsets.all(50)),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            border: Border.all(),
          ),
          child: TimePickerSpinner(
            is24HourMode: false,
            normalTextStyle: TextStyle(fontSize: 24, color: Colors.blue[300]),
            highlightedTextStyle: TextStyle(
                fontSize: 24,
                color: Colors.blue[600],
                fontWeight: FontWeight.bold),
            spacing: 50,
            itemHeight: 80,
            isForce2Digits: true,
            onTimeChange: (time) {
              setState(() {
                _dateTime = time;
              });
              print(_dateTime);
            },
          ),
        ),
        Padding(padding: EdgeInsets.all(50)),
        ButtonTheme(
          minWidth: 370, //버튼의 최소 가로 길이
          height: 80, //버튼의 세로 길이
          shape: RoundedRectangleBorder(
              //버튼을 둥글게 처리
              borderRadius: BorderRadius.circular(10)
          ),
          child: RaisedButton(
            //ButtonTheme의 child로 버튼 위젯 삽입
            onPressed: () {},
            child: Text(
              '사운드',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blue[300]),
            ),
            color: Colors.white,

          ),
        ),

        Padding(padding: EdgeInsets.all(50)),

            GestureDetector(
              onTap: (){
                showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) => CupertinoActionSheet(
                                title: const Text('반복설정'),
                                // message: const Text('Message'),
                                actions: [
                                  CupertinoActionSheetAction(
                                    child: const Text('월요일마다'),
                                    onPressed: () {
                                      _routine = 'mon';
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: const Text('20분마다'),
                                    onPressed: () {
                                      _routine = '20mins';
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: const Text('30분마다'),
                                    onPressed: () {
                                      _routine = '30mins';
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: const Text('50분마다'),
                                    onPressed: () {
                                      _routine = '50mins';
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              ),
                    );
                  },
              child: Container(
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Padding(padding: EdgeInsets.all(20)),

                Text(
                '반복',
                textScaleFactor: 1,
                style: TextStyle(color: Colors.blue[300]),
                ),
                // Padding(padding: EdgeInsets.all(0)),
                Text(
                    '없음',
                    textScaleFactor: 1,
                    style: TextStyle(color: Colors.blue[300]),
                  ),
                
              ],
          ),
          decoration: BoxDecoration(
              
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.blue[300], spreadRadius: 1.5),
              ],
          ),
          height: 50,
        ),
            ),
        Padding(padding: EdgeInsets.all(20)),
  
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            
            RaisedButton(
              child: Text('취소'),
              onPressed: (){
                Navigator.of(context).pop();
              }
            ),
            RaisedButton(
              child: 
                Text('완료', 
                  style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold
                  ),
                ),
              color: Colors.blue[300],
              onPressed: (){
                print(_routine);
                print(_dateTime.hour);
                print(_dateTime.minute);
                
                _editedAlarm = Alarm(
                  id : _dateTime.toString(),
                  hour : _dateTime.hour,
                  min : _dateTime.minute,
                  routine: _routine,
                  alarmDateTime: _dateTime
                );
                
                Provider.of<Alarms>(context, listen: false).addAlarm(_editedAlarm);

                Navigator.of(context).pop();

              }
            ),
            

          ],
        )

      ],
    )
    );
  }
}
