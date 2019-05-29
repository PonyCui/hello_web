import 'package:flutter_web/material.dart';
import 'package:hello_web/common/entities/app_item.dart';
import 'package:hello_web/common/utils/spring_curve.dart';
import 'package:hello_web/today/today_page_presenter.dart';

class CoverTypeCell_2 extends StatefulWidget {
  final AppItem appItem;
  final TodayPagePresenter eventHandler;

  CoverTypeCell_2({@required this.appItem, this.eventHandler});

  @override
  State<StatefulWidget> createState() {
    return _CoverTypeCell_2State();
  }
}

class _CoverTypeCell_2State extends State<CoverTypeCell_2>
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
    widget.eventHandler.onItemPressed(context, widget.appItem);
  }

  @override
  Widget build(BuildContext context) {
    return renderGestureAnimation(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            color: Color.fromARGB(255, 245, 245, 245),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                renderCover(),
                renderInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget renderGestureAnimation({Widget child}) {
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
        scale: 0.97 + animationController.value * 0.03,
        child: child,
      ),
    );
  }

  Container renderCover() {
    return Container(
      height: 520 / 2.0,
      child: Image.asset(
        "mock/${widget.appItem.coverURLString}",
        fit: BoxFit.cover,
      ),
    );
  }

  Container renderInfo() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.appItem.type,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 8),
            child: Text(
              widget.appItem.title,
              style: TextStyle(
                fontSize: 26,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            widget.appItem.summary,
            style: TextStyle(
              fontSize: 17,
              color: Colors.grey,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
