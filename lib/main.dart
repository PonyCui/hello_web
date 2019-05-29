import 'package:flutter_web/material.dart';
import 'today/today_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodayPage(),
    );
  }
}
