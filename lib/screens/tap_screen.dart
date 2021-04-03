import 'package:alarm_app/screens/alarmOverview_screen.dart';
import 'package:alarm_app/screens/contents_screen.dart';
import 'package:alarm_app/screens/feed_screen.dart';
import 'package:alarm_app/screens/timer_screen.dart';
import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  static const routeName = '/alarm-tab';

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {

  PageController _pageController;

  int _pageIndex = 0;

  List<Widget> _tabPages = [
    AlarmOverviewScreen(),
    TimerScreen(),
    FeedScreen(),
    ContentsScreen()
  ];

  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: PageView(
        children: _tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        onTap: onTabTapped,
        currentIndex: _pageIndex,

        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), 
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer), 
            label: 'Timer'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback), 
            label: 'Feed'
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined), 
            label: 'Contents'
          )
        ]
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
  }
}
