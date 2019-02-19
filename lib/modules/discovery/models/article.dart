import 'package:json_annotation/json_annotation.dart';
import 'package:onigiri_app/modules/discovery/models/author.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  final String slug;
  final String title;
  final String description;
  final String body;
  final DateTime updatedAt;
  final DateTime createdAt;
  final Author author;
//  final List tagList;
  final int favoritesCount;
  final bool favorited;

  Article(
      {this.slug,
      this.title,
      this.description,
      this.body,
      this.updatedAt,
      this.createdAt,
      this.author,
//      this.tagList,
      this.favoritesCount,
      this.favorited});

  factory Article.fromJson(Map<String, dynamic> json){
    return Article(
      slug: json['slug'],
      title: json['title'],
      description: json['description'],
      body: json['body'],
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      author: Author.fromJson(json['author']),
//      tagList: json['tagList'],
      favoritesCount: json['favoritesCount'],
      favorited: json['favorited']
    );
  }

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
