import 'package:flutter_web/material.dart';
import 'package:hello_web/search/search_page.dart';
import 'today/today_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppStore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainWireframe(),
    );
  }
}

class MainWireframe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainWireframeState();
  }
}

class _MainWireframeState extends State<MainWireframe>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(vsync: this, initialIndex: 0, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                TodayPage(),
                SearchPage(),
              ],
            ),
          ),
          Container(
            height: 50,
            child: TabBar(
              controller: tabController,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey.shade300,
              indicatorColor: Colors.transparent,
              tabs: <Widget>[
                Tab(
                  text: "Today",
                ),
                Tab(
                  text: "Search",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
