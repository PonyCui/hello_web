import 'package:flutter_web/material.dart';
import 'package:hello_web/common/entities/app_item.dart';

class DetailHeader extends StatelessWidget {
  final AppItem appItem;

  DetailHeader({@required this.appItem});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 750.0 / 980.0,
      child: Container(
        color: Color.fromARGB(255, 245, 245, 245),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                "mock/${appItem.coverURLString}",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    appItem.type,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      appItem.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Text(
                    appItem.summary,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
