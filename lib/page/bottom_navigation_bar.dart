import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outbreak_assistant/page/home.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeBottomNavigationBarState();
}

class HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  int _currentIndex = 1;

  final tempPage = MyHomePage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tempPage,
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              'BTN1',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            title: Text(
              '我',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pages,
            ),
            title: Text(
              'BTN3',
            ),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
