import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

class WebClient {
  static String baseUrl = 'http://192.168.178.36:7001';

  const WebClient();

  Future<dynamic> get(String path) async {
    final http.Response response = await http.Client().get('$baseUrl$path');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('An error occured: ' + response.body);
    }
  }

  Future<dynamic> post(String path, Map<String, dynamic> data) async {
    final http.Response response = await http.Client().post(
      '$baseUrl$path',
      body: jsonEncode(data),
      headers: {'content-type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('An error occured: ' + response.body);
    }
  }
}
