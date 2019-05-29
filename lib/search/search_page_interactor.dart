import 'dart:convert';

import 'package:flutter_web/services.dart';
import 'package:hello_web/common/arch/arch.dart';
import 'package:hello_web/common/entities/app_item.dart';

class SearchPageInteractor with Interactor {
  List<AppItem> items = [];

  doSearch() async {
    final result =
        json.decode(await rootBundle.loadString("mock/search_result.json"));
    this.items = (result["feed"]["results"] as List).map<AppItem>((it) {
      return AppItem()
        ..appName = it["name"]
        ..appIcon = it["artworkUrl100"]
        ..appSummary = it["artistName"];
    }).toList();
    updatePage();
  }
}
