import 'package:json_annotation/json_annotation.dart';
import 'package:onigiri_app/modules/discovery/models/article.dart';

part 'article_list.g.dart';

@JsonSerializable()
class ArticleList {
  List<Article> articles;
  int articlesCount;

  ArticleList({this.articles, this.articlesCount});

  factory ArticleList.fromJson(Map<String, dynamic> parsedJson){
    var list = parsedJson['articles'] as List;
    print("&&&&&&&&&&&&&&&&&&&&&&&&&"+list.runtimeType.toString());
    List<Article> articleList = list.map((i) => Article.fromJson(i)).toList();

    return ArticleList(
        articlesCount: parsedJson['articlesCount'],
        articles: articleList);
  }

//      _$ArticleListFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleListToJson(this);
}
