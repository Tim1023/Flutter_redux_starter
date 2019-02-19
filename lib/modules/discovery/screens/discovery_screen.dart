import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:onigiri_app/modules/discovery/containers/articles.dart';
import 'package:onigiri_app/modules/discovery/models/article_list.dart';
import 'package:onigiri_app/modules/discovery/store/actions.dart';
import 'package:onigiri_app/store/state.dart';
import 'package:redux/redux.dart';

class DiscoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return Articles(articles:viewModel.articles, fetchArticles:viewModel.fetchArticles);
      },
    );
  }
}


class _ViewModel {
  final ArticleList articles;
  final VoidCallback fetchArticles;
  _ViewModel({
    this.articles,
    this.fetchArticles,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      articles: store.state.discoveryState.articles,
      fetchArticles: (){store.dispatch(FetchArticlesRequest());},
    );
  }
}
