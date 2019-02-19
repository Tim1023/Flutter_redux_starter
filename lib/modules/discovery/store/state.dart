import 'package:flutter/material.dart';
import 'package:onigiri_app/modules/discovery/models/article_list.dart';

@immutable
class DiscoveryState {
  final bool isLoading;
  final String error;
  final articles;

  DiscoveryState({
    this.isLoading,
    this.error,
    this.articles,
  });

  factory DiscoveryState.initial() {
    return DiscoveryState(
      isLoading: false,
    );
  }

  DiscoveryState copyWith({
    ArticleList articles,
    bool isLoading,
    bool isAuthenticated,
    String error
  }) {
    return DiscoveryState(
      articles: articles ?? this.articles,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}