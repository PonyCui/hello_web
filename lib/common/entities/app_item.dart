class AppItem {
  String type;
  int coverType;
  String coverURLString;
  String title;
  String summary;
  List<String> contents;
  String appIcon;
  String appName;
  String appSummary;

  static AppItem fromJSONMap(Map obj) {
    return AppItem()
      ..type = obj["type"]
      ..coverType = obj["cover_type"]
      ..coverURLString = obj["cover"]
      ..title = obj["title"]
      ..summary = obj["summary"]
      ..contents = (() {
        if (obj["contents"] is List) {
          return (obj["contents"] as List)
              .where((it) => it is String)
              .map<String>((f) => f)
              .toList();
        } else {
          return List<String>();
        }
      })()
      ..appIcon = obj["app_icon"]
      ..appName = obj["app_name"]
      ..appSummary = obj["app_summary"];
  }
}
