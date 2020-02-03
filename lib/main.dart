import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:outbreak_assistant/misc/constants.dart';
import 'package:outbreak_assistant/page/bottom_navigation_bar.dart';
import 'package:outbreak_assistant/page/web_page.dart';

void main() {
  var mySystemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: Color.fromARGB(255, 250, 250, 250),
      systemNavigationBarIconBrightness: Brightness.dark);
  SystemChrome.setSystemUIOverlayStyle(mySystemTheme);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeBottomNavigationBar(),
      routes: {"/web": (c) => WebPage()},
    );
  }
}
