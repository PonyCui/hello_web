import 'dart:convert';

import 'package:flutter_web/services.dart';
import 'package:hello_web/common/entities/app_item.dart';

class AppManager {
  static final shared = AppManager();

  Future<List<AppItem>> fetchItems() async {
    final data = await rootBundle.loadString("mock/today.json");
    final objects = await json.decode(data);
    if (objects is List) {
      return objects.where((it) => it is Map).map<AppItem>((it) {
        return AppItem.fromJSONMap(it);
      }).toList();
    } else {
      return List<AppItem>();
    }
  }
}
