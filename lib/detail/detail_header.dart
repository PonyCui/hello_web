import 'package:flutter_web/material.dart';

class DetailHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 750.0 / 980.0,
      child: Container(
        color: Color.fromARGB(255, 245, 245, 245),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.network(
                "https://i.loli.net/2019/05/28/5ced5870e5eb877483.jpeg",
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
                    "主打推荐",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      "我不做人啦！",
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
                    "在《Man or Vampire》中做出抉择",
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
