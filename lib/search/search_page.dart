import 'package:flutter_web/material.dart';
import 'package:hello_web/common/arch/arch.dart';
import 'package:hello_web/common/entities/app_item.dart';
import 'package:hello_web/search/search_page_presenter.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends PageState<SearchPage, SearchPagePresenter> {
  _SearchPageState() {
    eventHandler = SearchPagePresenter();
  }

  Widget renderSearchBar() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 4),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 0),
                  height: 36,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      color: Colors.grey.shade200,
                      child: Transform.translate(
                        offset: Offset(0.0, -4.0),
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.transparent,
                          ),
                          onSubmitted: (_) {
                            eventHandler.onSearch("");
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              MaterialButton(
                padding: EdgeInsets.all(0),
                minWidth: 50,
                onPressed: () {
                  eventHandler.onSearch("");
                },
                child: Text(
                  "搜索",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Container(height: 1, color: Colors.grey.shade300),
        ],
      ),
    );
  }

  Widget renderResultList() {
    return ListView.builder(
      itemCount: eventHandler.defaultInteractor.items.length,
      itemBuilder: (_, index) {
        return Cell(appItem: eventHandler.defaultInteractor.items[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          renderSearchBar(),
          Expanded(
            child: renderResultList(),
          ),
        ],
      ),
    );
  }
}

class Cell extends StatelessWidget {
  final AppItem appItem;

  Cell({this.appItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          renderIcon(),
          renderTitle(),
          renderDownloadButton(),
        ],
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
            appItem.appName,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 25, 25, 25)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            appItem.appSummary,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 25, 25, 25)),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 3)
        ],
      ),
    );
  }

  Padding renderIcon() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 64,
          height: 64,
          child: Image.network(appItem.appIcon),
        ),
      ),
    );
  }
}
