import 'dart:async';
import 'dart:core';

import 'package:onigiri_app/utils/web_client.dart';

class Repository {
  final WebClient client;

  const Repository({this.client = const WebClient()});

  Future<Map<String, dynamic>> login(String email, String password) async {
    final Map<String, dynamic> credentials = {
      'user': {
        'email': email,
        'password': password,
      }
    };
    return await client.post('/users/login', credentials);
  }
}
