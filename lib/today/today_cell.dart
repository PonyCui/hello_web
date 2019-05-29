import 'package:flutter_web/material.dart';
import 'package:hello_web/common/utils/spring_curve.dart';
import 'package:hello_web/detail/detail_page.dart';

class TodayCell extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TodayCellState();
  }
}

class _TodayCellState extends State<TodayCell>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  dispose() {
    animationController.dispose();
    super.dispose();
  }

  initState() {
    super.initState();
    setupAnimationController();
  }

  setupAnimationController() {
    animationController =
        AnimationController(vsync: this, lowerBound: -1.0, upperBound: 2.0);
    animationController.value = 1.0;
    animationController.addListener(() {
      setState(() {});
    });
  }

  onPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DetailPage(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        animationController.animateTo(
          0.0,
          duration: Duration(milliseconds: 500),
          curve: SpringCurve(b: 6.0),
        );
      },
      onTapUp: (_) {
        onPressed();
        animationController.animateTo(
          1.0,
          duration: Duration(milliseconds: 500),
          curve: SpringCurve(b: 6.0),
        );
      },
      onTapCancel: () {
        animationController.animateTo(
          1.0,
          duration: Duration(milliseconds: 500),
          curve: SpringCurve(b: 6.0),
        );
      },
      child: Transform.scale(
        scale: 0.95 + animationController.value * 0.05,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 660.0 / 820.0,
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
            ),
          ),
        ),
      ),
    );
  }
}
