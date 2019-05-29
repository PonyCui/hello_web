import 'package:flutter_web/material.dart';
import 'package:hello_web/common/utils/spring_curve.dart';

class DetailPage extends StatefulWidget {
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

  Widget renderHeader() {
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

  Widget renderMainContent() {
    return Padding(
      padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 50),
      child: Text(
        "Magibot 是一款动作冒险类游戏，玩家需要控制你的人物角色在丰富的地图中探索和冒险，游戏的画面非常的清新，动作和机关要素也是非常的有趣。\n\n Magibot 是一款动作冒险类游戏，玩家需要控制你的人物角色在丰富的地图中探索和冒险，游戏的画面非常的清新，动作和机关要素也是非常的有趣。\n\n Magibot 是一款动作冒险类游戏，玩家需要控制你的人物角色在丰富的地图中探索和冒险，游戏的画面非常的清新，动作和机关要素也是非常的有趣。\n\n Magibot 是一款动作冒险类游戏，玩家需要控制你的人物角色在丰富的地图中探索和冒险，游戏的画面非常的清新，动作和机关要素也是非常的有趣。\n\n Magibot 是一款动作冒险类游戏，玩家需要控制你的人物角色在丰富的地图中探索和冒险，游戏的画面非常的清新，动作和机关要素也是非常的有趣。\n\nMagibot 是一款动作冒险类游戏，玩家需要控制你的人物角色在丰富的地图中探索和冒险，游戏的画面非常的清新，动作和机关要素也是非常的有趣。\n\nMagibot 是一款动作冒险类游戏，玩家需要控制你的人物角色在丰富的地图中探索和冒险，游戏的画面非常的清新，动作和机关要素也是非常的有趣。",
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey,
          height: 1.75,
        ),
      ),
    );
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            color: Color.fromARGB(255, 230, 230, 230),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 48,
                      height: 48,
                      color: Colors.green,
                    ),
                  ),
                ),
                Expanded(
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
                ),
                Padding(
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
                ),
              ],
            ),
          ),
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
                renderHeader(),
                renderMainContent(),
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
