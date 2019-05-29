import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';
import 'package:hello_web/common/arch/arch.dart';
import 'package:hello_web/common/entities/app_item.dart';
import 'package:hello_web/detail/detail_page.dart';
import 'package:hello_web/today/today_page_interactor.dart';

class TodayPagePresenter with Presenter<TodayPageInteractor> {
  TodayPagePresenter() {
    defaultInteractor = TodayPageInteractor();
  }

  @override
  Future init() {
    defaultInteractor.initialLoad();
    return super.init();
  }

  onItemPressed(BuildContext context, AppItem item) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DetailPage(appItem: item),
        fullscreenDialog: true,
      ),
    );
  }
}
