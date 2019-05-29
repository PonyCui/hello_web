import 'package:flutter_web/material.dart';
import 'package:hello_web/common/entities/app_item.dart';

class DetailContent extends StatelessWidget {
  final AppItem appItem;

  DetailContent({@required this.appItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 50),
      child: Text(
        appItem.contents[0],
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey,
          height: 1.75,
        ),
      ),
    );
  }
}
