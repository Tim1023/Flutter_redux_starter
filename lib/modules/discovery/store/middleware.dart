import 'package:onigiri_app/modules/discovery/models/article.dart';
import 'package:onigiri_app/modules/discovery/store/actions.dart';
import 'package:onigiri_app/modules/discovery/store/repository.dart';
import 'package:onigiri_app/store/state.dart';
import 'package:redux/redux.dart';

import '../models/article_list.dart';

class DiscoveryMiddleware {
  final Repository repository;

  const DiscoveryMiddleware({this.repository = const Repository()});

  List<Middleware<AppState>> createDiscoveryMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, FetchArticlesRequest>(_fetch),
      TypedMiddleware<AppState, ArticlesFetchedSuccess>(_fetchSuccess),
    ];
  }



  void _fetch(Store<AppState> store, FetchArticlesRequest action, NextDispatcher next) async {
    next(action);
    try {
      final Map<String, dynamic> articlesData = await repository.getArticles();
      store.dispatch(ArticlesFetchedSuccess(
          articles: articlesData
//          ArticleList(
//            articles: articlesData['articles'],
//            articlesCount: articlesData['articlesCount'],
//          )
      ));
    } catch (e) {
      print(e.toString());
      store.dispatch(ArticlesRequestFailure(error: e.toString()));
    }
  }

  void _fetchSuccess(Store<AppState> store, ArticlesFetchedSuccess action, NextDispatcher next) async {
    next(action);
    store.dispatch(ArticlesLoaded(
        articles: ArticleList.fromJson(action.articles
//          articles: action.articles['articles'].cast<Article>(),
//          articlesCount: action.articles['articlesCount']
        ),
    ));
  }

}