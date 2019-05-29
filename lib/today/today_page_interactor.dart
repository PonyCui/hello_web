import 'package:hello_web/common/arch/arch.dart';
import 'package:hello_web/common/entities/app_item.dart';
import 'package:hello_web/common/manager/app_manager.dart';

class TodayPageInteractor with Interactor {
  String currentDay = "5月28日 星期二";
  String currentUserAvatar =
      "https://avatars0.githubusercontent.com/u/5013664?s=460&v=4";
  List<AppItem> items = [];

  initialLoad() async {
    this.items = await AppManager.shared.fetchItems();
    updatePage();
  }
}
