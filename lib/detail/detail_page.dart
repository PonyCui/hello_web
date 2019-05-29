import 'package:flutter_web/material.dart';
import 'package:hello_web/common/entities/app_item.dart';
import 'package:hello_web/common/utils/spring_curve.dart';
import 'detail_header.dart';
import 'detail_content.dart';
import 'overlay_bar.dart';

class DetailPage extends StatefulWidget {
  final AppItem appItem;

  DetailPage({@required this.appItem});

  @override
  State<StatefulWidget> createState() {
    return _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  AnimationController overlayBarAnimationController;
  bool displayOverlay = false;
  bool displayDarkCloseIcon = false;

  @override
  dispose() {
    overlayBarAnimationController.dispose();
    super.dispose();
  }

  @override
  initState() {
    super.initState();
    setupOverlayBarAnimationController();
  }

  setupOverlayBarAnimationController() {
    overlayBarAnimationController = AnimationController(
      vsync: this,
      lowerBound: -1.0,
      upperBound: 2.0,
    );
    overlayBarAnimationController.addListener(() {
      setState(() {});
    });
  }

  setDisplayOverlay(bool value) {
    if (value != displayOverlay) {
      displayOverlay = value;
      if (displayOverlay) {
        overlayBarAnimationController.animateTo(
          1.0,
          duration: Duration(milliseconds: 750),
          curve: SpringCurve(a: 8.0, b: 8.0),
        );
      } else {
        overlayBarAnimationController.animateTo(
          0.0,
          duration: Duration(milliseconds: 750),
          curve: SpringCurve(a: 8.0, b: 8.0),
        );
      }
    }
  }

  Widget renderCloseButton() {
    return Positioned(
      right: 6,
      top: 10,
      child: ClipOval(
        child: MaterialButton(
          minWidth: 48,
          height: 48,
          padding: EdgeInsets.all(0),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: 25,
            height: 25,
            child: Image.asset(displayDarkCloseIcon
                ? "images/icon_close_dark.png"
                : "images/icon_close_light.png"),
          ),
        ),
      ),
    );
  }

  Widget renderOverlayBar() {
    return Positioned(
      left: 10,
      right: 10,
      bottom: 10,
      height: 75,
      child: Transform.translate(
        offset: Offset(0.0, 100 * (1.0 - overlayBarAnimationController.value)),
        child: OverlayBar(
          appItem: widget.appItem,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              setState(() {
                displayDarkCloseIcon = scrollInfo.metrics.pixels >
                    MediaQuery.of(context).size.width * (980.0 / 750.0);
              });
              setDisplayOverlay(scrollInfo.metrics.pixels >
                  MediaQuery.of(context).size.width * (980.0 / 750.0));
            },
            child: ListView(
              padding: EdgeInsets.only(bottom: 100),
              children: <Widget>[
                DetailHeader(
                  appItem: widget.appItem,
                ),
                DetailContent(
                  appItem: widget.appItem,
                ),
              ],
            ),
          ),
          renderCloseButton(),
          renderOverlayBar(),
        ],
      ),
    );
  }
}
