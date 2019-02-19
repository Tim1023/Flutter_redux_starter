// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return Author(
      username: json['username'] as String,
      images: json['images'] as String,
      following: json['following'] as bool);
}

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'username': instance.username,
      'images': instance.images,
      'following': instance.following
    };
