// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
      slug: json['slug'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      body: json['body'] as String,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
//      tagList: json['tagList'] as List,
      favoritesCount: json['favoritesCount'] as int,
      favorited: json['favorited'] as bool);
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'slug': instance.slug,
      'title': instance.title,
      'description': instance.description,
      'body': instance.body,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'author': instance.author,
//      'tagList': instance.tagList,
      'favoritesCount': instance.favoritesCount,
      'favorited': instance.favorited
    };
