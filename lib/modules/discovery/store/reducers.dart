import 'package:onigiri_app/modules/discovery/store/actions.dart';
import 'package:onigiri_app/modules/discovery/store/state.dart';
import 'package:redux/redux.dart';



Reducer<DiscoveryState> discoveryReducers = combineReducers([
  TypedReducer<DiscoveryState, FetchArticlesRequest>(_fetchArticlesRequestReducer),
  TypedReducer<DiscoveryState, ArticlesFetchedSuccess>(_articleFetchedSuccess),
  TypedReducer<DiscoveryState, ArticlesLoaded>(_articlesLoaded),
  TypedReducer<DiscoveryState, ArticlesRequestFailure>(_articleRequestFailure),
]);

DiscoveryState _fetchArticlesRequestReducer(DiscoveryState state, FetchArticlesRequest action) {
  return state.copyWith(
    isLoading: true,
  );
}

DiscoveryState _articleFetchedSuccess(DiscoveryState state, ArticlesFetchedSuccess action) {
  return state.copyWith(
    isLoading: false,
  );
}

DiscoveryState _articlesLoaded(DiscoveryState state, ArticlesLoaded action) {
  print(action.articles.toString());
  return state.copyWith(
    isLoading: false,
    isAuthenticated: true,
    articles: action.articles,
  );
}

DiscoveryState _articleRequestFailure(DiscoveryState state, ArticlesRequestFailure action) {
  return state.copyWith(
    isLoading: false,
    error: action.error,
  );
}