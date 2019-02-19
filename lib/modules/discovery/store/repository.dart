import 'dart:async';
import 'dart:core';

import 'package:onigiri_app/utils/web_client.dart';

class Repository {
  final WebClient client;

  const Repository({this.client = const WebClient()});

  Future<Map<String, dynamic>> getArticles() async {

    return await client.get('/articles');
  }
}
