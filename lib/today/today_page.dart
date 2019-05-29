import 'package:flutter_web/material.dart';
import 'package:hello_web/common/arch/arch.dart';
import 'package:hello_web/today/today_page_presenter.dart';
import 'cover_type_cell_1.dart';
import 'cover_type_cell_2.dart';

class TodayPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TodayState();
  }
}

class _TodayState extends PageState<TodayPage, TodayPagePresenter> {
  _TodayState() {
    eventHandler = TodayPagePresenter();
  }

  Widget renderHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            eventHandler.defaultInteractor.currentDay,
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
                      eventHandler.defaultInteractor.currentUserAvatar,
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
            if (eventHandler.defaultInteractor.items[index - 1].coverType ==
                2) {
              return CoverTypeCell_2(
                appItem: eventHandler.defaultInteractor.items[index - 1],
                eventHandler: eventHandler,
              );
            } else {
              return CoverTypeCell_1(
                appItem: eventHandler.defaultInteractor.items[index - 1],
                eventHandler: eventHandler,
              );
            }
          }
        },
        itemCount: eventHandler.defaultInteractor.items.length + 1,
      ),
    );
  }
}
