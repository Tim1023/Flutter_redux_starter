import 'package:flutter/material.dart';
import 'package:onigiri_app/layouts/main_layout.dart';
import 'package:onigiri_app/store/state.dart';
import 'package:onigiri_app/utils/themes.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';



class App extends StatelessWidget {
  final Store<AppState> store;

  const App(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Onigiri',
          routes: <String, WidgetBuilder>{
            '/': (BuildContext context) => MainLayout()
          },
          theme: kShrineTheme, // New code
        ));
  }
}
