import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

@JsonSerializable()
class Author {
  final String username;
  final String images;
  final bool following;

  Author({
    this.username,
    this.images,
    this.following,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      username: json['username'],
      images: json['images'],
      following: json['following'],
    );
  }

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
