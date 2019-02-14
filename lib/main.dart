import 'package:flutter/material.dart';
import 'package:onigiri_app/store/state.dart';
import 'package:redux/redux.dart';
import 'app.dart';
import 'store/store.dart';

void main() {
  final Store<AppState> store = createStore();
  runApp(App(store));
}