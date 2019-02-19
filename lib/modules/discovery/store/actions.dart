
import 'package:onigiri_app/modules/discovery/models/article_list.dart';

class FetchArticlesRequest {}

class ArticlesFetchedSuccess {
  final Map<String, dynamic> articles;

  ArticlesFetchedSuccess({this.articles});
}

class ArticlesLoaded {
  final ArticleList articles;

  ArticlesLoaded({this.articles});
}

class ArticlesRequestFailure {
  final String error;

  ArticlesRequestFailure({this.error});
}
