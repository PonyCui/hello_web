import 'package:flutter_web/material.dart';

class OverlayBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        color: Color.fromARGB(255, 230, 230, 230),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            renderIcon(),
            renderTitle(),
            renderDownloadButton(),
          ],
        ),
      ),
    );
  }

  Padding renderDownloadButton() {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Container(
              width: 72,
              height: 28,
              color: Color.fromARGB(255, 92, 90, 104),
              child: Center(
                child: Text(
                  "获取",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Transform.scale(
            scale: 0.6,
            child: Text(
              "App 内购买项目",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black38,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded renderTitle() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "跨越星弧",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 25, 25, 25)),
          ),
          Text(
            "佛系杀时间的星际探险手游",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 25, 25, 25)),
          ),
          SizedBox(height: 3)
        ],
      ),
    );
  }

  Padding renderIcon() {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 48,
          height: 48,
          color: Colors.green,
        ),
      ),
    );
  }
}
