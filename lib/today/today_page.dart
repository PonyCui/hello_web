import 'package:flutter_web/material.dart';
import 'today_cell.dart';

class TodayPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TodayState();
  }
}

class _TodayState extends State<TodayPage> {

  Widget renderHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "5月28日 星期二",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Today",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
                ClipOval(
                  child: SizedBox(
                    width: 36,
                    height: 36,
                    child: Image.network(
                      "https://avatars0.githubusercontent.com/u/5013664?s=460&v=4",
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (_, index) {
          if (index == 0) {
            return renderHeader();
          } else {
            return TodayCell();
          }
        },
        itemCount: 10,
      ),
    );
  }
}
