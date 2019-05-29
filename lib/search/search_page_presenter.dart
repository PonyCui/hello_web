import 'package:hello_web/common/arch/arch.dart';
import 'package:hello_web/search/search_page_interactor.dart';

class SearchPagePresenter with Presenter<SearchPageInteractor> {
  SearchPagePresenter() {
    defaultInteractor = SearchPageInteractor();
  }

  void onSearch(String keyword) {
    defaultInteractor.doSearch();
  }
}
